//
//  ExtensionArray.swift
//  test_task
//
//  Created by Anton on 30.08.2018.
//  Copyright © 2018 iOS Brotherhood. All rights reserved.
//

import Foundation

extension Array {
    public subscript(safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
