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
    
    var body: some View {
        NavigationView {
            List{
                ForEach(KYCData.KYCData){ item in
                    
                    KYCListView(kyc: item)
                    
            }
            }.navigationBarTitle(Text("KYC Tasks"))
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
            NavigationLink(destination: Text(kyc.ClientID)){
                
                HStack {
                    Image("Logo")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                        .background(Color("primary"))
                        .cornerRadius(20)
                        .padding(.trailing, 4)

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
                    
                    Text(kyc.KYCCheck)
                    .lineLimit(2)
                    .font(.subheadline)
                    .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                    
                }.padding(.vertical, 8)
                
        }
        
        }
    }
}
