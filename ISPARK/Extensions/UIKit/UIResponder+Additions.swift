//
//  UIResponder+Additions.swift
//  ISPARK
//
//  Created by Yildiz, Koray(AWF) on 4.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public extension UIResponder {

  @objc class var nib: UINib {
    return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
  }
}
