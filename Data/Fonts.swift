//
//  Fonts.swift
//  FilVert
//
//  Created by Lora-Line on 16/09/2025.
//

import Foundation
import SwiftUI

extension View {
    func SFProFont(weight: eduWeight, size: CGFloat) -> some View {
        switch weight {
        case .regular:
            return self.font(.custom("SFProDisplay-Regular", size: size)).foregroundStyle(.deepGreen)
        case .bold:
            return self.font(.custom("SFProDisplay-Bold", size: size)).foregroundStyle(.deepGreen)
        case .medium:
            return self.font(.custom("SFProDisplay-Medium", size: size)).foregroundStyle(.deepGreen)
        case .italic:
            return self.font(.custom("SFProDisplay-LightItalic", size: size)).foregroundStyle(.deepGreen)
        case .mediumBlanc:
            return self.font(.custom("SFProDisplay-Medium", size: size)).foregroundStyle(.almostWhite)
        case .regularTarra:
            return self.font(.custom("SFProDisplay-Regular", size: size)).foregroundStyle(.terra)
        case .mediumTerra:
            return self.font(.custom("SFProDisplay-Medium", size: size)).foregroundStyle(.terra)
        case .regularMidGreen:
            return self.font(.custom("SFProDisplay-Regular", size: size)).foregroundStyle(.midGreen)
        case .mediumMidGreen:
            return self.font(.custom("SFProDisplay-Medium", size: size)).foregroundStyle(.midGreen)
        case .boldBlanc:
            return self.font(.custom("SFProDisplay-Bold", size: size)).foregroundStyle(.almostWhite)
        }
    }
    func gupterFont(size: CGFloat) -> some View {
        self.font(.custom("Gupter-Regular", size: size)).foregroundStyle(.deepGreen)
    }
}

enum eduWeight {
    case regular, bold, medium, italic, mediumBlanc, regularTarra, mediumTerra, regularMidGreen, mediumMidGreen, boldBlanc
}
