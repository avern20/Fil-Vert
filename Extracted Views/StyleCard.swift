//
//  StyleCardEXT.swift
//  FilVert
//
//  Created by apprenant83 on 17/09/2025.
//

import SwiftUI

struct StyleCard: View {
    @ObservedObject var user = users[0]
    let style: Styles
    var isSelected: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(isSelected ? Color.terra.opacity(0.3) : Color.almostWhite)
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
            VStack {
                Image(user.sexe == .femme ? style.image[0] : style.image[1] )
                    .resizable()
                    .scaledToFill()
                    .frame(height: 133)
                    .cornerRadius(12)
                
                Text(style.name.rawValue)
                    .SFProFont(weight: .medium, size: 19)
                    .frame(maxWidth: .infinity)
                    .padding(.top, 8)
            }
            
            .padding(8)
        }
        .frame( height: 180)
        
        
        
    }
}

#Preview {
    StyleCard(style: styles[0], isSelected: true)
}
