//
//  MensurationSection.swift
//  FilVert
//
//  Created by apprenant83 on 18/09/2025.
//

import SwiftUI

struct MensurationsSection: View {
    @ObservedObject var user = users[0]
    @ObservedObject var measurement = users[0].measurement
    
    var onCalculate: () -> Void


    var body: some View {
        VStack {
            HStack{
                Text("Mensurations").gupterFont(size:30)
                Spacer()
            }
            .padding(.bottom,4)
            HStack{
                Text("Renseigne avec précisions tes mensurations. Le moindre écart (même de 0,1 cm) peut fausser le résultat final. Utilise un mètre à couture si possible et fais-toi aider si besoin.").SFProFont(weight: .regular, size: 14)
                Spacer()
            }
            VStack(alignment: .leading, spacing: 12) {

                HStack {
                    Text("Tour d'épaules (cm)")
                        .SFProFont(weight: .regular, size:19)
                    TextField(value: $measurement.bustSize, format: .number, prompt: Text("70")) {}
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.trailing)
                        .SFProFont(weight:.mediumTerra, size:19)
                    
                }
                Divider()
                HStack {
                    Text("Tour de taille (cm)")
                        .SFProFont(weight: .regular, size:19)
                    TextField(value: $measurement.waistSize, format: .number, prompt: Text("95")) {}
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.trailing)
                        .SFProFont(weight:.mediumTerra, size:19)
                }
                Divider()
                HStack {
                    Text("Tour de hanches (cm)")
                        .SFProFont(weight: .regular, size:19)
                    TextField(value: $measurement.hipsSize, format: .number, prompt: Text("95")) {}
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.trailing)
                        .SFProFont(weight:.mediumTerra, size:19)
                }
                Divider()
                HStack{
                    Spacer()
                    Button(action: {
                        onCalculate()
                    }) {
                        Text("Re-calculer ma morphologie")
                            .SFProFont(weight: .mediumTerra, size:19)
                    }
                    .padding(8)
                    Spacer()
                }
                
            }
            .padding(.horizontal)
            .padding(12)
            .background(.almostWhite)
            .cornerRadius(16)
            .padding(.vertical, 16)
        }
    }
}


//#Preview {
//    MensurationsSection(onCalculate: <#() -> Void#>)
//}
