//
//  UITableView+Additions.swift
//  ISPARK
//
//  Created by Yildiz, Koray(AWF) on 4.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public extension UITableView {
    
    func registerCells(for types: [UITableViewCell.Type]) {
      types.forEach { type in
        register(type.nib, forCellReuseIdentifier: String(describing: type))
      }
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
      let identifier = String(describing: T.self)
      return dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! T
    }
}
