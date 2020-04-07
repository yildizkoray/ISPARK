//
//  ParkItemCell.swift
//  ISPARK
//
//  Created by Koray Yildiz on 27.01.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public final class ParkItemCell: UITableViewCell {
    
  @IBOutlet private weak var icon: UIImageView!
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var subtitleLabel: UILabel!

  override public func awakeFromNib() {
    super.awakeFromNib()
  }

  override public func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }

  public func configure(with parkItem: ParkItemDisplay) {
    
    titleLabel.text = parkItem.title
    subtitleLabel.text = parkItem.subtitle
    icon.kf_setImage(with: parkItem.icon)
  }
}
