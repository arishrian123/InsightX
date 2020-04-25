//
//  RiskRingView.swift
//  InsightX
//
//  Created by Arish Tripathi on 19/04/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI

struct RiskRingView: View {
    
    var color1 = #colorLiteral(red: 0, green: 0.6455390268, blue: 0.1645440925, alpha: 1)
    var color2 = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
    var width: CGFloat = 100
    var height: CGFloat = 100
    
    var body: some View {
        
        let multiplier = width / 44
        
        return ZStack{
        Circle()
        .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 5 * multiplier))
        .frame(width: width, height: height)
        
        Circle()
            .trim(from: 0)
        .stroke(
            LinearGradient(gradient: Gradient(colors: [Color(color1), Color(color2)]), startPoint: .topTrailing, endPoint: .bottomLeading),
            style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round)
        )
        .frame(width: width, height: height)
        .rotationEffect(Angle(degrees: 90))
        .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
        .shadow(color: Color(color2).opacity(0.3), radius: 3 * multiplier, x: 0, y: 3 * multiplier)
            .animation(.easeInOut)
        
        }
    }
    
}

struct RiskRingView_Previews: PreviewProvider {
    static var previews: some View {
        RiskRingView()
    }
}

