//
//  HomeViewModel.swift
//  ISPARK
//
//  Created by Yildiz, Koray(AWF) on 5.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Foundation

public final class HomeViewModel {
    
    let api: HomeAPI!
    let limit = 5
    var hasNextPage: Bool = false
    var nextURL: String = .empty {
        didSet {
            hasNextPage = nextURL.isNotEmpty
        }
    }
    
    public init() {
        api = HomeAPI(limit: limit)
    }
    
    public func parks(completion: @escaping (ParkItemsDisplay) -> Void) {
        
        api.fetchParks { [weak self] response in
            let display = ParkItemsDisplay(items: response)
            self?.nextURL = display.next
            completion(display)
        }
    }
    
    public func next(completion: @escaping (ParkItemsDisplay) -> Void){
        
        api.next(next: nextURL) { [weak self] response in
            let display = ParkItemsDisplay(items: response)
            self?.nextURL = display.next
            completion(display)
        }
    }
}
