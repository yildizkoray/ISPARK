//
//  IndexPath+Additions.swift
//  ISPARK
//
//  Created by Yildiz, Koray(AWF) on 4.04.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public extension IndexPath {
    
    static let zero = IndexPath(item: .zero, section: .zero)
    
    func isLastRow(at tableView: UITableView) -> Bool {
        return row == (tableView.numberOfRows(inSection: section) - 1)
    }
    
    var isFirstRow: Bool {
        return row.isZero
    }
}

