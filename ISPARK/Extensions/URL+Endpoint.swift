//
//  URL+Endpoint.swift
//  ISPARK
//
//  Created by Yildiz, Koray(AWF) on 1.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Foundation

public extension URL {

    static func makeEndpoint(_ endpoint: String) -> URL {
        let baseURL: String = ConfigReader.shared["Api URL"]
        return URL(string: "\(baseURL)\(endpoint)")!
    }
    
    static func randomIcon(width: Int, height: Int) -> URL {
        let id = String(Int.random(in: 100 ... 500))
        let url: URL = URL(string: "https://i.picsum.photos/id/\(id)/\(width)/\(height).jpg")!
        return url
    }
}
