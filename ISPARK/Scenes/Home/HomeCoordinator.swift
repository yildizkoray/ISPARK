//
//  HomeCoordinator.swift
//  ISPARK
//
//  Created by Koray Yildiz on 28.01.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public final class HomeCoordinator: Coordinator {

  public var navigationController: UINavigationController

  public init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  public func start() {
    let view = HomeViewController.instantiate(for: .main)
    view.coordinator = self
    navigationController.pushViewController(view, animated: true)
  }

  public func goDetailPage(with item: ParkItem) {
    let view = ParkDetailViewController.instantiate(for: .main)
    view.item = item
    navigationController.pushViewController(view, animated: true)
  }
}
