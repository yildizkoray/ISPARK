//
//  String+Additions.swift
//  ISPARK
//
//  Created by Yildiz, Koray(AWF) on 4.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import Foundation

public extension String {
    
    static let empty = ""
    
    var isNotEmpty: Bool {
      return isEmpty == false
    }
}
