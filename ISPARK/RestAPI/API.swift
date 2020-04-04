//
//  RestAPI.swift
//  ISPARK
//
//  Created by Yildiz, Koray(AWF) on 4.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Alamofire
import ObjectMapper
import AlamofireObjectMapper

public class API {
    
    static let shared = API()
    
    public func request<T>(endpoint: Endpoint, completion: @escaping (T) -> Void) where T: ImmutableMappable {
        
        AF.request(endpoint.url).responseObject { (response: AFDataResponse<T>) in
            
            switch response.result {
            case .success(let data):
                completion(data)
                
            case .failure(let error):
                print(error)
            }
        }
    }
}

