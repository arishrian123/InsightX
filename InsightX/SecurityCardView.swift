//
//  SecuritiesCardView.swift
//  InsightX
//
//  Created by Arish Tripathi on 18/04/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct SecurityCardView: View {
    
    @State var securityData: Securities
    @Binding var showModal: Bool
    
    var body: some View {
        
        VStack {
            
            VStack(){
                
                HStack(alignment: .top){
                LineView(data: [Double(securityData.Price1),Double(securityData.Price2),Double(securityData.Price3),
                    Double(securityData.Price4),Double(securityData.Price5)], title: securityData.Company, legend: "Quaterly")
                }.padding(.leading,25)
                .padding(.trailing,25)
                Spacer()
                
            HStack{
                
                LineChartView(data: [Double(securityData.Price1),Double(securityData.Price2),Double(securityData.Price3),
                Double(securityData.Price4),Double(securityData.Price5)], title: "Prices")
                
                BarChartView(data: ChartData(values: [("Price 1",Double(securityData.Price1)), ("Price 2",Double(securityData.Price2)), ("Price 3",Double(securityData.Price3)), ("Price 4",Double(securityData.Price4)), ("Price 5",Double(securityData.Price5))]), title: "Prices", legend: "Quarterly")
            }
            }.offset(x: 0, y: -90)
        }
        
        }
    }


struct SecurityCardView_Previews: PreviewProvider {
    
    static var previews: some View {
        SecurityCardView(securityData: Securities(), showModal: .constant(false))
    }
}
