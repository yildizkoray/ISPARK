//
//  ConfigReader.swift
//  ISPARK
//
//  Created by Yildiz, Koray(AWF) on 15.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Foundation

public final class ConfigReader {
    
    static let shared = ConfigReader()
    
    private let config: [String: Any] = Bundle.main.infoDictionaryValue(forKey: "Config")

    public subscript<E>(key: String, default defaultValue: @escaping @autoclosure () -> E) -> E {
      return config[key, default: defaultValue()] as! E
    }

    public subscript(key: String) -> String {
      return self[key, default: .empty]
    }
}
