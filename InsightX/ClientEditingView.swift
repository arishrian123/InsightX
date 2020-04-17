//
//  ClientEditingView.swift
//  InsightX
//
//  Created by Arish Tripathi on 15/04/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI

struct ClientEditingView: View {
    @Binding var RM: RM
    var body: some View {
        
        Form{
            TextField("name", text: $RM.email)
            
        }
    }
}

struct ClientEditingView_Previews: PreviewProvider {
    static var previews: some View {
        ClientEditingView(RM: .constant(RM(email: "12", password: "12")))
    }
}
