//
//  Modifiers.swift
//  InsightX
//
//  Created by Arish Tripathi on 18/04/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI

struct ShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
    }
}

struct TitleFontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
        .font(.system(size: 22, weight: .bold))
        .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
    }
}

struct SubTitleFontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
        .font(.system(size: 18, weight: .bold))
        .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
    }
}

struct BodyFontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
        .font(.system(size: 14, weight: .bold))
        .foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
    }
}
