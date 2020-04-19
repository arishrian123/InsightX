//
//  PortfolioInfoView.swift
//  InsightX
//
//  Created by Arish Tripathi on 19/04/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI

struct PortfolioInfoView: View {
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text("SwiftUI Advanced")
                        .font(.system(size: 24, weight: .bold))
                        .lineLimit(3)
                        .foregroundColor(.white)
                    
                    Text("20 Sections")
                        .foregroundColor(Color.white.opacity(0.7))
                }
                
                
                Spacer()
                
                //Image("Logo1")
            }
            
            Spacer()
            
            Image(uiImage: #imageLiteral(resourceName: "Card2"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .frame(height: 140, alignment: .top)
        }
        .padding(20)
        .frame(width: screen.width - 60, height: 280)
        .background(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).opacity(0.3), radius: 20, x: 0, y: 20)
        
                
    }
}

struct PortfolioInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioInfoView()
    }
}
