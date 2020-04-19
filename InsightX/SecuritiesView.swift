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
    @Binding var show: Bool
    
    var body: some View {
        
        ScrollView {
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
                                SecuritiesCardView(securities: item, showSecurity: self.showSecurity, show: self.$show)
                                    
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
        
    }


struct SecuritiesView_Previews: PreviewProvider {
    static var previews: some View {
        SecuritiesView(show: .constant(true))
    }
}

struct SecuritiesCardView: View {
    
    var securities: Securities
    @State var showSecurity: Bool
    @Binding var show: Bool
    
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
                        
                        RingView(color1: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), color2: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), width: 44, height: 44, percent: percentage(prices: [Double(securities.Price1),Double(securities.Price2),Double(securities.Price3), Double(securities.Price4),Double(securities.Price5)]), show: $show)
                            .animation(Animation.easeInOut.delay(0.3))
                    }
                }.padding(.leading,-2)
                
                
                Spacer()
                
            }.padding()
                .padding(.leading,15)
            

        }.onTapGesture {
            self.showSecurity.toggle()
        }.sheet(isPresented: $showSecurity){
            SecurityCardView(securityData: self.securities, showModal: self.$showSecurity)
        }
        .padding(.top, -5)
        .padding(.horizontal, 20)
        .frame(width: 350, height: 150)
        .background(Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)))
        .cornerRadius(30)
        .shadow(color: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)).opacity(0.3), radius: 20, x: 0, y: 20)
    }
}

func percentage(prices: [Double]) -> CGFloat{

    return CGFloat(prices.max()!-prices.min()!/prices.max()!)
    
}
