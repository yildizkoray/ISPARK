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

    let resource = ImageResource(downloadURL: url)

    if cache.isCached(forKey: resource.cacheKey) {

      cache.retrieveImage(forKey: resource.cacheKey) { [weak self] result in

        switch result {

        case .success(let value):
          self?.icon.image = value.image

        case .failure(let error):
          print(error)
        }
      }
    }
    else {
      let processor = RoundCornerImageProcessor(cornerRadius: 20)
      icon.kf.setImage(with: url, options: [.transition(.fade(0.2)), .processor(processor)])
    }
  }
}
