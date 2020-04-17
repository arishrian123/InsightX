//
//  AddNewClients.swift
//  InsightX
//
//  Created by Arish Tripathi on 15/04/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI

struct AddNewClients: View {
    
    var RM: RMStore
    @State var name = ""
    @State var surname = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Form{
            VStack {
                
                HStack {
                    Text("Name")
                    TextField("Enter first name", text: $name)
                }
            }
            VStack{
                HStack {
                    Text("Surname")
                    TextField("Enter Surname", text: $surname)
                }
                
            }
                Button(action: {
                    //append client to clientStore
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Add")
                }.disabled(name.isEmpty || surname.isEmpty)
        }
        }
    }
}

struct AddNewClients_Previews: PreviewProvider {
    static var previews: some View {
        AddNewClients(RM: RMStore())
    }
}
