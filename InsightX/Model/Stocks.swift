//
//  News.swift
//  InsightX
//
//  Created by Arish Tripathi on 19/04/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//
import Alamofire
import SwiftUI
import SwiftyJSON

struct Stocks: Codable, Identifiable, Hashable {
    
    let id = UUID()
    
    var Energy: String = "",
     Financials: String = "",
     Industrials: String = "",
     Materials: String = "",
     Utilities: String = "",
     RealEstate: String = "",
     HealthCare: String = "",
     ConsumerDiscretionary: String = "",
     ConsumerStaples: String = "",
     CommunicationServices: String = "",
     InformationTechnology: String = ""
    
    
}

let StocksData = Api()

class Api: ObservableObject{
    
    @Published var StocksData = [Stocks]()
    init(){
        getStocks()
    }
    
    func getStocks(){
        
        let request = AF.request("https://www.alphavantage.co/query?function=SECTOR&apikey=IZ3SXETAK6ATC3Q9")
        
        
        request.responseData { (data) in
          
            
            let json = try! JSON(data: data.data!)
            let keys: [String] = ["Rank A: Real-Time Performance",
            "Rank B: 1 Day Performance", "Rank C: 5 Day Performance",
            "Rank D: 1 Month Performance", "Rank E: 3 Month Performance",
            "Rank F: Year-to-Date (YTD) Performance", "Rank G: 1 Year Performance",
            "Rank H: 3 Year Performance", "Rank I: 5 Year Performance",
            "Rank J: 10 Year Performance"]
            
            for x in 0...9{
            if let stockData = json[keys[x]].dictionary {
                
                
                let stocks = Stocks(Energy: stockData["Energy"]!.description, Financials: stockData["Financials"]!.description, Materials: stockData["Materials"]!.description, Utilities: stockData["Utilities"]!.description, RealEstate: stockData["Real Estate"]?.description ?? "", HealthCare: stockData["Health Care"]!.description, ConsumerDiscretionary: stockData["Consumer Discretionary"]!.description, ConsumerStaples: stockData["Consumer Staples"]!.description, CommunicationServices: stockData["Communication Services"]!.description, InformationTechnology: stockData["Information Technology"]!.description)
                
                self.StocksData.append(stocks)
            }
                
            }
            
        }
        }
    
    }


struct Stocks_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
