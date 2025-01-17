//
//  MenuView.swift
//  InsightX
//
//  Created by Arish Tripathi on 16/04/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack{
            Spacer()
        VStack(spacing: 16){
            
            Text("Hi, Ruby").font(.caption)
            
            Color.white
            .frame(width: 38, height: 6)
            .cornerRadius(3)
            .frame(width: 130, height: 6, alignment: .leading)
            .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.08)))
            .cornerRadius(3)
            .padding()
            .frame(width: 150, height: 24)
            .background(Color(#colorLiteral(red: 0.7882352941, green: 0.8196078431, blue: 0.862745098, alpha: 1)))
            .cornerRadius(12)
            .shadow(color: Color.white, radius: 0, x: 0, y: 1)
            
            MenuRow(title: "Account", icon: "gear")
            MenuRow(title: "Sign out", icon: "person.crop.circle")
        }.frame(maxWidth: .infinity)
        .frame(height: 300)
            .background(LinearGradient(gradient: Gradient(colors: [Color("background3"), Color("background3").opacity(0.6)]), startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
        .padding(.horizontal, 30)
            .overlay(Image("profile").resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .offset(y: -150))
        }.padding(.bottom,30)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct MenuRow: View {
    
    var title: String
    var icon: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 20, weight: .light))
                .imageScale(.large)
                .frame(width: 32, height: 32)
                .foregroundColor(Color(#colorLiteral(red: 0.662745098, green: 0.7333333333, blue: 0.831372549, alpha: 1)))
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .frame(width: 120, alignment: .leading)
        }
    }
}
