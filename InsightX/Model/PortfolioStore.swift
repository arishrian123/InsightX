//
//  PortfolioStore.swift
//  InsightX
//
//  Created by Arish Tripathi on 17/04/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import SwiftUI
import Combine

class PortfolioStore: ObservableObject {
    @Published var portfolio: [Portfolio] = firebaseData.portfolioData
}
