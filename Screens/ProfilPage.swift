/*
 ProfilPage.swift
 ----------------
 Page de profil utilisateur.
 - Edition d'informations personnelles (nom, genre).
 - Saisie/affichage des mensurations et calcul de la morphologie.
 - Sélection des styles préférés.
*/

//
//  ProfilPage.swift
//  FilVert
//
//  Created by Lora-Line on 16/09/2025.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ProfilPage: View {
    /*
     Modèles observés & Etats
     - user / measurements: source de vérité pour les données utilisateur.
     - resultMorph / selectedMorph: suivi/affichage de la morphologie.
    */
    @ObservedObject var user = users[0]
    @ObservedObject var measurements = users[0].measurement
    @State var resultMorph: MorphologyName = users[0].morphology
    @State var selectedMorph: MorphologyName = users[0].morphology
    @State private var showSavedMessage = false
    
    func showSavedNotification() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.spring()) {
                showSavedMessage = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation(.spring()) {
                    showSavedMessage = false
                }
            }
        }
    }
    /*
     determineMorphology
     - Détermine la morphologie à partir des mensurations.
     - Règles simples basées sur les différences poitrine/taille/hanches.
    */
    func determineMorphology(bustSize: Double, waistSize: Double, hipsSize: Double, height: Double) -> MorphologyName {
        switch true {
        case (bustSize > waistSize + 20) && (hipsSize > waistSize + 20):
            return .x
        case hipsSize > bustSize + 5:
            return .a
        case bustSize > hipsSize + 5:
            return .v
        case abs(bustSize - hipsSize) <= 3 && (bustSize - waistSize < 10 && hipsSize - waistSize < 10):
            return .h
        case (bustSize > waistSize + 10 || hipsSize > waistSize + 10) && abs(bustSize - hipsSize) < 10:
            return .o
        default:
            return .h
        }
    }
    
    var body: some View {
        /*
         Structure de la vue
         - NavigationStack: navigation + titre.
         - ScrollView: contenu principal avec sections.
         - Sections: A propos de toi, Mensurations, Morphologie, Styles préférés.
        */
        let allMorphs: [Morphology] = morphologys
        let selectedIndex: Int = allMorphs.firstIndex(where: { $0.name == user.morphology }) ?? 0
        
        NavigationStack {
            ZStack(alignment: .topTrailing) {
                Color.floralWhite.ignoresSafeArea() //chage la couleur du font
                if showSavedMessage {
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                        Text("Modifications enregistrées")
                            .font(.callout)
                            .fontWeight(.medium)
                    }
                    .padding(.horizontal, 14)
                    .padding(.vertical, 10)
                    .glassEffect()
                    .padding(.trailing) // espace depuis le bord droit
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .zIndex(1)
                }
                
                ScrollView {
                    /*
                     Section: A propos de toi
                     - Edition du prénom.
                     - Sélection du genre via Picker (menu).
                    */
                    VStack {
                        HStack { //titre premiere section
                            Text("A propos de toi").gupterFont(size:30)
                            Spacer()
                        }
                        VStack(alignment: .leading, spacing: 12) {
                            HStack { //champ prenom
                                Text("Ton prénom")
                                    .SFProFont(weight: .regular, size:19)
                                
                                
                                TextField(text: $user.name, prompt: Text("Ton Prénom")) {}
                                    .onChange(of: user.name) { oldValue, newValue in
                                        user.name = newValue //met a jour la valeur du nom
                                        showSavedNotification()
                                    }
                                    .multilineTextAlignment(.trailing).SFProFont(weight:.regularTarra, size:19)
                                
                            }
                            Divider()
                            HStack {
                                Text("Tu t’identifie en tant que")
                                    .SFProFont(weight: .regular, size:19)
                                Spacer()
                                Picker("Sexe", selection: $user.sexe) {
                                    ForEach(sexes, id: \.self) { option in
                                        Text(option.rawValue)
                                        .tag(option)
                                    }
                                }.onChange(of: user.sexe) { _ in
                                    showSavedNotification()
                                }
                            }
                            .pickerStyle(.menu)
                            .tint(.terra)
                            .padding(.trailing, -12)
                        } .padding(.horizontal)
                            .padding(12)
                            .background(.almostWhite)
                            .cornerRadius(16)
                    }
                    
                    /*
                     Section: Mensurations
                     - Saisie des mensurations et calcul de la morphologie.
                    */
                    MensurationsSection(
                        onCalculate: {
                            user.morphology = determineMorphology(bustSize: user.measurement.bustSize, waistSize: user.measurement.waistSize, hipsSize: user.measurement.hipsSize, height: user.measurement.height)
                        }
                    )
                    
                    /*
                     Section: Morphologie
                     - Affiche l'illustration et le nom de la morphologie actuelle.
                    */
                    VStack(spacing: 8) {
                            
                        ZStack {
                                Image(
                                    user.sexe.rawValue == "Femme"
                                    ? morphologys[selectedIndex].image[0]
                                    : morphologys[selectedIndex].image[1]
                                )
                                .resizable()
                                .scaledToFit()
                                .frame(height: 140)
                            }

                        .animation(.spring, value: selectedIndex)
                        
                      
                        Text(user.morphology.rawValue)
                            .SFProFont(weight: .medium, size: 19)
                            .foregroundColor(.primary)
                            .padding(.vertical, 8)
                    }
                    
                    /*
                     Section: Styles préférés
                     - Titre et sous-titre d'explication.
                    */
                    HStack{
                        Text("Styles préférés").gupterFont(size:30)
                        Spacer()
                    }.padding(.bottom,4)
                    HStack{
                        Text("Choisis les styles qui te plaisent").SFProFont(weight: .regular, size: 14)
                        Spacer()
                    }.padding(.bottom,4)
                    
                    /*
                     Grille de styles
                     - Cartes sélectionnables, ajout/suppression dans user.styles.
                    */
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(styles) { style in
                            Button(action: {
                                if let idx = user.styles.firstIndex(of: style.name) {
                                    user.styles.remove(at: idx) //si le style est deja present, le supprime
                                } else {
                                    user.styles.append(style.name) //si il y est pas on l'ajoute
                                }
                                showSavedNotification()
                            }) {
                                StyleCard(
                                    style: style,
                                    isSelected: user.styles.contains(style.name),
                                ) //affiche les cartes de style
                            }
                        }
                    }.padding(.bottom, 24)
                }
                .padding(.horizontal)
            }.onTapGesture {
                UIApplication.shared.endEditing()
            }
            /*
             Toolbar & navigation
             - Titre centré "Profil" via .principal.
            */
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Profil")
                        .gupterFont(size:36)
                }
            }.scrollIndicators(.hidden)
                .navigationBarTitleDisplayMode(.inline)
        }
        
    }
    
}



#Preview {
    ProfilPage()
}

