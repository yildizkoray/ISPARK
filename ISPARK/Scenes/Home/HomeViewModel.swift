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
    let limit = 15
    var hasNextPage: Bool = false
    var nextURL: String = .empty
    
    public init() {
        api = HomeAPI(limit: limit)
    }
    
    public func parks(completion: @escaping (ParkItemResponse) -> Void) {
        
        api.fetchParks { [weak self] response in
            self?.hasNextPage = response.next.isNotEmpty
            self?.nextURL = response.next
            completion(response)
        }
    }
    
    public func next(completion: @escaping (ParkItemResponse) -> Void){
        
        api.next(next: nextURL) { [weak self] response in
            self?.hasNextPage = response.next.isNotEmpty
            self?.nextURL = response.next
            completion(response)
        }
    }
}
