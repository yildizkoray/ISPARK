//
//  ParkItemCell.swift
//  ISPARK
//
//  Created by Koray Yildiz on 27.01.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit
import Kingfisher

public final class ParkItemCell: UITableViewCell {

  static let identifer = String(describing: self)

  private let cache = ImageCache.default

  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var subtitleLabel: UILabel!

  @IBOutlet private weak var icon: UIImageView! {
    didSet {
      icon.kf.indicatorType = .activity
    }
  }

  override public func awakeFromNib() {
    super.awakeFromNib()
  }

  override public func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }

  public func configure(with parkItem: ParkItem) {
    
    titleLabel.text = parkItem.name
    subtitleLabel.text = parkItem.location

    let imageId = String(Int.random(in: 0..<100))
    let url: URL = URL(string: "https://i.picsum.photos/id/\(imageId)/50/50.jpg")!
    icon.kf_setImage(with: url)
  }
}
