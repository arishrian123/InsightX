//
//  News.swift
//  InsightX
//
//  Created by Arish Tripathi on 17/04/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI

struct NewsView: View {
    
    @ObservedObject var stocksData = StocksData
    @State var showNewsCard: Bool = false
    
    var body: some View {
        
        
        VStack {
//            List {
//                ForEach(newsData.NewsData) { item in
//                    NView(newsData: item)
//                }
//            }
            VStack{
            HStack {
                Text("Intelli News")
                    .font(.system(size: 28, weight: .bold))
                
                Spacer()
                
            }
            .padding(.horizontal)
            .padding(.leading, 14)
            .padding(.top, 30)
                
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 10) {
                    ForEach(0 ..< 5) { item in
                        Text("ff")
                    }
                }
            }
        }
        
        
            
            
        
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}

struct NView: View {
    
    var stocksData: Stocks
    
    var body: some View {
        Text(stocksData.Energy)
    }
}
}
