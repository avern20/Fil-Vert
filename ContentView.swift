//
//  ContentView.swift
//  Fil Vert
//
//  Created by Lora-Line on 15/09/2025.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        
            TabView {
                Tab("Suggestion", systemImage: "cabinet") {
                    SuggestionPage()
                }
                Tab("Marques", systemImage: "magnifyingglass") {
                    SearchPage()
                }
                Tab("Magasins", systemImage: "map") {
                    MapPage()
                }
                Tab("Infos", systemImage: "apple.meditate") {
                    InfoPage()
                }

                Tab("Profil", systemImage: "person") {
                    ProfilPage()
                }
            }.tint(Color.terra)
            
            
        }
    }


#Preview {
    ContentView()
}
