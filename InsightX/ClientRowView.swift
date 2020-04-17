//
//  ClientRowView.swift
//  InsightX
//
//  Created by Arish Tripathi on 15/04/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI

struct ClientRowView: View {
    @Binding var R: RM
    var body: some View {
        NavigationLink(destination: ClientEditingView(RM: $R)) {
            Text("\(R.email)" + "\(R.password)")
        }
        
    }
}


struct ClientRowView_Previews: PreviewProvider {
    static var previews: some View {
        ClientRowView(R: .constant(RM(email: "1234", password: "123456")))
    }
}
