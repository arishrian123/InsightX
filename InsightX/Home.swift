//
//  Home.swift
//  InsightX
//
//  Created by Arish Tripathi on 16/04/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    @State var showProfile = false
    @State var showClient = false
    @State var showPortfolio = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        
        ZStack {
            Color("background2").edgesIgnoringSafeArea(.all)
            VStack{
                HomeView(showProfile: $showProfile, showClient: $showClient, showPortfolio: $showPortfolio)
                .padding(.top,44)
            .background(
                VStack {
                    LinearGradient(gradient: Gradient(colors: [Color("background2"), Color("background1")]), startPoint: .top, endPoint: .bottom)
                        .frame(height: 200)
                    Spacer()
                }
                .background(Color("background1"))
            )
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.2), radius: 20, x: 0, y: 20)
                .rotation3DEffect(Angle(degrees: showProfile ? Double(viewState.height / 10) - 10 : 0), axis: (x: 10, y: 0, z: 0))
                .offset(y: showProfile ? -450 : 0)
                .scaleEffect(showProfile ? 0.9 : 1)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .edgesIgnoringSafeArea(.all)
            
            }
            
            MenuView()
            .background(Color.black.opacity(0.001))
                .offset(y: self.showProfile ? 0 : screen.height)
            .offset(y: self.viewState.height)
            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            .onTapGesture {
                self.showProfile.toggle()
            }.gesture(
                DragGesture().onChanged { value in
                    self.viewState = value.translation
                }
                .onEnded { value in
                    if self.viewState.height > 50 {
                        self.showProfile = false
                    }
                    self.viewState = .zero
                }
            )
            
            
            if showPortfolio {
                Color.white.edgesIgnoringSafeArea(.all)
                PortfolioInfoView()
                
                
                VStack {
                    HStack {
                        Spacer()
                        Image(systemName: "xmark")
                            .frame(width: 36, height: 36)
                            .foregroundColor(Color.white)
                            .background(Color.black)
                            .clipShape(Circle())
                    }
                    Spacer()
                }.offset(x: -16, y: 16)
                    .transition(.move(edge: .top))
                    .animation(.spring(response: 0.6, dampingFraction: 0.8, blendDuration: 0))
                    .onTapGesture {
                        self.showPortfolio = false
                }
            }
                
        }
        
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct AvatarView: View {
    @Binding var showProfile: Bool
    var body: some View {
        Button(action: {self.showProfile.toggle()}) {
            Image("profile").renderingMode(.original)
                .resizable()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
        }
    }
}

let screen = UIScreen.main.bounds
