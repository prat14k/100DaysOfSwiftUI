//
//  CupcakeModel.swift
//  100DaysOfSwiftUI
//
//  Created by Prateek on 21/09/20.
//  Copyright © 2020 Prateek. All rights reserved.
//

import Foundation

enum Flavour: String, CaseIterable {
    case vanilla, strawberry, butterScotch
}

class Order: ObservableObject {
    @Published var flavour = Flavour.vanilla.rawValue
    @Published var numberOfCakes = 1
    @Published var hasSpecialRequests = false {
        didSet {
            isExtraFrostingRequested = false
            isExtraSprinklesRequested = false
        }
    }
    @Published var isExtraFrostingRequested = false
    @Published var isExtraSprinklesRequested = false

    @Published var name = ""
    @Published var streetAddress = ""
    @Published var zip = ""
    @Published var city = ""

    var canGoToCheckout: Bool {
        return !name.isEmpty && !streetAddress.isEmpty && !zip.isEmpty && !city.isEmpty
    }
}
