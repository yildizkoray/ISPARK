//
//  HomeAPI.swift
//  ISPARK
//
//  Created by Koray Yildiz on 28.01.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper


public protocol ParkItemProtocol {
  var limit: Int { get }
  func fetchParks(completion: @escaping (ParkItems) -> Void)
  func next(next: String, completion: @escaping (ParkItems) -> Void)
}

public final class HomeAPI: ParkItemProtocol {
    
  let api: API = .shared

  public let limit: Int

  public init(limit: Int) { self.limit = limit }

  public func fetchParks(completion: @escaping (ParkItems) -> Void) {
    
    api.request(endpoint: .parks(limit: limit)) { (response) in
        completion(response)
    }
  }

  public func next(next: String, completion: @escaping (ParkItems) -> Void) {

    api.request(endpoint: .parks(limit: limit)) { (response) in
        completion(response)
    }
  }
}
