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
  func fetchParks(completion: @escaping (ParkItemResponse) -> Void)
  func next(next: String, completion: @escaping (ParkItemResponse) -> Void)
}

public final class HomeAPI: ParkItemProtocol {

  public let limit: Int

  public init(with limit: Int) { self.limit = limit }

  public func fetchParks(completion: @escaping (ParkItemResponse) -> Void) {

    let endpoint = Endpoint.parks(limit: limit)

    AF.request(endpoint.url).responseObject { (response: AFDataResponse<ParkItemResponse>) in

      switch response.result {
      case .success(let data):
        completion(data)

      case .failure(let error):
        print(error)

      }
    }
  }

  public func next(next: String, completion: @escaping (ParkItemResponse) -> Void){

    let endpoint = Endpoint.nextParks(next: next)

    AF.request(endpoint.url).responseObject { (response: AFDataResponse<ParkItemResponse>) in

      switch response.result {
      case .success(let data):
        completion(data)

      case .failure(let error):
        print(error)

      }
    }
  }
}
