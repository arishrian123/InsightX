//
//  Settings.swift
//  InsightX
//
//  Created by Arish Tripathi on 17/04/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI

struct Settings: View {
    
    @State var recieveNotifications: Bool = false
    
    var body: some View {
        
        
        
        VStack{
        HStack {
            Text("Settings")
                .font(.system(size: 28, weight: .bold))
            
            Spacer()
            
        }
        .padding(.horizontal)
        .padding(.leading, 14)
        .padding(.top, 30)
            
            Form{
                Toggle(isOn: $recieveNotifications){
                    Text("Recieve Notificatons")
                }
            }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
}
