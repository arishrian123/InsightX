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
    @Binding var value: CGFloat
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
                            
                            ZStack{
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
        ClientInfoView(client: .init(), value: .constant(0.5), showClient: .constant(false))
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
                BarChartView(data: ChartData(points: [8,23,5,32,12,3,7,23,43]), title: "Portfolio 2", legend: portfolio.InitialValue)
                }
                
            }else{
                
            }
        }
        
        
    }
}
}
