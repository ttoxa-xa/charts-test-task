//
//  ExtensionString.swift
//  test_task
//
//  Created by Anton on 29.08.2018.
//  Copyright © 2018 iOS Brotherhood. All rights reserved.
//

import Foundation

extension Dictionary {
    func jsonString() -> String? {
        guard
            let data = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted),
            let jsonString = String(data: data, encoding: .utf8)
        else { return nil }
        return jsonString
    }
}
