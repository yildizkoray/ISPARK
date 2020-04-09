//
//  ParkItemDisplay.swift
//  ISPARK
//
//  Created by Yildiz, Koray(AWF) on 8.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Foundation

private struct Constants {
    
    static let iconWidth = 50
    static let iconHeight = 50
}

public struct ParkItemDisplay {
    
    let icon: URL
    let title: String
    let subtitle: String
    let longitude: Double
    let latitude: Double
    
    public init(item: ParkItem) {
        
        self.icon = .randomIcon(width: Constants.iconWidth, height: Constants.iconHeight)
        self.title = item.name ?? .empty
        self.subtitle = item.location ?? .empty
        self.longitude = item.longitude ?? .zero
        self.latitude = item.latitude ?? .zero
        
    }
    
    private init() {
        
        self.icon = .randomIcon(width: Constants.iconWidth, height: Constants.iconHeight)
        self.title = .empty
        self.subtitle = .empty
        self.longitude = .zero
        self.latitude = .zero
    }
    
    static let empty = ParkItemDisplay()
}
