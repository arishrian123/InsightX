//
//  Firebase.swift
//  InsightX
//
//  Created by Arish Tripathi on 15/04/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct Firebase: View {
    
    var db: Firestore!
    
    let settings = FirestoreSettings()

    Firestore.firestore().settings = settings
    
    db = Firestore.firestore()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Firebase_Previews: PreviewProvider {
    static var previews: some View {
        Firebase()
    }
}
