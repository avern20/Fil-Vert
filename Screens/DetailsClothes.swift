//
//  DetailsClothes.swift
//  FilVert
//
//  Created by apprenant83 on 18/09/2025.
//

import SwiftUI

struct DetailsClothes: View {
    let clothe : Clothe
    @Environment(\.openURL) var openURL
    var body: some View {
        ZStack{
            Color.floralWhite.ignoresSafeArea()
            
            VStack(alignment: .leading) {
                ScrollView(showsIndicators: false) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(.almostWhite)
                            .aspectRatio(1, contentMode : .fit)
                            .overlay(
                                Image(clothe.image)
                                    .resizable()
                                    .scaledToFill()
                                //.padding(8)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        
                        
                    }//.aspectRatio(1.0, contentMode: .fit)
                    .padding()
                    VStack(alignment: .leading, spacing: 0) {
                        TagFlow(spacing: 8, lineSpacing: 8) {
                            ForEach(clothe.tags, id: \.self) { tag in
                                Text(tag.rawValue).textCase(.uppercase)
                                    .SFProFont(weight: .mediumTerra, size: 14)
                                    .padding(.vertical, 6)
                                    .padding(.horizontal, 10)
                                    .background(Color.terra.opacity(0.18))
                                    .foregroundStyle(.deepGreen)
                                    .cornerRadius(8)
                            }
                        }
                    }.padding(.horizontal)
                    
                    HStack {
                        Text(clothe.name)
                            .foregroundStyle(.deepGreen)
                            .gupterFont(size: 36)
                        
                        Spacer()
                        Text("\(clothe.price, specifier: "%.2f")€")
                            .SFProFont(weight: .regular, size: 24)
                    }.padding()
                    
                    VStack(alignment: .leading, spacing: 16){
                        HStack{
                            Text("De")
                                .SFProFont(weight: .regular, size: 19)
                            Text(clothe.brand.rawValue)
                                .SFProFont(weight: .bold, size: 19)
                            
                            Spacer()
                        }
                        
                        
                        Text(clothe.description)
                            .SFProFont(weight: .regular, size: 19)
                        
                        
                        Text(clothe.material)
                            .SFProFont(weight: .regular, size: 19)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 100)
                }
                .overlay(
                    Group {
                        if let brand = brands.first(where: { $0.name == clothe.brand }),
                           let url = URL(string: brand.link) {
                            if #available(iOS 26.0, *) {
                                Button {
                                    openURL(url)
                                } label: {
                                    HStack {
                                        Spacer()
                                        Text("Acceder à \(clothe.brand.rawValue)")
                                            
                                        Spacer(minLength: 16)
                                        Image(systemName: "rectangle.portrait.and.arrow.forward")
                                           
                                    }.font(.custom("SFProDisplay-Medium", size: 20)).foregroundColor(.white).bold()
                                    .padding(.horizontal)
                                }
                                .buttonStyle(.glassProminent)
                                .tint(Color.terra)
                                .padding()
                            } else {
                                Button {
                                    openURL(url)
                                } label: {
                                    HStack {
                                        Spacer()
                                        Text("Acceder à \(clothe.brand.rawValue)")
                                        Spacer()
                                        Image(systemName: "rectangle.portrait.and.arrow.forward")
                                    }
                                    .font(.custom("SF Pro Text", size: 20)).foregroundColor(.white).bold()
                                    //.SFProFont(weight: .boldBlanc, size: 20)
                                    .padding()
                                    .background(.terra)
                                    .cornerRadius(22)
                                    .cornerRadius(12)
                                    .padding(.horizontal)
                                }
                                .padding(.vertical)
                            }
                        }
                    },
                    alignment: .bottom
                )
            }
        }
        .toolbar(.hidden, for: .tabBar)
    }
}


/*
 TagFlow (Layout personnalisé)
 - Dispose des vues en lignes successives (wrap) avec espacements configurables.
 - Utilisé pour afficher les tags du shop dans la fiche détaillée.
*/
private struct TagFlow: Layout {
    var spacing: CGFloat = 8
    var lineSpacing: CGFloat = 8

    init(spacing: CGFloat = 8, lineSpacing: CGFloat = 8) {
        self.spacing = spacing
        self.lineSpacing = lineSpacing
    }

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let maxWidth = proposal.width ?? .infinity
        var x: CGFloat = 0
        var y: CGFloat = 0
        var lineHeight: CGFloat = 0

        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            if x > 0 && x + size.width > maxWidth {
                x = 0
                y += lineHeight + lineSpacing
                lineHeight = 0
            }
            lineHeight = max(lineHeight, size.height)
            x += size.width + spacing
        }
        return CGSize(width: maxWidth, height: y + lineHeight)
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        var x: CGFloat = bounds.minX
        var y: CGFloat = bounds.minY
        var lineHeight: CGFloat = 0

        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            if x > bounds.minX && x + size.width > bounds.maxX {
                x = bounds.minX
                y += lineHeight + lineSpacing
                lineHeight = 0
            }
            subview.place(at: CGPoint(x: x, y: y), proposal: ProposedViewSize(width: size.width, height: size.height))
            x += size.width + spacing
            lineHeight = max(lineHeight, size.height)
        }
    }
}



#Preview {
    DetailsClothes(clothe: clothes[0])
}
