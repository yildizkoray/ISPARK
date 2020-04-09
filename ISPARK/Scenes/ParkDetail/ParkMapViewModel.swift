//
//  ParkMapViewModel.swift
//  ISPARK
//
//  Created by Yildiz, Koray(AWF) on 10.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Foundation

public final class ParkMapViewModel {
    
    public var display: ParkItemDisplay = .empty
    
    public init(with display: ParkItemDisplay) {
        self.display = display
    }
}
