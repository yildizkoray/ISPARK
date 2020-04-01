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
        URL(string: "https://data.ibb.gov.tr\(endpoint)")!
    }
}
