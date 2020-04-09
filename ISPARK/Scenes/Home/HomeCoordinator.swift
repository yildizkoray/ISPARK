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

  public func goDetailPage(with display: ParkItemDisplay) {
    let view = ParkMapViewController.instantiate(for: .main)
    view.viewModel = ParkMapViewModel(with: display)
    navigationController.pushViewController(view, animated: true)
  }
}
