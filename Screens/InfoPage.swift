/*
 InfoPage.swift
 --------------
 Page d'informations.
 - Liste des faits (facts) et conseils.
 - Section FAQ avec réponses repliables (DisclosureGroup).
*/

//
//  InfoPage.swift
//  FilVert
//
//  Created by Louise on 16/09/2025.
//

import SwiftUI

struct InfoPage: View {
    /*
     Etat local
     - isExpanded: drapeau d'expansion (réutilisable pour des sections extensibles).
    */
    @State private var isExpanded: Bool = false
    
    var body: some View {
        /*
         Structure de la vue
         - NavigationStack -> ZStack -> ScrollView.
         - Couleur de fond, liste des facts, section Conseils, section FAQ.
        */
        NavigationStack {
            ZStack {
                Color.floralWhite.ignoresSafeArea()
                ScrollView {
                    /*
                     Section: Facts
                     - Liste simple affichant des faits écologiques.
                    */
                    List(facts, id: \.self) { fact in
                        HStack(alignment: .firstTextBaseline, spacing: 8) {
                            Text(String(fact.prefix(1)))
                                .frame(width: 28, alignment: .leading)
                        }
                    }
                    /*
                     Sections: Conseils & FAQ
                     - Carte de conseils (AdviceCard).
                     - FAQ sous forme de DisclosureGroup stylisés.
                    */
                    VStack {
                        VStack {
                            HStack{
                                Text("Conseils")
                                Spacer()
                            }.padding(.bottom,4)
                                
                            AdviceCard()
                                .padding(.vertical)
                            HStack{
                                Text("FAQ")
                                Spacer()
                            }
                        }.padding(.horizontal)
                        .padding(.bottom,4)
                        .gupterFont(size: 30)
                        

                        ForEach(faqs) { faq in
                            VStack(spacing: 8) {
                                DisclosureGroup {
                                    Text(faq.answer)
                                        .SFProFont(weight: .regularMidGreen, size:19)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                } label: {
                                    HStack(spacing: 8) {
                                        Text(String(faq.question.prefix(1)))
                                            .frame(width: 34, alignment: .trailing)
                                        Text(String(faq.question.dropFirst()))
                                            .multilineTextAlignment(.leading)
                                    }
                                }
                                .SFProFont(weight: .medium, size:19)
                                .padding(.horizontal, 32)
                                .padding(.vertical, 12)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.almostWhite)
                                        .padding(.horizontal)
                                        .shadow(color:.gray.opacity(0.2), radius:4, x:0, y:2))
                            }
                        }
                    }
                    /*
                     Toolbar & navigation
                     - Titre centré "Infos" via .principal.
                    */
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Infos")
                                .gupterFont(size:36)
                        }
                    }
                }
                /*
                 Divers
                 - .scrollIndicators(.hidden) : masque les indicateurs de défilement.
                 - .navigationBarTitleDisplayMode(.inline) : titre compact.
                */
                .scrollIndicators(.hidden)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    InfoPage()
}

