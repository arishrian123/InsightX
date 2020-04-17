//
//  UpdateKycList.swift
//  InsightX
//
//  Created by Arish Tripathi on 17/04/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI

struct UpdateKycList: View {
    
    @ObservedObject var KYCData = firebaseData
    
    func addKyc(){
        
        KYCData.KYCData.append(KYC(ClientID: "aa", FirstName: "aa", LastName: "a", ResidentialAddress: "", DateOfBirth: "", GovernmentDocumentAttached: "", PEPCheck: "", MailingAddress: "", TransitAccountNumber: "", TransitAccountHolder: "", SourceOfWealth: "", ClientKnowledge: "", PaperMailing: "", KYCCheck: ""))
    }
    
    var body: some View {
        NavigationView {
            List{
                ForEach(KYCData.KYCData){ item in
                    
                    KYCListView(kyc: item)
                    
                }.onDelete { index in
                    self.KYCData.KYCData.remove(at: index.first!)
                }
                }
            .navigationBarTitle(Text("KYC Tasks"))
                .navigationBarItems(leading: Button(action: {self.addKyc()}) {
                    Text("Add Task")
                }, trailing: EditButton())
            
            }
    }
}

struct UpdateKycList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateKycList()
    }
}


struct KYCListView: View {
    var kyc: KYC
    var body: some View {
        VStack{
            NavigationLink(destination: UpdateKycDetail(kyc: kyc)){
                
                HStack {
                    Image("\(kyc.LastName)")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())

                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text(kyc.FirstName)
                            .font(.system(size: 20, weight: .bold))
                            .lineLimit(2)
                            .font(.subheadline)
                            .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        
                        Text(kyc.LastName)
                        .lineLimit(2)
                        .font(.subheadline)
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        
                        Text(kyc.ClientID)
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    
                    Text("⚠️ "+kyc.KYCCheck)
                    .lineLimit(2)
                    .font(.subheadline)
                    .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                    
                }.padding(.vertical, 8)
                
        }
        
        }
    }
}
