//
//  TabBar.swift
//  InsightX
//
//  Created by Arish Tripathi on 17/04/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            
            Home().tabItem{
                Image(systemName: "house.fill")
                Text("Home")
            }
            
            News().tabItem{
                Image(systemName: "book.fill")
                Text("Intelli News")
            }
            
            SecuritiesView().tabItem{
                Image(systemName: "umbrella.fill")
                Text("Securities")
            }
            
            Settings().tabItem{
                Image(systemName: "gear")
                Text("Settings")
            }
            
            
        }
        
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
