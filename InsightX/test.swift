//
//  test.swift
//  InsightX
//
//  Created by Arish Tripathi on 19/04/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI
import SunburstDiagram

struct test: View {
    var body: some View {
        let configuration = SunburstConfiguration(nodes: [
            Node(name: "Shares", value: 10.0, backgroundColor: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)),
            Node(name: "Bonds", value: 30.0, backgroundColor: .systemRed, children: [
                Node(name: "Dessert", image: UIImage(systemName: "pencil.tip"), value: 6.0),
                Node(name: "Dinner", image: UIImage(named: "poultry"), value: 10.0),
            ]),
            Node(name: "Transport", value: 10.0, backgroundColor: .systemPurple),
            Node(name: "Home", value: 50.0, backgroundColor: .systemTeal),
            ])
        return VStack{
            SunburstView(configuration: configuration)
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
