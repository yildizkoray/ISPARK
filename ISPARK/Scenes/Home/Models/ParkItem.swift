//
//  ParkItem.swift
//  ISPARK
//
//  Created by Koray Yildiz on 27.01.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import ObjectMapper

public struct ParkItem: ImmutableMappable {

  enum Kind: String {
    case onRoad = "YOL ÜSTÜ"
    case open = "AÇIK OTOPARK"
    case indoor = "KAPALI OTOPARK"
    case taxi = "TAKSİ OTOPARK"
    case minibus = "MİNİBÜS PARK"
  }

  let name: String?
  let type: Kind?
  let workingHours: String?
  let district: String?
  let longitude: Double?
  let latitude: Double?
  let location: String?

  public init(map: Map) throws {
    name = try? map.value("Park Adi")
    type = try? map.value("Park Tipi", using: EnumTransform<Kind>())
    workingHours = try? map.value("Calisma Saatleri")
    district = try? map.value("Ilce")
    longitude = try? map.value("Boylam")
    latitude = try? map.value("Enlem")
    location = try? map.value("Adres")
  }
}
