//
//  HomeView.swift
//  InsightX
//
//  Created by Arish Tripathi on 16/04/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @Binding var showProfile: Bool
    @State var showKYC = false
    @ObservedObject var clientData = firebaseData
    
    var body: some View {
        VStack {
            HStack {
                Text("Home")
                    .font(.system(size: 28, weight: .bold))
                
                Spacer()
                
                AvatarView(showProfile: $showProfile)
                
                
                Button(action: {self.showKYC.toggle()}) {
                    Image(systemName: "text.badge.plus")
                        .renderingMode(.original)
                    .font(.system(size: 16, weight: .medium))
                    .frame(width: 36, height: 36)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8392156863, green: 0.8431372549, blue: 0.8901960784, alpha: 1)), Color.white]), startPoint: .top, endPoint: .bottom))
                    .clipShape(Circle())
                    .shadow(color: Color("primary").opacity(0.1), radius: 1, x: 0, y: 1)
                    .shadow(color: Color("primary").opacity(0.2), radius: 10, x: 0, y: 10)
                    
                }.sheet(isPresented: $showKYC) {
                    UpdateKycList()
                }
            }
            .padding(.horizontal)
            .padding(.leading, 14)
            .padding(.top, 30)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(clientData.clientData) { item in
                        GeometryReader { geometry in
                            SectionView(client: item)
                                .rotation3DEffect(Angle(degrees:
                                    Double(geometry.frame(in: .global).minX - 30) / -20
                                ), axis: (x: 0, y: 10, z: 0))
                        }
                        .frame(width: 275, height: 350)
                    }
                }.frame(height: 350)
                .padding(30)
                .padding(.bottom, 30)
            }
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}

struct SectionView: View {
    var client: Client
    
    let color = [Color("card1"),
                 Color("card2"),
                 Color("card3"),
                 Color("card4"),
                 Color("card5")
                ]
    
    var body: some View {
        
        
        
        VStack {
            HStack(alignment: .top) {
                VStack {
                    Text(client.Name)
                        .font(.system(size: 24, weight: .bold))
                        .frame(width: 160, alignment: .leading)
                        .foregroundColor(.white)
                    
                    Text(client.Surname.uppercased())
                    .font(.system(size: 20, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                        .foregroundColor(.gray)
                    
                    Text(client.CustomerID)
                    .font(.system(size: 16, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                        .foregroundColor(.gray)
                    
                                    
                }
                
                
                Spacer()
                
                
                Image(client.Surname)
                .resizable()
                .frame(width: 50, height: 50)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                
                
            }.padding()
            
            Image(client.Nationality + "C")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
            
            Image(client.Nationality)
            .resizable()
            .frame(width: 50, height: 50)
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .padding()
                
        }
        .padding(.top, 5)
        .padding(.horizontal, 20)
        .frame(width: 275, height: 350)
        .background(color.randomElement())
        .cornerRadius(30)
        .shadow(color: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)).opacity(0.3), radius: 20, x: 0, y: 20)
    }
}


