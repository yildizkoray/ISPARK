//
//  ParkItemsDisplay.swift
//  ISPARK
//
//  Created by Yildiz, Koray(AWF) on 8.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Foundation

public struct ParkItemsDisplay {
    
    var items: [ParkItemDisplay]
    let next: String
    
    public init(items: ParkItems) {
        self.items = items.records.map(ParkItemDisplay.init)
        self.next = items.next
    }
    
    private init(){
        items = .empty()
        next = .empty
    }
    
    static let empty = ParkItemsDisplay()
}
