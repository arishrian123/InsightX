//
//  MainView.swift
//  InsightX
//
//  Created by Arish Tripathi on 14/04/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI
import Firebase

struct MainView: View {
    
    
    
    
    @ObservedObject private var clientData = firebaseData
    
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.white).padding().font(.system(size: 25, weight: .medium, design: .rounded))
        }
    }
    
    var body: some View {
        
        ZStack{
            
            Color.black.edgesIgnoringSafeArea(.all)
            
        VStack{
            Image("InsightLogo").resizable().frame(width: 70, height: 85, alignment: .top)
            Text("Clients").modifier(LabelStyle())
               ClientRows()
            Text("Securities").modifier(LabelStyle())
               SecuritiesRows()
            }
            }.navigationBarTitle("Dashboard").navigationBarItems(leading: EditButton(),trailing: Button(action: {
                
            }) {
                Image(systemName: "plus").resizable().frame(width: 20, height: 20, alignment: .bottom)
            })
        
            }
        
        }
        



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        MainView()
        }
    }
}

