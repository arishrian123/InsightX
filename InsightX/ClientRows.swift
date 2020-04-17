//
//  ClientRows.swift
//  InsightX
//
//  Created by Arish Tripathi on 16/04/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI
import ASCollectionView

struct ClientRows: View {
    @ObservedObject private var clientData = firebaseData
    var body: some View {

        
        ASCollectionView(data: clientData.clientData, dataID: \.self) { item, _ in
            Color.blue.opacity(40)
                .overlay(HStack{
                Text("Name:")
                    Text(item.Name)
                Text("")
                Text(item.Surname)
                })
            }.alwaysBounceVertical().animateOnDataRefresh()
        .layout {
            .grid(layoutMode: .adaptive(withMinItemSize: 200),
                  itemSpacing: 5,
                  lineSpacing: 5,
                itemSize: .absolute(200))
    }
}

struct ClientRows_Previews: PreviewProvider {
    static var previews: some View {
        ClientRows()
    }
}
}
