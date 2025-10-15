/*
 SearchPage.swift
 ----------------
 Page de recherche des marques.
 - Filtre par texte et par tags.
 - Liste les marques correspondantes, avec des "facts" intercalés.
 */

//  SearchPage.swift
//  FilVert
//
//  Created by Agathe Vernay on 16/09/2025.
//

import SwiftUI

struct SearchPage: View {
    /*
     Etats de recherche & filtres
     - selectedFilters: tags actifs pour filtrer les marques.
     - searchText: texte de recherche saisi par l'utilisateur.
     */
    @State private var selectedFilters: [Tag] = []
    @State var searchText: String = ""
    
    @State private var isExpanded: Bool = true
    @Namespace private var filterNamespace
    @State var generatedItems = [AnyView]()
    
    
    /*
     Données filtrées (marques)
     - Texte: si vide, tout passe; sinon, correspondance sur le nom de la marque.
     - Tags: si aucun tag sélectionné, tout passe; sinon, la marque doit contenir tous les tags sélectionnés.
     */

    var filteredData: [Brand] {
        brands.filter { brand in
            // Text filtering: if search is empty, accept all; otherwise check brand name
            let matchesSearch: Bool = searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            ? true
            : brand.name.rawValue.localizedCaseInsensitiveContains(searchText)
            
            // Tag filtering: if no filters selected, accept all; otherwise ensure brand contains all selected tags
            let matchesFilters: Bool = selectedFilters.isEmpty || selectedFilters.allSatisfy { brand.tags.contains($0) }
            
            return matchesSearch && matchesFilters
        }
    }
    
    func generateItem(){
        var items: [AnyView] = []
        var isFactFlags: [Bool] = []
        for brand in filteredData {
            // Toujours ajouter le vêtement
            items.append(AnyView(ExtractedSearchPage(brand: brand, fact: "")))
            isFactFlags.append(false)
            // Decide if we can add a fact after this clothing
            guard searchText.isEmpty else { continue }

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
            let factText = facts.randomElement() ?? ""
            items.append(AnyView(FactCard2(fact: factText)))
            isFactFlags.append(true)
        
            }
        
        generatedItems = items
    }
    
    
    var body: some View {
        
        /*
         Structure de la vue
         - NavigationStack -> ZStack -> VStack.
         - Rangée de filtres (tags) en haut, puis liste des marques scrollable.
         */
        NavigationStack {
            ZStack(alignment: .topLeading) {
                Color.floralWhite.ignoresSafeArea()
                
                VStack(spacing: 0) {
                    
                    ScrollView(showsIndicators: false) {
                        Spacer(minLength: 50)
                        VStack(alignment: .leading) {
                            ForEach(Array(generatedItems.enumerated()), id: \.offset) { index, brand in
                                
                                brand
                            }
                            HStack{
                                Spacer()
                                VStack {
                                    Text("Vous êtes arrivé·e à la fin de la page.")
                                    Text("Merci d’avoir choisi la mode responsable !")
                                }
                                .SFProFont(weight: .medium, size: 14)
                                .multilineTextAlignment(.center)
                                .padding(.vertical, 24)
                                Spacer()
                            }
                        }
                        .padding(.top, 16)
                    }
                }
                
                // Overlay: filter button + expanding tags
                Group {
                    if #available(iOS 26.0, *) {
                        

                        GlassEffectContainer(spacing: 12.0) {
                            HStack() {
                                //Toggle button (glass)
                                Button(action: { withAnimation { isExpanded.toggle() } }) {
                                    Image(systemName: "slider.vertical.3")
                                        .frame(width: 32, height: 44)
                                        .font(.system(size: 20, weight: .semibold))
                                }
                                .buttonStyle(.glass)
                                .zIndex(1)
                                .padding(.leading)
                                .glassEffectID("filter.toggle.search", in: filterNamespace)
                                
                                if isExpanded {
                                    
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 8) {
                                            ForEach(Array(Tag.allCases.enumerated()), id: \.element) { index, tag in
                                                Button {
                                                    withAnimation {
                                                        if selectedFilters.contains(tag) {
                                                            selectedFilters.removeAll { $0 == tag }
                                                        } else {
                                                            selectedFilters.append(tag)
                                                        }
                                                        
                                                        generateItem()
                                                    }
                                                } label: {
                                                    Text(tag.rawValue)
                                                        .padding(.vertical, 8)
                                                        .padding(.horizontal, 12)
                                                        .glassEffect(selectedFilters.contains(tag) ? .regular.tint(.terra).interactive() :
                                                                .regular.interactive())
                                                        .foregroundStyle(selectedFilters.contains(tag) ? .almostWhite : .deepGreen)
                                                    
                                                }
                                                .glassEffectID("filter.tag.\(tag.rawValue)", in: filterNamespace)
                                            }
                                        }
                                        .padding(.trailing, 4)
                                        
                                    }
                                }
                            }
                        }
                        
                        
                    } else {
                        // Fallback < iOS 26: plain circular button and plain tags
                        VStack(alignment: .leading, spacing: 8) {
                            Button(action: { withAnimation { isExpanded.toggle() } }) {
                                Image(systemName: "line.3.horizontal.decrease.circle")
                                    .foregroundStyle(.deepGreen)
                                    .frame(width: 44, height: 44)
                                    .background(Color.almostWhite.opacity(0.9))
                                    .clipShape(Circle())
                                    .shadow(radius: 3)
                            }
                            
                            if isExpanded {
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 10) {
                                        ForEach(Tag.allCases, id: \.self) { tag in
                                            Button {
                                                if selectedFilters.contains(tag) {
                                                    selectedFilters.removeAll { $0 == tag }
                                                } else {
                                                    selectedFilters.append(tag)
                                                }
                                            } label: {
                                                Text(tag.rawValue)
                                                    .padding(.vertical, 6)
                                                    .padding(.horizontal, 10)
                                                    .background(selectedFilters.contains(tag) ? Color.terra.opacity(0.8) : Color.almostWhite.opacity(0.8))
                                                    .foregroundStyle(selectedFilters.contains(tag) ? .almostWhite : .deepGreen)
                                                    .cornerRadius(12)
                                            }
                                        }
                                    }
                                    .padding(.trailing, 4)
                                }
                            }
                        }
                        .padding(.top, 8)
                        .padding(.leading, 20)
                        .background(Color.clear)
                    }
                }
                
            }
            /*
             Toolbar & navigation
             - Titre centré "Recherche" via .principal.
             */
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Marques")
                        .gupterFont(size:36)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        
            
        .accentColor(.terra)
        .onAppear{
            generateItem()
        }
        .searchable(text: $searchText, prompt: "Rechercher une marque")
        .onChange(of: searchText) {
            generateItem()
            
        }
        
    }
}

#Preview {
    SearchPage()
}

struct FactCard2: View {
    var fact: String
    var body: some View {
            HStack(alignment: .top) {
                VStack {
                    Image(systemName: "leaf.fill")
                        .gupterFont(size: 22)
                    Spacer(minLength: 0)
                }
                Text(fact)
                    .gupterFont(size: 22)
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal, 24)
            .padding(8)
            .padding(.bottom, 16)
    }
}
