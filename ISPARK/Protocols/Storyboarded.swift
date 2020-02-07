//
//  Storyboarded.swift
//  ISPARK
//
//  Created by Koray Yildiz on 28.01.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public protocol Storyboarded {
  static func instantiate(for storyboard: UIStoryboard.Storyboard) -> Self
}

public extension Storyboarded where Self: UIViewController {

  static func instantiate(for storyboard: UIStoryboard.Storyboard) -> Self {

    let id = String(describing: self)
    let storyboard = UIStoryboard(name: storyboard.name, bundle: Bundle.main)
    return storyboard.instantiateViewController(withIdentifier: id) as! Self
  }
}
