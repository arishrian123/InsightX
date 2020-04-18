//
//  ChartView.swift
//  InsightX
//
//  Created by Arish Tripathi on 17/04/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct ChartView: View {
    
    @ObservedObject var portfolioData = firebaseData
    
    var body: some View {
        
     LineChartView(data: [8,23,54,32,12,37,7,23,43], title: "Title", legend: "Legendary")
        
    }

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}
}
