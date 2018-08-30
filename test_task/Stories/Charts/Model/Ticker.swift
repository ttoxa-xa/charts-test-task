//
//  Ticker.swift
//  test_task
//
//  Created by Anton on 30.08.2018.
//  Copyright © 2018 iOS Brotherhood. All rights reserved.
//

import Foundation

struct Ticker {
    let createdAt = Date()
    let lastPrice: Double
    
    init?(with string: String) {
        guard
            let data = string.data(using: .utf8),
            let array = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [Double],
            let lastPrice = array[safe: IndexConstants.lastPrice.rawValue]
        else { return nil }
        
        self.lastPrice = lastPrice
    }
    
    private enum IndexConstants: Int {
        case lastPrice = 7
    }
}
