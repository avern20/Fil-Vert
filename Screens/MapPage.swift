//
//  MapPage.swift
//  FilVert
//
//  Created by Lora-Line on 16/09/2025.
//

/*
 MapPage.swift
 ----------------
 Vue principale affichant une carte avec des shops écologiques.
 - Affiche et anime des annotations personnalisées.
 - Propose une recherche textuelle et un filtrage par tags.
 - Présente une fiche détaillée (sheet) lorsque l'utilisateur sélectionne un shop.
*/

import SwiftUI
import MapKit

struct MapPage: View {
    /*
     Etats & propriétés d'interface
     - isSheetPresented / selectedShop: contrôle de la fiche détaillée du shop.
     - mapSpan / position: configuration et caméra de la carte MapKit.
     - searchText: texte saisi dans la barre de recherche.
     - selectedFilters: liste des tags actifs pour filtrer les shops.
    */
    @State var isSheetPresented = false
    
    @State private var mapSpan = MKCoordinateSpan(latitudeDelta: 0.06, longitudeDelta: 0.06)
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 50.6368, longitude: 3.0619),
            span: MKCoordinateSpan(latitudeDelta: 0.06, longitudeDelta: 0.06)
        )
    )
    @State var searchText: String = ""
    @State var selectedShop: Shop? = nil
    
    @State private var selectedFilters: [Tag] = []

    @State private var isExpanded: Bool = false
    @Namespace private var filterNamespace
    /*
     Données filtrées (shops)
     - Filtre par texte: correspondance sur le nom du shop.
     - Filtre par tags: tous les tags sélectionnés doivent être présents sur le shop.
    */
    var filteredData: [Shop] {
        shopsEcoLille.filter { shop in
            // Filtrage par texte
            let matchesSearch = searchText.isEmpty || shop.name.localizedCaseInsensitiveContains(searchText)
            
            // Filtrage par tags
            let matchesFilters = selectedFilters.isEmpty || selectedFilters.allSatisfy { shop.tags.contains($0) }
            
            return matchesSearch && matchesFilters
        }
    }
    
    /*
     Structure de la vue
     - NavigationStack: gère la navigation et la barre de titre.
     - ZStack: superpose la carte et la barre de filtres.
     - Map: affiche les annotations pour chaque shop filtré.
    */
    var body: some View {
        NavigationStack {
            ZStack {
                
                /*
                 Carte & annotations
                 - Pour chaque shop filtré, on place une annotation cliquable.
                 - Au clic: recadrage de la carte avec animation, ouverture de la fiche (sheet).
                 */
                Map(position: $position) {
                    ForEach(filteredData) { shop in
                        Annotation(shop.name, coordinate: shop.coordinates) {
                            Button {
                                
                                // span souhaité (peut être mapSpan ou un autre)
                                let desiredSpan = MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.008)
                                
                                // Calcul pour que le shop apparaisse à 3/4 depuis le haut :
                                let offsetLat = shop.coordinates.latitude - 0.0025  // ajuste ce chiffre selon le rendu
                                let newCenter = CLLocationCoordinate2D(latitude: offsetLat,
                                                                       longitude: shop.coordinates.longitude)
                                
                                
                                withAnimation(.easeInOut(duration: 0.6)) {
                                    position = .region(MKCoordinateRegion(center: newCenter, span: desiredSpan))
                                }
                                selectedShop = shop
                                isSheetPresented = true
                            } label: {
                                
                                /*
                                 Apparence du pin personnalisé (logo dans un cercle avec effet glass si disponible)
                                 */
                                ZStack {
                                    if #available(iOS 26.0, *) {
                                        Circle()
                                            .fill(.almostWhite)
                                            .frame(width: 48, height: 48)
                                        
                                            .glassEffect()
                                    } else {
                                        // Fallback on earlier versions
                                        Circle()
                                            .fill(.almostWhite)
                                            .frame(width: 48, height: 48)
                                            .shadow(radius: 4)
                                    }
                                    Image(shop.logo)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 44, height: 44)
                                        .clipShape(Circle())
                                }
                            }
                        }
                    }
                }
                .ignoresSafeArea()
                /*
                 Barre de filtres (horizontale)
                 - Affiche tous les tags disponibles sous forme de boutons.
                 - Chaque appui ajoute/retire le tag de selectedFilters.
                 */
                if #available(iOS 26.0, *) {
                    
                    VStack(alignment: .leading){
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
                                                    if selectedFilters.contains(tag) {
                                                        selectedFilters.removeAll { $0 == tag }
                                                    } else {
                                                        selectedFilters.append(tag)
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
                                    }
                                }
                                Spacer()
                            }
                        }
                        Spacer()
                    }
                    
                } else {
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(Tag.allCases, id: \.self) { tag in
                                    Button {
                                        if selectedFilters.contains(tag) {
                                            selectedFilters.removeAll { $0 == tag }
                                        } else {
                                            selectedFilters.append(tag)
                                        }
                                    } label: {
                                        if #available(iOS 26.0, *) {
                                            Text(tag.rawValue)
                                                .padding(8)
                                                .background(selectedFilters.contains(tag) ? Color.terra.opacity(0.8) : Color.almostWhite.opacity(0.8))
                                                .foregroundStyle(selectedFilters.contains(tag) ? .almostWhite : .deepGreen)
                                                .cornerRadius(16)
                                                .glassEffect()
                                        } else {
                                            Text(tag.rawValue)
                                                .padding(8)
                                                .background(selectedFilters.contains(tag) ? Color.terra.opacity(0.8) : Color.almostWhite.opacity(0.8))
                                                .foregroundStyle(selectedFilters.contains(tag) ? .almostWhite : .deepGreen)
                                                .cornerRadius(16)
                                        }
                                    }
                                }
                            }
                            .padding()
                        }
                        Spacer()
                    }
                    .offset(y: -18)
                }
            }
            
                /*
                 Toolbar & navigation
                 - Titre centré "Carte" via .principal.
                 - .searchable: recherche sur le nom des shops.
                */
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Magasins")
                            .gupterFont(size:36)
                    }
                }
                    .navigationTitle("Carte")
                    .navigationBarTitleDisplayMode(.inline)
                    .searchable(text: $searchText, prompt: "Rechercher un magasin")
                    .sheet(isPresented: Binding(
                        get: { selectedShop != nil },
                        set: { if !$0 { selectedShop = nil } }
                    )) {
                        if let shop = selectedShop {
                            /*
                             Fiche détaillée du shop (Sheet)
                             - En-tête avec bouton de fermeture et nom du shop.
                             - Sections: adresse, horaires, bon à savoir.
                            */
                            VStack {
                                ZStack {
                                    HStack {
                                        Button {
                                            selectedShop = nil
                                        } label: {
                                            if #available(iOS 26.0, *) {
                                                Image(systemName: "xmark").font(.system(size: 28)).foregroundStyle(.deepGreen)
                                                    .frame(width: 48, height: 48)
                                                    .glassEffect()
                                            } else {
                                                Image(systemName: "xmark").font(.system(size: 28)).foregroundStyle(.deepGreen)
                                                    .frame(width: 48, height: 48)
                                                .background(.almostWhite.opacity(0.7))
                                                .cornerRadius(100)
                                                .padding(.leading)
                                            }
                                               
                                        }
                                        Spacer()
                                    }
                                    Spacer()
                                    Text(shop.name).SFProFont(weight: .medium, size: 22)
                                    Spacer()
                                    
                                }.padding()
                                
                                /*
                                 Tags du shop (flow layout)
                                 - Affiche les tags associés sous forme de puces.
                                */
                                VStack(alignment: .leading, spacing: 0) {
                                    TagFlow(spacing: 8, lineSpacing: 8) {
                                        ForEach(shop.tags, id: \.self) { tag in
                                            Text(tag.rawValue).textCase(.uppercase)
                                                .SFProFont(weight: .mediumTerra, size: 14)
                                                .padding(.vertical, 6)
                                                .padding(.horizontal, 10)
                                                .background(Color.terra.opacity(0.18))
                                                .foregroundStyle(.deepGreen)
                                                .cornerRadius(8)
                                        }
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.bottom, 4)
                                
                                
                                ScrollView{
                                    if #available(iOS 26.0, *) {
                                        HStack {
                                            Image(systemName: "mappin.and.ellipse").padding(.horizontal).font(.system(size: 24)).foregroundStyle(.deepGreen)
                                            VStack(alignment: .leading) {
                                                Text(shop.name).SFProFont(weight: .bold, size: 22)
                                                
                                                Text(shop.adress).SFProFont(weight: .regular, size: 19)
                                            }.padding(.vertical)
                                            Spacer()
                                        }.glassEffect(in: .rect(cornerRadius: 16.0))
                                            .padding(.horizontal)
                                    } else {
                                        HStack {
                                            Image(systemName: "mappin.and.ellipse").padding(.horizontal).font(.system(size: 24)).foregroundStyle(.deepGreen)
                                            VStack(alignment: .leading) {
                                                Text(shop.name).SFProFont(weight: .bold, size: 22)
                                                
                                                Text(shop.adress).SFProFont(weight: .regular, size: 19)
                                            }.padding(.vertical)
                                            Spacer()
                                        }.background(.almostWhite.opacity(0.5))
                                        .cornerRadius(16)
                                        .padding(.horizontal)
                                    }
                                    Text("Horaires").padding(.top).SFProFont(weight: .mediumMidGreen, size: 19)
                                    if #available(iOS 26.0, *) {
                                        HStack {
                                            Image(systemName: "calendar").padding(.horizontal).font(.system(size: 24)).foregroundStyle(.deepGreen)
                                            VStack(alignment: .leading) {
                                                ForEach(shop.openingHours, id: \.self) { hour in
                                                    Text(hour).SFProFont(weight: .regular, size: 19)}
                                            }
                                            Spacer()
                                        }.padding(.vertical)
                                            .glassEffect(in: .rect(cornerRadius: 16.0))
                                            .padding(.horizontal)
                                    } else {
                                        HStack {
                                            Image(systemName: "calendar").padding(.horizontal).font(.system(size: 24)).foregroundStyle(.deepGreen)
                                            VStack(alignment: .leading) {
                                                ForEach(shop.openingHours, id: \.self) { hour in
                                                    Text(hour).SFProFont(weight: .regular, size: 19)}
                                            }
                                            Spacer()
                                        }.padding(.vertical)
                                        .background(.almostWhite.opacity(0.5))
                                        .cornerRadius(16)
                                        .padding(.horizontal)
                                    }
                                    
                                    
                                    Text("Bon à savoir").padding(.top).SFProFont(weight: .mediumMidGreen, size: 19)
                                    if #available(iOS 26.0, *) {
                                        HStack {
                                            Image(systemName: "info").padding(.horizontal).font(.system(size: 24)).foregroundStyle(.deepGreen)
                                            VStack(alignment: .leading) {
                                                ForEach(shop.goodToKnow, id: \.self) { hour in
                                                    Text(hour).SFProFont(weight: .regular, size: 19)
                                                        .lineLimit(nil)
                                                        .fixedSize(horizontal: false, vertical: true)
                                                }
                                            }
                                            Spacer()
                                        }.padding(.vertical)
                                        .glassEffect(in: .rect(cornerRadius: 16.0))
                                        .padding(.horizontal)
                                    } else {
                                        HStack {
                                            Image(systemName: "info").padding(.horizontal).font(.system(size: 24)).foregroundStyle(.deepGreen)
                                            VStack(alignment: .leading) {
                                                ForEach(shop.goodToKnow, id: \.self) { hour in
                                                    Text(hour).SFProFont(weight: .regular, size: 19)
                                                        .lineLimit(nil)
                                                        .fixedSize(horizontal: false, vertical: true)
                                                }
                                            }
                                            Spacer()
                                        }.padding(.vertical)
                                        .background(.almostWhite.opacity(0.5))
                                        .cornerRadius(16)
                                        .padding(.horizontal)
                                        
                                    }
                                    
                                    Spacer()
                                }
                                
                            }
                            .cornerRadius(16)
                            //.padding()
                            
                            .presentationDetents([.medium, .fraction(0.7), .large])
                            .presentationBackgroundInteraction(.enabled(upThrough: .medium))
                            
                        }
                    
            }
        }
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
    MapPage()
}

