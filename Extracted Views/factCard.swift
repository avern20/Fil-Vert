//
//  factCard.swift
//  FilVert
//
//  Created by apprenant83 on 19/09/2025.
//

import SwiftUI

struct FactCard: View {
    let text: String
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "leaf.fill")
                .gupterFont(size: 22)
                .padding(.top, 2)
            
            Text(text)
                .gupterFont(size: 22)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .foregroundStyle(Color.almostWhite)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
    }
}


#Preview {
    FactCard(text:"Blablabla")
}
