//
//  Bundle+Additions.swift
//  ISPARK
//
//  Created by Yildiz, Koray(AWF) on 15.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Foundation

public extension Bundle {
    
    func infoDictionaryValue<T>(forKey key: String) -> T {
        return object(forInfoDictionaryKey: key) as! T
    }
}
