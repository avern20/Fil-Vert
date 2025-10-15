//
//  AdviceCard.swift
//  FilVert
//
//  Created by apprenant83 on 19/09/2025.
//

import SwiftUI

struct AdviceCard: View {
    /*
     Etats & données
     - user: profil utilisateur (détermine les conseils morphologie).
     - cardOrder: ordre des cartes dans la pile (indices).
     - dragOffset / isDraggingTop: gestion du drag sur la carte du dessus.
    */
    @StateObject var user = users[0]
    @State private var cardOrder: [Int] = []
    @State private var dragOffset: CGSize = .zero
    @State private var isDraggingTop: Bool = false
    @State private var appearOffset: CGFloat = 0
    @State private var appearRotation: Double = 0
    /*
     Apparence des cartes
     - cardCount: nombre d'indices visibles dans la pile.
     - corner/ratio/size: style et dimensions de base.
    */
    let cardCount: Int = 14

    let cardCornerRadius: CGFloat = 16
    let cardAspectRatio: CGFloat = 1.0
    let cardSize: CGFloat = 300

    /*
     Source des conseils
     - tips: conseils génériques (éco-responsables).
     - allTips: agrégation des conseils morphologie + génériques selon l'utilisateur.
    */
    var tips: [String] = ecoFriendlyTips
    
    var allTips: [String] {
        switch user.morphology {
        case .a: return fashionTipsBodyShapeA + tips
        case .o: return fashionTipsBodyShapeO + tips
        case .h: return fashionTipsBodyShapeH + tips
        case .v: return fashionTipsBodyShapeV + tips
        case .x: return fashionTipsBodyShapeX + tips
        }
    }

    /*
     Initialisation
     - Initialise l'ordre des cartes de 0 à cardCount-1.
    */
    init() {
        _cardOrder = State(initialValue: Array(0..<cardCount))
    }

    var body: some View {
        /*
         Rendu
         - Superpose les cartes (ZStack) selon cardOrder.
         - La carte du dessus est draggable et peut être swipée pour passer en bas de pile.
        */
        ZStack {
            ForEach(Array(cardOrder.enumerated()), id: \.element) { enumerated in
                let indexInStack = enumerated.offset // 0 is bottom, last is top
                let cardIndex = enumerated.element
                let isTop = indexInStack == cardOrder.count - 1

                CardView(text: allTips[safe: cardIndex] ?? allTips.randomElement() ?? "Conseil éco-responsable")
                    .rotationEffect(.degrees(dynamicRotation(for: indexInStack)))
                    .offset(dynamicOffset(for: indexInStack))
                    .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 4)
                    .zIndex(Double(indexInStack))
                    .modifier(TopCardDragModifier(isTop: isTop,
                                                  dragOffset: $dragOffset,
                                                  isDraggingTop: $isDraggingTop,
                                                  onSwipedAway: { direction in
                        swipeTopCardAway(direction: direction)
                    }))
                    .offset(x: isTop ? appearOffset : 0)
                    .rotationEffect(.degrees(isTop ? appearRotation : 0))
            }
        }
        .frame(width: cardSize, height: cardSize)
        .animation(.spring(response: 0.35, dampingFraction: 0.85, blendDuration: 0.1), value: cardOrder)
        .animation(.spring(response: 0.25, dampingFraction: 0.9, blendDuration: 0.1), value: dragOffset)
        .onAppear { // annimation d'apparition
            withAnimation(.easeInOut(duration: 0.25)) {
                appearOffset = -80
                appearRotation = -8
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                withAnimation(.easeInOut(duration: 0.25)) {
                    appearOffset = 0
                    appearRotation = 0
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    withAnimation(.easeInOut(duration: 0.25)) {
                        appearOffset = 80
                        appearRotation = 8
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            appearOffset = 0
                            appearRotation = 0
                        }
                    }
                }
            }
        }


    }

    /*
     Helpers de layout
     - rotation/offset de base pour un effet "pile".
     - versions dynamiques qui réagissent au drag de la carte du dessus.
    */
    // MARK: - Layout helpers

    private func rotation(for index: Int) -> Double {
        // Smaller, tidy angles to look more "rangé"
        let angles: [Double] = [-3, -1.5, 1.5, 3]
        return angles[index % angles.count]
    }

    private func offset(for index: Int) -> CGSize {
        // subtle staggered offsets
        let offsets: [CGSize] = [
            CGSize(width: -8, height: -8),
            CGSize(width: 6, height: -2),
            CGSize(width: -4, height: 10),
            CGSize(width: 10, height: 14)
        ]
        return offsets[index % offsets.count]
    }

    private func dynamicRotation(for indexInStack: Int) -> Double {
        // Use base rotation for each layer, add a small rotation while dragging the top card
        let base = rotation(for: indexInStack)
        let isTop = indexInStack == cardOrder.count - 1
        guard isTop else { return base }
        let extra = Double(dragOffset.width / 20) // slight rotation with horizontal drag
        return base + extra
    }

    private func dynamicOffset(for indexInStack: Int) -> CGSize {
        var base = offset(for: indexInStack)
        let isTop = indexInStack == cardOrder.count - 1
        if isTop {
            base.width += dragOffset.width
            base.height += dragOffset.height
        }
        // Slight lift for cards above bottom when dragging to accent depth
        if isDraggingTop, !isTop {
            base.height -= 2
        }
        return base
    }

    private func swipeTopCardAway(direction: SwipeDirection) {
        guard !cardOrder.isEmpty else { return }
        // Remove the top (last) index
        var newOrder = cardOrder
        let top = newOrder.removeLast()
        // Reinsert at the bottom (front of array)
        newOrder.insert(top, at: 0)
        cardOrder = newOrder
        dragOffset = .zero
        isDraggingTop = false
    }
}

private enum SwipeDirection { case left, right, up, down }

/*
 TopCardDragModifier
 - Gère le DragGesture sur la carte du dessus.
 - Seuil de déclenchement, direction dominante, animation hors-écran, rappel onSwipedAway.
*/
private struct TopCardDragModifier: ViewModifier {
    let isTop: Bool
    @Binding var dragOffset: CGSize
    @Binding var isDraggingTop: Bool
    let onSwipedAway: (SwipeDirection) -> Void

    private let threshold: CGFloat = 120 // distance to trigger dismissal

    func body(content: Content) -> some View {
        content
            .gesture(
                DragGesture()
                    .onChanged { value in
                        guard isTop else { return }
                        isDraggingTop = true
                        dragOffset = value.translation
                    }
                    .onEnded { value in
                        guard isTop else { return }
                        let translation = value.translation
                        let direction = dominantDirection(from: translation)
                        if max(abs(translation.width), abs(translation.height)) > threshold {
                            // animate off-screen in the swipe direction, then reinsert
                            withAnimation(.spring(response: 0.25, dampingFraction: 0.85)) {
                                dragOffset = offscreenOffset(for: direction, from: translation)
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.18) {
                                onSwipedAway(direction)
                            }
                        } else {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.9)) {
                                dragOffset = .zero
                                isDraggingTop = false
                            }
                        }
                    }
            )
    }

    private func dominantDirection(from translation: CGSize) -> SwipeDirection {
        if abs(translation.width) > abs(translation.height) {
            return translation.width >= 0 ? .right : .left
        } else {
            return translation.height >= 0 ? .down : .up
        }
    }

    private func offscreenOffset(for direction: SwipeDirection, from translation: CGSize) -> CGSize {
        let magnitude: CGFloat = 600
        switch direction {
        case .left: return CGSize(width: -magnitude, height: translation.height)
        case .right: return CGSize(width: magnitude, height: translation.height)
        case .up: return CGSize(width: translation.width, height: -magnitude)
        case .down: return CGSize(width: translation.width, height: magnitude)
        }
    }
}

/*
 CardView
 - Carte individuelle avec fond clair, bord léger et texte centré.
*/
private struct CardView: View {
    let text: String
    private let cornerRadius: CGFloat = 16

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .fill(.almostWhite)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                        .stroke(Color.black.opacity(0.06), lineWidth: 1)
                )
                .aspectRatio(1.0, contentMode: .fit)
            VStack {
                Image(systemName: "leaf.fill")
                    .gupterFont(size: 26)
                
                Text(text)
                    .SFProFont(weight: .regular, size: 19)
                    .multilineTextAlignment(.center)
                    .padding(20)
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel(Text(text))
        .zIndex(10)
    }
}

/*
 Helper: safe index sur Collection
 - Evite les crashs si l'indice est hors bornes.
*/
private extension Collection {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}

#Preview {
        AdviceCard()
}
