/*
 SuggestionPage.swift
 --------------------
 Page de suggestions personnalisées.
 - Filtre par type de vêtement.
 - Adapte les résultats au profil utilisateur (sexe, morphologie, styles).
 - Alterne cartes produit et cartes "fact" dans une grille.
 */

//
//  RecommandationPage.swift
//  FilVert
//
//  Created by Amina on 16/09/2025.
//

import SwiftUI

struct SuggestionPage: View {
    /*
     Etats & modèle utilisateur
     - user: profil utilisateur utilisé pour filtrer les vêtements.
     - searchText: (réservé) champ de recherche éventuel.
     - selectedFilters: types de vêtements sélectionnés.
     */
    @State var searchText: String = ""
    @StateObject var user = users[0]
    @State var selectedFilters: [TypeClothe] = []
    @State private var isExpanded: Bool = true
    @Namespace private var filterNamespace
    @State var generatedItems = [AnyView]()
    
    @State private var hasScrolled: Bool = false
    /*
     Données filtrées (vêtements)
     - Filtre par type (selectedFilters).
     - Contrainte "goodForUser": sexe, morphologie et style adaptés à l'utilisateur.
     */
    var filteredData: [Clothe] {
        clothes.filter { cloth in
            let matchesFilters: Bool = selectedFilters.isEmpty ||
            selectedFilters.contains(cloth.type)
            
            let goodForUser: Bool = (user.sexe.rawValue == "Non-binaire" || user.sexe.rawValue == cloth.womenOrMensWear.rawValue) && cloth.morphologyFit.contains(user.morphology) && user.styles.contains { cloth.style.contains($0) }
            
            return matchesFilters && goodForUser
            
        }
    }
    
    
    /*
     Grille alternée (vêtements + facts)
     - Construit un tableau alternant SuggestionRow et FactCard.
     - Ajoute aléatoirement une FactCard (si pas de recherche en cours).
     */
    //  var gridItems: [AnyView] {
    func generateItem(){
        var items: [AnyView] = []
        var isFactFlags: [Bool] = []
        for clothe in filteredData {
            // Toujours ajouter le vêtement
            items.append(AnyView(SuggestionRow(clothe: clothe, fact: "")))
            isFactFlags.append(false)
            // Decide if we can add a fact after this clothing
            //            guard searchText.isEmpty else { continue }
            
            // Random chance (similar to before but controllable)
            let shouldTryInsertFact = Bool.random()
            if !shouldTryInsertFact { continue }
            
            // If we add a fact now, its index would be `items.count` (after appending clothing)
            let prospectiveIndex = items.count
            
            // Constraint 1: avoid horizontal adjacency (previous item being a fact)
            if let lastIsFact = isFactFlags.last, lastIsFact { continue }
            
            // Constraint 2: avoid vertical adjacency (same column one row above)
            // In a 2-column grid, the item two positions before shares the same column.
            if prospectiveIndex >= 2 {
                let indexTwoBefore = prospectiveIndex - 2
                if isFactFlags[indexTwoBefore] { continue }
            }
            
            // Passed constraints: insert a fact
            let factText = shortfacts.randomElement() ?? ""
            items.append(AnyView(FactCard(text: factText)))
            isFactFlags.append(true)
            
        }
        
        generatedItems = items
    }
    
    
    
    var body: some View {
        /*
         Structure de la vue
         - NavigationStack -> ZStack -> VStack.
         - En-tête d'introduction, barre de filtres horizontale, grille de résultats, texte de fin.
         */
        NavigationStack {
            ZStack {
                Color.floralWhite.ignoresSafeArea()
                
                
                VStack{
                    
                    ZStack(alignment: .topLeading) {
                        // Sous-texte qui disparait en scrollant
                        if !hasScrolled {
                            Text("Ce que vous portez raconte une histoire, choisissez celle qui protège la planète.")
                                .SFProFont(weight: .regular, size: 17)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(.horizontal)
                                .multilineTextAlignment(.center)
                                .zIndex(1)
                                .transition(.move(edge: .top).combined(with: .opacity))
                        }
                        //FILTRES
                        if #available(iOS 26.0, *) {
                            GlassEffectContainer(spacing: 12.0) {
                                HStack() {
                                    //Toggle button (glass)
                                    Button(action: {
                                        
                                        withAnimation {
                                            isExpanded.toggle()
                                        }
                                    }) {
                                        Image(systemName: "slider.vertical.3")
                                            .frame(width: 32, height: 44)
                                            .font(.system(size: 20, weight:  .semibold))
                                    }
                                    .buttonStyle(.glass)
                                    .zIndex(10)
                                    .padding(.leading)
                                    .glassEffectID("filter.toggle.search", in: filterNamespace)
                                    
                                    if isExpanded {
                                        ScrollView(.horizontal, showsIndicators: false) {
                                            HStack(spacing: 8) {
                                                ForEach(TypeClothe.allCases, id: \.self) { type in
                                                    
                                                    Button {
                                                        
                                                        withAnimation {
                                                            if selectedFilters.contains(type) {
                                                                
                                                                selectedFilters.removeAll { $0 == type }
                                                            } else {
                                                                
                                                                selectedFilters.append(type)
                                                            }
                                                            
                                                            generateItem()
                                                        }
                                                    } label: {
                                                        Text(type.rawValue)
                                                            .padding(.vertical, 8)
                                                            .padding(.horizontal, 12)
                                                            .glassEffect(selectedFilters.contains(type) ? .regular.tint(.terra).interactive() :
                                                                    .regular.interactive())
                                                            .foregroundStyle(selectedFilters.contains(type) ? .almostWhite : .deepGreen)
                                                        
                                                    }
                                                    .zIndex(999)
                                                    .glassEffectID("filter.tag.\(type.rawValue)", in: filterNamespace)
                                                }
                                            }
                                        }
                                    }
                                    Spacer()
                                }
                            }.zIndex(10)
                                .padding(.top, hasScrolled ? 0 : 50)
                            
                        } else {
                            ScrollView(.horizontal, showsIndicators: false) {
                                
                                HStack {
                                    ForEach(TypeClothe.allCases, id: \.self) { type in
                                        Button {
                                            withAnimation {
                                                if selectedFilters.contains(type) {
                                                    selectedFilters.removeAll { $0 == type }
                                                } else {
                                                    selectedFilters.append(type)
                                                }
                                            }
                                        } label: {
                                            Text(type.rawValue)
                                                .padding(8)
                                                .background(selectedFilters.contains(type) ? Color.terra.opacity(0.8) : Color.almostWhite.opacity(0.8))
                                                .foregroundStyle(selectedFilters.contains(type) ? .almostWhite : .deepGreen)
                                                .cornerRadius(16)
                                        }
                                    }
                                }
                                .padding(.horizontal, 20)
                                .padding(.vertical, 8)
                                
                            }
                            .background(Color.floralWhite.opacity(0.95))
                        }
                        ScrollView(.vertical) {
                            Spacer(minLength: 130)
                            VStack(spacing: 0) {
                                
                                // Grille
                                LazyVGrid(
                                    columns: [GridItem(.flexible()), GridItem(.flexible())],
                                    spacing: 40
                                ) {
                                    ForEach(Array(generatedItems.enumerated()), id: \.offset) { _, item in
                                        item
                                    }
                                }
                                .padding(.horizontal)
                                
                                // Texte de fin
                                VStack {
                                    Spacer()
                                    filteredData.isEmpty ? Text("Aucun vêtement ne correspond à vos critères.\n Essayez d'élargir votre sélection.") :
                                    Text("Vous êtes arrivé·e à la fin de la page. \n Merci d’avoir choisi la mode responsable !")
                                    
                                }
                                .SFProFont(weight: .medium, size: 14)
                                .multilineTextAlignment(.center)
                                .padding(.top, 24)
                            }
                            .background {
                            }
                            .coordinateSpace(name: "SuggestionScroll")
                            .onAppear{
                                generateItem()
                            }
                        }.onScrollGeometryChange(for: CGFloat.self) { proxy in
                            proxy.contentOffset.y
                        } action: { y, _  in
                            withAnimation(.easeInOut) {
                                hasScrolled = y > 5 // ICI : règle le seuil comme tu veux
                            }
                        }
                    }.zIndex(10)
                    
                }
            }.toolbar {
                ToolbarItem(placement: .principal) {
                    VStack(alignment: .center, spacing: 8) {
                        Text("Bonjour \(user.name)!")
                            .gupterFont(size: 36)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.top, 10)
                            .padding(.vertical, 8)
                        
                        
                    }
                    
                    .animation(.default, value: hasScrolled)
                }
            }
            .scrollIndicators(.hidden)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SuggestionPage()
}

