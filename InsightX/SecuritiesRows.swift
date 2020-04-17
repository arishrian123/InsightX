//
//  SecuritiesRows.swift
//  InsightX
//
//  Created by Arish Tripathi on 16/04/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI
import ASCollectionView

struct SecuritiesRows: View {
    @ObservedObject private var securitiesData = firebaseData
    var body: some View {
        ASCollectionView(data: securitiesData.securitiesData, dataID: \.self) { item, _ in
                 Color.blue.opacity(40)
                     .overlay(HStack{
                     Text("Name:")
                        Text(item.Company)
                     })
                 }.alwaysBounceVertical().animateOnDataRefresh()
             .layout {
                 .grid(layoutMode: .adaptive(withMinItemSize: 200),
                       itemSpacing: 5,
                       lineSpacing: 5,
                     itemSize: .absolute(200))
         }
    }
}

struct SecuritiesRows_Previews: PreviewProvider {
    static var previews: some View {
        SecuritiesRows()
    }
}
