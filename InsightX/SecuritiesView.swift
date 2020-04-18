//
//  SecuritiesView.swift
//  InsightX
//
//  Created by Arish Tripathi on 17/04/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct SecuritiesView: View {
    
    @ObservedObject var securitiesData = firebaseData
    @State var viewState = CGSize.zero
    @State var showSecurity = false
    
    var body: some View {
        
    ZStack {
        
            VStack{
                HStack {
                    Text("Securities")
                        .font(.system(size: 28, weight: .bold))
                    
                    Spacer()
                    
                }
                .padding(.horizontal)
                .padding(.leading, 14)
                .padding(.top, 30)
                
                VStack{
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    ForEach(securitiesData.securitiesData) { item in
                        GeometryReader { geometry in
                            SecuritiesCardView(securities: item, showSecurity: self.showSecurity)
                                
                        }
                        .frame(width: 350, height: 150)
                    }
                }.frame(width: screen.width)
                .padding(10)
                
            }
                }.frame(width: screen.width)
                //.padding(10)
                
                
                
            }
        }
        
    }
        
    }


struct SecuritiesView_Previews: PreviewProvider {
    static var previews: some View {
        SecuritiesView()
    }
}

struct SecuritiesCardView: View {
    
    var securities: Securities
    @State var showSecurity: Bool
    
    var body: some View {
         
        VStack {
            HStack(alignment: .top) {
                VStack {
                    HStack {
                        Text(securities.Company)
                            .font(.system(size: 20, weight: .bold))
                            .frame(width: 250,height: 60,alignment: .leading)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Text(high(prices: [Double(securities.Price1),Double(securities.Price2),Double(securities.Price3), Double(securities.Price4),Double(securities.Price5)]))
                        .font(.system(size: 14, weight: .bold))
                        .frame(width: 50,height: 20,alignment: .leading)
                        .foregroundColor(.white)
                    }
                    HStack{
                    VStack{
                    Text(securities.Currency)
                        .font(.system(size: 16, weight: .bold))
                        .frame(width: 250, alignment: .leading)
                        .foregroundColor(.gray)
                    
                    Text(securities.ShortDescription)
                        .font(.system(size: 16, weight: .bold))
                        .frame(width: 250, height: 40, alignment: .leading)
                        .foregroundColor(.gray)
                    }
                        Text(low(prices: [Double(securities.Price1),Double(securities.Price2),Double(securities.Price3), Double(securities.Price4),Double(securities.Price5)]))
                        .font(.system(size: 14, weight: .bold))
                        .frame(width: 50,height: 20,alignment: .leading)
                        .foregroundColor(.white)
                    }
                }.padding(.leading,-25)
                
                
                Spacer()
                
            }.padding()
                .padding(.leading,20)
            
            
            
            
            
        }.onTapGesture {
            self.showSecurity.toggle()
        }.sheet(isPresented: $showSecurity){
            SecurityCardView(securityData: self.securities, showModal: self.$showSecurity)
        }
        .padding(.top, -10)
        .padding(.horizontal, 20)
        .frame(width: 350, height: 150)
        .background(Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)))
        .cornerRadius(30)
        .shadow(color: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)).opacity(0.3), radius: 20, x: 0, y: 20)
    }
}

func low(prices: [Double]) -> String{

    return String(prices.min()!)
    
}

func high(prices: [Double]) -> String{

    return String(prices.max()!)
    
}
