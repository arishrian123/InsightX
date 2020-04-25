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
    @Binding var showClient: Bool
    @Binding var showPortfolio: Bool
    @State var showKYC = false
    @State var value: CGFloat = 0.5
    @ObservedObject var clientData = firebaseData
    
    var body: some View {
        ScrollView {
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
                    HomeStacks()
                        .padding(.horizontal, 30)
                    .padding(.bottom, 30)
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(clientData.clientData) { item in
                            GeometryReader { geometry in
                                SectionView(client: item, width: 275, height: 350, showClient: self.showClient)
                                    
                                    .rotation3DEffect(Angle(degrees:
                                        Double(geometry.frame(in: .global).minX - 30) / -20
                                    ), axis: (x: 0, y: 10, z: 0))
    //                        }.onTapGesture {
    //                            self.showClient.toggle()
    //                        }.sheet(isPresented: self.$showClient){
    //                            ClientView()
                            }
                            .frame(width: 275, height: 350)
                        }
                    }.frame(height: 350)
                    .padding(30)
                    //.padding(.bottom, 20)
                }
                .offset(y: -30)
                
                
                HStack {
                    Text("Portfolios")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.leading, 30)
                //.padding(.bottom, 0)
                .offset(y: -10)
                
                ForEach(clientData.portfolioData) { item in
                    SectionPortfolioView(portfolio: item, width: screen.width-60, height: 140, showPortfolio: self.showPortfolio)
                }.padding(.bottom, 30)
                
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false), showClient: .constant(false), showPortfolio: .constant(false))
    }
}

struct SectionView: View {
    var client: Client
    var width: CGFloat = 275
    var height: CGFloat = 350
    @State var showClient: Bool
    @State var value: CGFloat = 0.5
    let color = [
                 Color("card1"),
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
                    
                    Text(client.Surname)
                    .font(.system(size: 20, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                        .foregroundColor(.gray)
                    
                    Text(client.CustomerID)
                    .font(.system(size: 16, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                        .foregroundColor(.gray)
                                    
                }
                
                Spacer()
                
                ZStack {
                    Image(client.Surname)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                    
                    if value >= 0 && value < 0.25{
                        RiskRingView(color1: #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1), color2: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), width: 55, height: 55)
                    } else if value > 0.25 && value < 0.75 {
                        RiskRingView(color1: #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1), color2: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), width: 55, height: 55)
                    } else if value > 0.75 && value <= 1.0{
                        RiskRingView(color1: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), color2: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), width: 55, height: 55)
                    }
                }
                
                
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
        .frame(width: width, height: height)
        .background(Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)))
        .cornerRadius(30)
    .modifier(ShadowModifier())
        .onTapGesture {
            self.showClient.toggle()
           
        }
        .sheet(isPresented: $showClient){
            ClientInfoView(client: self.client, value: self.$value, showClient: self.$showClient)
        }
        
    }
}

struct SectionPortfolioView: View {
    var portfolio: Portfolio
    var width: CGFloat = 275
    var height: CGFloat = 350
    @State var showPortfolio: Bool
    let color = [
                 Color("card1"),
                 Color("card2"),
                 Color("card3"),
                 Color("card4"),
                 Color("card5")
                ]
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack {
                    Text(String(portfolio.CustomerID))
                        .font(.system(size: 24, weight: .bold))
                        .frame(width: 160, alignment: .leading)
                        .foregroundColor(.white)
                    
                    Text(portfolio.AccType)
                    .font(.system(size: 20, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                        .foregroundColor(.gray)
                    
                    Text(portfolio.InitialValue)
                    .font(.system(size: 16, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                        .foregroundColor(.gray)
                                    
                }
                
                Spacer()
                
//                Image(client.Surname)
//                .resizable()
//                .frame(width: 50, height: 50)
//                .aspectRatio(contentMode: .fit)
//                .clipShape(Circle())
                
            }.padding()
            
//            Image(client.Nationality + "C")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 210)
            
//            Image(client.Nationality)
//            .resizable()
//            .frame(width: 50, height: 50)
//            .aspectRatio(contentMode: .fit)
//            .clipShape(Circle())
//            .padding()
                
        }
        .padding(.top, 5)
        .padding(.horizontal, 20)
        .frame(width: width, height: height)
        .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
        .cornerRadius(30)
    .modifier(ShadowModifier())
        .onTapGesture {
            self.showPortfolio.toggle()
        }
        
    }
}

struct HomeStacks: View {
    var body: some View {
        HStack(spacing: 20){
            HStack(spacing: 12){
                
                VStack(alignment: .leading, spacing: 4) {
                    
                    Text("Number \nof Clients").font(.subheadline).fontWeight(.bold)
                    Text("26").font(.caption)
                }
                
            }.padding(15)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .modifier(ShadowModifier())
            
            HStack(spacing: 12){
                
                VStack(alignment: .leading, spacing: 4) {
                    
                    Text("Number of \nPortfolios").font(.subheadline).fontWeight(.bold)
                    Text("35").font(.caption)
                }
                
            }.padding(15)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .modifier(ShadowModifier())
            
            HStack(spacing: 12){
                
                VStack(alignment: .leading, spacing: 4) {
                    
                    Text("Number of \nSecurities").font(.subheadline).fontWeight(.bold)
                    Text("52").font(.caption)
                }
                
            }.padding(15)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .modifier(ShadowModifier())
            
        }.padding(.top, 20)
    }
}
