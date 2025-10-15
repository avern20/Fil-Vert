//
//  SuggestionRow.swift
//  FilVert
//
//  Created by apprenant83 on 18/09/2025.
//

import SwiftUI

struct SuggestionRow: View {
    let clothe : Clothe
    let fact : String
    var body: some View {
        NavigationLink(destination: DetailsClothes(clothe: clothe)) {
            
                ZStack {
                Rectangle ()
                    .foregroundStyle(Color.almostWhite)
                    .cornerRadius(16)
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                    VStack {
                        
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Image(clothe.image)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 150)
                                .cornerRadius(8)
                            
                            HStack {
                                Text(clothe.brand.rawValue)
                                    .SFProFont(weight: .regular, size: 17)
                                Spacer()
                               // Text("\(clothe.price, specifier: "%.2f")€")
                               //     .SFProFont(weight: .regular, size: 17)
                            }
                            Text(clothe.name)
                                .SFProFont(weight:.regular, size: 19)
                            
                            
                        }
                        .padding(8)
                        Spacer()
                        
                        
                    }
                }
                .frame(height: 184)
                .padding(.vertical, 8)
                .padding(4)
            }
        }
    
}
    
    


#Preview {
    SuggestionRow(clothe: clothes[0], fact: "")
}
