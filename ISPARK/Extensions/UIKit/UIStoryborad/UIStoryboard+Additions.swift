//
//  UIStoryboard+Additions.swift
//  ISPARK
//
//  Created by Koray Yildiz on 7.02.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public extension UIStoryboard {

  enum Storyboard: String {
    case main

    public var name: String {
      return rawValue.capitalized
    }
  }
}
