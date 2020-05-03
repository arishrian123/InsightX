//
//  EditPortfolio.swift
//  InsightX
//
//  Created by Arish Tripathi on 29/04/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI

struct EditPortfolio: View {
    
    var client: Client
    @ObservedObject var securities = firebaseData
    @ObservedObject var firstTradingMonth = firebaseData
    @ObservedObject var secondTradingMonth = firebaseData
    @ObservedObject var thirdTradingMonth = firebaseData
    @ObservedObject var portfolioData = firebaseData
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
//            Color("background2").edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                
                VStack {
                    ZStack {
                        Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        
                        VStack(alignment: .leading, spacing: 15) {
                            HStack {
                                Text("First Trading Month").modifier(TitleFontModifier())
                                Spacer()
                            }
                            
                            
                            VStack {
                                
                                ForEach(firstTradingMonth.firstTradingMonthData) { item in
                                    firstTradingMonthView(client: self.client, firstTradingMonth: item)
                                    firstTradingMonthView2(client: self.client, firstTradingMonth: item)
                                }
                                
                                
                            }
                        }.padding(.leading, 20)
                            .padding(.top, 20)
                        
                    }.padding(.top, 50)
                }.padding(.top, 50)
                .frame(width: screen.width-60, height: 250)
                    .modifier(ShadowModifier())
                
                VStack {
                    ZStack {
                        Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        
                        VStack(alignment: .leading, spacing: 15) {
                            HStack {
                                Text("Second Trading Month").modifier(TitleFontModifier())
                                Spacer()
                            }
                            
                            
                            VStack {
                                
                                ForEach(secondTradingMonth.secondTradingMonthData) { item in
                                    secondTradingMonthView(client: self.client, secondTradingMonth: item)
                                    
                                }
                                
                                
                            }
                        }.padding(.leading, 20)
                            //.padding(.top, 20)
                        
                    }.padding(.top, 50)
                }.frame(width: screen.width-60, height: 280)
                    .modifier(ShadowModifier())
                
                
                VStack {
                    ZStack {
                        Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        
                        VStack(alignment: .leading, spacing: 15) {
                            HStack {
                                Text("Third Trading Month").modifier(TitleFontModifier())
                                Spacer()
                            }
                            
                            
                            VStack {
                                
                                ForEach(thirdTradingMonth.thirdTradingMonthData) { item in
                                    thirdTradingMonthView(client: self.client, thirdTradingMonth: item)
                                    
                                }
                                
                                
                            }
                        }.padding(.leading, 20)
                            .padding(.top, 20)
                        
                    }.padding(.top, 50)
                }.frame(width: screen.width-60, height: 280)
                    .modifier(ShadowModifier())
                
                Spacer()
            }
        }
        
        
    }
    
}

struct EditPortfolio_Previews: PreviewProvider {
    static var previews: some View {
        EditPortfolio(client: Client())
    }
}

struct firstTradingMonthView: View {
    
    var client: Client
    var firstTradingMonth: FirstTradingMonth
    @ObservedObject var portfolioData = firebaseData
    @ObservedObject var securityData = firebaseData
    
    var body: some View {
        
        VStack(spacing: 10){
            if(firstTradingMonth.portfolioID == (client.CustomerID + "-1")){
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(firstTradingMonth.portfolioID).modifier(SubTitleFontModifier())
                    
                    HStack{
                        Text(firstTradingMonth.dateOfTransaction)
                        Text(firstTradingMonth.securityID)
                        Text("\(firstTradingMonth.quantity)")
                        Text(firstTradingMonth.type)
                        
                    }.modifier(BodyFontModifier())
                    
                    Text("\(portfolioItem(clientData: self.client, portfolioData: portfolioData.portfolioData, n: 1)?.InitialValue ?? "")")
                    .modifier(BodyFontModifier())
                    
                    Text("\(securityItem(firstTradingMonthData: self.firstTradingMonth, securityData: securityData.securitiesData, n: 1)!.Price1)")
                    .modifier(BodyFontModifier())
                    
                }.padding(.bottom, 15)
                
                
            }
            
        }
    }
}

struct firstTradingMonthView2: View {
    
    var client: Client
    var firstTradingMonth: FirstTradingMonth
    @ObservedObject var portfolioData = firebaseData
    @ObservedObject var securityData = firebaseData
    
    var body: some View {
        
        VStack(spacing: 10){
            if(firstTradingMonth.portfolioID == (client.CustomerID + "-2")){
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(firstTradingMonth.portfolioID).modifier(SubTitleFontModifier())
                    
                    HStack{
                        Text(firstTradingMonth.dateOfTransaction)
                        Text(firstTradingMonth.securityID)
                        Text("\(firstTradingMonth.quantity)")
                        Text(firstTradingMonth.type)
                    }.modifier(BodyFontModifier())
                    
                    Text("\(portfolioItem(clientData: self.client, portfolioData: portfolioData.portfolioData, n: 2)?.InitialValue ?? "")")
                    .modifier(BodyFontModifier())
                    
                    Text("\(securityItem(firstTradingMonthData: self.firstTradingMonth, securityData: securityData.securitiesData, n: 1)!.Price1)")
                    .modifier(BodyFontModifier())
                    
                }.padding(.bottom, 15)
                
                
            }
            
        }
    }
}

struct secondTradingMonthView: View {
    
    var client: Client
    var secondTradingMonth: SecondTradingMonth
    @ObservedObject var portfolioData = firebaseData
    @ObservedObject var securityData = firebaseData
    
    var body: some View {
        
        HStack{
            if(secondTradingMonth.portfolioID == (client.CustomerID + "-1")){
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(secondTradingMonth.portfolioID).modifier(SubTitleFontModifier())
                    
                    HStack{
                        Text(secondTradingMonth.dateOfTransaction)
                        Text(secondTradingMonth.firstSecurityID)
                        Text("\(secondTradingMonth.firstSecurityQuantity)")
                        Text(secondTradingMonth.firstTransactionType)
                        
                    }.modifier(BodyFontModifier())
                    
                    Text("\(portfolioItem(clientData: self.client, portfolioData: portfolioData.portfolioData, n: 1)?.InitialValue ?? "")")
                    .modifier(BodyFontModifier())
                    
                    
                }.padding(.bottom, 15)
                
                
            }
            
        }
    }
}

struct thirdTradingMonthView: View {
    
    var client: Client
    var thirdTradingMonth: ThirdTradingMonth
    @ObservedObject var portfolioData = firebaseData
    @ObservedObject var securityData = firebaseData
    
    var body: some View {
        
        HStack{
            if(thirdTradingMonth.portfolioID.contains(client.CustomerID)){
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(thirdTradingMonth.portfolioID).modifier(SubTitleFontModifier())
                    
                    HStack{
                        Text(thirdTradingMonth.dateOfTransaction)
                        Text(thirdTradingMonth.firstSecurityID)
                        Text("\(thirdTradingMonth.firstSecurityQuantity)")
                        Text(thirdTradingMonth.firstTransactionType)
                        
                    }.modifier(BodyFontModifier())
                    
                    Text("\(portfolioItem(clientData: self.client, portfolioData: portfolioData.portfolioData, n: 1)?.InitialValue ?? "")")
                    .modifier(BodyFontModifier())
                    
                    
                }.padding(.bottom, 15)
                
                
            }
            
        }
    }
}

func portfolioItem(clientData: Client, portfolioData: [Portfolio], n: Int) -> Portfolio?{
    
    
    for item in portfolioData{
        
        if(n == 1){
        if(item.CustomerID == (clientData.CustomerID+"-1")){
            print(item.InitialValue)
            return item
            
        }
        }
        else if (item.CustomerID == (clientData.CustomerID+"-2")){
            
            print(item.InitialValue)
            return item
        }
    }
    
    return nil
}

func securityItem(firstTradingMonthData: FirstTradingMonth, securityData: [Securities], n: Int) -> Securities?{
    
    
    for item in securityData{
        
        if(n == 1){
            if(item.securityID == (firstTradingMonthData.securityID)){
            
            return item
            
        }
        }
        else if (item.securityID == (firstTradingMonthData.securityID)){
            
            return item
        }
    }
    
    return nil
}
