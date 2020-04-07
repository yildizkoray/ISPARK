//
//  Array+Additions.swift
//  ISPARK
//
//  Created by Yildiz, Koray(AWF) on 4.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Foundation

public extension Array {
    
    static func empty() -> Array {
        return []
    }
    
    mutating func append<T>(contentsOf newElements: T?) where T: Sequence, Element == T.Element {
        
        if let newElements = newElements {
            append(contentsOf: newElements)
        }
    }
}
