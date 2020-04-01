//
//  Endpoint.swift
//  ISPARK
//
//  Created by Yildiz, Koray(AWF) on 1.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Foundation

public enum Endpoint {
    case parks(limit: Int = 15)
    case nextParks(next: String)
    case parkDetail
}

public extension Endpoint {

    var url: URL {

        switch self {

        case .parks(let limit):
            return .makeEndpoint("/api/3/action/datastore_search?resource_id=c3eb0d72-1ce4-4983-a3a8-6b0b4b19fcb9&limit=\(limit)")

        case .nextParks(let next):
            return .makeEndpoint(next)

        case .parkDetail:
            return .makeEndpoint("something")
        }
    }
}
