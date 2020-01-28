//
//  Coordinator.swift
//  ISPARK
//
//  Created by Koray Yildiz on 28.01.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public protocol Coordinator {

  var navigationController: UINavigationController { get set }
  func start()
}
