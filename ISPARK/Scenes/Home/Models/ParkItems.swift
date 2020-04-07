//
//  ParkItemResponse.swift
//  ISPARK
//
//  Created by Koray Yildiz on 27.01.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import ObjectMapper

public struct ParkItems: ImmutableMappable {

  let records: [ParkItem]
  let next: String

  public init(map: Map) throws {
    records = try map.value("result.records")
    next = try map.value("result._links.next")
  }
}
