//
//  ParkItemDisplay.swift
//  ISPARK
//
//  Created by Yildiz, Koray(AWF) on 8.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Foundation

public struct ParkItemDisplay {
    
    let icon: URL
    let title: String
    let subtitle: String
    let longitude: Double
    let latitude: Double
    
    public init(item: ParkItem){
        let imageId = String(Int.random(in: 0..<100))
        let url: URL = URL(string: "https://i.picsum.photos/id/\(imageId)/50/50.jpg")!
        
        self.icon = url
        self.title = item.name ?? .empty
        self.subtitle = item.location ?? .empty
        self.longitude = item.longitude ?? .zero
        self.latitude = item.latitude ?? .zero
        
    }
}
