//
//  UpdateKycDetail.swift
//  InsightX
//
//  Created by Arish Tripathi on 17/04/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI

struct UpdateKycDetail: View {
   
    var kyc: KYC
    @State var KYCCheck: Bool = false
    @State var PEPCheck = 1
    @State var PaperMailing = 1
    @State var FirstName: String = ""
    @State var LastName: String = ""
    @State var ClientID: String = ""
    @State var DOB: String = ""
    @State var ResidentialAddress: String = ""
    @State var ClientKnowledge = 1
    @State var TransitAccountHolder: String = ""
    @State var TransitAccountNumber: String = ""
    @State var SourceOfWealth = 1
    @State var Submit: Bool = false

    
    var body: some View {
        
        VStack{
        
            KYCDetail(kyc: kyc, KYCCheck: KYCCheck)
            
        }.navigationBarTitle(kyc.FirstName)
        
        }
        
    }


struct UpdateKycDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateKycDetail(kyc: .init())
    }
}

struct KYCDetail: View {
    
    var kyc: KYC
    @State var KYCCheck: Bool = false
    @State var PEPCheck = 1
    @State var PaperMailing = 1
    @State var FirstName: String = ""
    @State var LastName: String = ""
    @State var ClientID: String = ""
    @State var DOB: String = ""
    @State var ResidentialAddress: String = ""
    @State var ClientKnowledge = 1
    @State var TransitAccountHolder: String = ""
    @State var TransitAccountNumber: String = ""
    @State var SourceOfWealth = 1
    @State var Submit: Bool = false
    
    var body: some View {
        
        
            
        Form {
            Section(header: Text("Personal details")){
                HStack{
                Text("Client ID")
                TextField(kyc.ClientID, text: $ClientID).disabled(true)
                }
                HStack{
                Text("Name")
                    TextField(kyc.FirstName, text: $FirstName).disabled(true)
                }
                HStack{
                Text("Surname")
                    TextField(kyc.LastName, text: $LastName).disabled(true)
                }
                HStack{
                Text("Date of Birth")
                    TextField(kyc.DateOfBirth, text: $DOB).disabled(true)
                }
                HStack{
                Text("Residential Address")
                    TextField(kyc.ResidentialAddress, text: $ResidentialAddress).disabled(true)
                }
                Picker(selection: $ClientKnowledge, label: Text("Client Knowledge")){
                    Text(kyc.ClientKnowledge).tag(1)
                    Text(kyc.ClientKnowledge).tag(2)
                }.disabled(true)
                
                Picker(selection: $SourceOfWealth, label: Text("Source of Wealth")){
                    Text("Property Dealing").tag(1)
                    Text("Legal Decision").tag(2)
                }
                
                
                
            }
            Section(header: Text("Transit Account details")){
            HStack{
            Text("Account Holder Name")
                TextField(kyc.TransitAccountHolder, text: $TransitAccountHolder)
            }
            HStack{
            Text("Account Number")
                TextField(kyc.TransitAccountNumber, text: $TransitAccountNumber)
            }
            }
            
            Picker(selection: $PaperMailing, label: Text("Paper Mailing")){
                Text("No").tag(1)
                Text("Yes").tag(2)
            }
            
            Picker(selection: $PEPCheck, label: Text("PEP Check")){
                Text("Not Done").tag(1)
                Text("In Progress").tag(2)
                Text("Problematic").tag(3)
                Text("Clear").tag(4)
                
            }
            
            Toggle(isOn: $KYCCheck){
                Text("KYC Check")
            }
            
            Button(action: {
                self.Submit.toggle()
            }) {
                Text("Submit")
            }.alert(isPresented: $Submit){
                Alert(title: Text("Voila! Submitted"))
            }
            
            
        }
        }
        
    }

