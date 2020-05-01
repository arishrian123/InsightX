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
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Text("First Trading Month")
            
            HStack{
                
            ForEach(firstTradingMonth.firstTradingMonthData) { item in
                firstTradingMonthView(client: self.client, firstTradingMonth: item)
            }
            }
            
            Text("Second Trading Month")
            
            HStack{
            
            ForEach(secondTradingMonth.secondTradingMonthData) { item in
                secondTradingMonthView(client: self.client, secondTradingMonth: item)
            }
            }
            
            Text("Third Trading Month")
            
            HStack{
            
            ForEach(thirdTradingMonth.thirdTradingMonthData) { item in
                thirdTradingMonthView(client: self.client, thirdTradingMonth: item)
            }
            }
            
            
            Spacer()
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
    
    var body: some View {
        
        HStack{
            if(firstTradingMonth.portfolioID.contains(client.CustomerID)){
                
                VStack {
                    Text(firstTradingMonth.portfolioID)
                    Text(firstTradingMonth.dateOfTransaction)
                    Text(firstTradingMonth.securityID)
                    Text("\(firstTradingMonth.quantity)")
                    Text(firstTradingMonth.type)
                }
                
                
            }
            
        }
}
}

struct secondTradingMonthView: View {
    
    var client: Client
    var secondTradingMonth: SecondTradingMonth
    
    var body: some View {
        
        HStack{
            if(secondTradingMonth.portfolioID.contains(client.CustomerID)){
                
                VStack {
                    Text(secondTradingMonth.portfolioID)
                    Text(secondTradingMonth.dateOfTransaction)
                    Text(secondTradingMonth.firstSecurityID)
                    Text("\(secondTradingMonth.firstSecurityQuantity)")
                    Text(secondTradingMonth.firstTransactionType)
                    Text(secondTradingMonth.secondSecurityID)
                    Text("\(secondTradingMonth.secondSecurityQuantity)")
                    Text(secondTradingMonth.secondTransactionType)
                }
                
                
            }
            
        }
}
}

struct thirdTradingMonthView: View {
    
    var client: Client
    var thirdTradingMonth: ThirdTradingMonth
    
    var body: some View {
        
        HStack{
            if(thirdTradingMonth.portfolioID.contains(client.CustomerID)){
                
                VStack {
                    Text(thirdTradingMonth.portfolioID)
                    Text(thirdTradingMonth.dateOfTransaction)
                    Text(thirdTradingMonth.firstSecurityID)
                    Text("\(thirdTradingMonth.firstSecurityQuantity)")
                    Text(thirdTradingMonth.firstTransactionType)
                    Text(thirdTradingMonth.secondSecurityID)
                    Text("\(thirdTradingMonth.secondSecurityQuantity)")
                    Text(thirdTradingMonth.secondTransactionType)
                }
                
                
            }
            
        }
}
}
