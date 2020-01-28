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
  func fetctParks(completion: @escaping (ParkItemResponse) -> Void)
  func next(next: String, completion: @escaping (ParkItemResponse) -> Void)
}

public class HomeAPI: ParkItemProtocol {

  public init() { }

  public func fetctParks(completion: @escaping (ParkItemResponse) -> Void) {
    let url: URL = URL(string: "https://data.ibb.gov.tr/api/3/action/datastore_search?resource_id=c3eb0d72-1ce4-4983-a3a8-6b0b4b19fcb9&limit=5")!

    AF.request(url).responseObject { (response: AFDataResponse<ParkItemResponse>) in

      switch response.result {
      case .success(let data):
        completion(data)

      case .failure(let error):
        print(error)

      }
    }
  }

  public func next(next: String, completion: @escaping (ParkItemResponse) -> Void){

    let url: URL = URL(string: "https://data.ibb.gov.tr\(next)")!

    AF.request(url).responseObject { (response: AFDataResponse<ParkItemResponse>) in

      switch response.result {
      case .success(let data):
        completion(data)

      case .failure(let error):
        print(error)

      }
    }
  }
}
