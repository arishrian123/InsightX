//
//  ClientInfoView.swift
//  InsightX
//
//  Created by Arish Tripathi on 18/04/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI
import SwiftUICharts
import Sliders

struct ClientInfoView: View {
    var client: Client
    @State var value = 0.5
    @ObservedObject var portfolioData = firebaseData
    @Binding var showClient: Bool
    var body: some View {
        
        ZStack{
            VStack{
            Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).edgesIgnoringSafeArea(.all)
            }
            .offset(y: screen.height - 1400)
                
        
            HStack(){
            ForEach(portfolioData.portfolioData) { item in
                PView(portfolio: item, client: self.client)
            }
            }.offset(y: -70)
                
            
            
        
        VStack {
            HStack {
                VStack{
                HStack {
                    Text("Client info")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                    
                    Spacer()
                    
                    Image(systemName: "xmark")
                    .frame(width: 36, height: 36)
                    .foregroundColor(Color.white)
                    .background(Color.black)
                    .clipShape(Circle())
                    
                }
                .padding(.horizontal)
                .padding(.leading, 14)
                .padding(.top, 30)
                
                
                    HStack {
                        HStack {
                            
                            Image(client.Surname)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            
                            VStack(alignment: .leading){
                                
                            Text(client.Name)
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                                
                                Text(client.Surname)
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                                
                                
                            }
                        }
                        Spacer()
                        VStack{
                        HStack(alignment: .top){
                    
                        
                            ValueSlider(value: $value)
                            .valueSliderStyle(
                                HorizontalValueSliderStyle(
                                    track: LinearGradient(
                                        gradient: Gradient(colors: [.green, .yellow, .red]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                    .frame(height: 20)
                                    .cornerRadius(20),
                                    thumbSize: CGSize(width: 30, height: 50)
                                )
                            )
                        }.frame(width: 100)
                        Spacer()
                        }
                    }
                    .frame(height: 110)
                    .padding(.horizontal)
                    .padding(.leading, 14)
                    .padding(.top, 2)
                    
                
                    
                    
                    Spacer()
                    
                }.offset(x: 20, y: -10)
            Spacer()
        }.offset(x: -16, y: 16)
            .transition(.move(edge: .top))
            .animation(.spring(response: 0.6, dampingFraction: 0.8, blendDuration: 0))
            .onTapGesture {
                self.showClient = false
        }
    }
    }
}

struct ClientInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ClientInfoView(client: .init(), showClient: .constant(false))
    }
}

struct PView: View {
    var portfolio: Portfolio
    var client: Client
    
    var body: some View {
        
        HStack(spacing: 20){
            if (String(portfolio.CustomerID) == String("\(client.CustomerID)-1"))
                
            {
                VStack{
                BarChartView(data: ChartData(points: [8,23,54,32,12,37,7,23,43]), title: "Portfolio 1", legend: portfolio.InitialValue)
                }
            }
            
            else if String(portfolio.CustomerID) == String("\(client.CustomerID)-2")
            {
                VStack{
                BarChartView(data: ChartData(points: [8,23,54,32,12,37,7,23,43]), title: "Portfolio 2", legend: portfolio.InitialValue)
                }
                
            }else{
                
            }
        }
        
        
    }
}
}
