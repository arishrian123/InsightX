//
//  TabBar.swift
//  InsightX
//
//  Created by Arish Tripathi on 17/04/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    @State var show: Bool = true
    var body: some View {
        TabView {
            
            Home().tabItem{
                Image(systemName: "house.fill")
                Text("Home")
            }
            
            NewsCard().tabItem{
                Image(systemName: "book.fill")
                Text("Intelli News")
            }
            
            SecuritiesView(show: $show).tabItem{
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
