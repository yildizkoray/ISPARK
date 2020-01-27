//
//  ParkItemCell.swift
//  ISPARK
//
//  Created by Koray Yildiz on 27.01.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

class ParkItemCell: UITableViewCell {

  static let identifer = String(describing: self)

  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var subtitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

  public func configure(with parkItem: ParkItem){
    titleLabel.text = parkItem.name
    subtitleLabel.text = parkItem.location
  }
}
