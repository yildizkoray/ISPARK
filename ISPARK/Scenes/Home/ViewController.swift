//
//  ViewController.swift
//  ISPARK
//
//  Created by Koray Yildiz on 23.01.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit
import UIScrollView_InfiniteScroll

class ViewController: UIViewController {

  let api = HomeAPI()

  var hasNext: String = ""

  @IBOutlet private weak var tableView: UITableView! {
    didSet {
      tableView.register(
        UINib(nibName: String(describing: ParkItemCell.self), bundle: nil),
        forCellReuseIdentifier: ParkItemCell.identifer
      )
    }
  }

  let refreshControl : UIRefreshControl = {
    let refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
    return refreshControl
  }()

  private var parks: [ParkItem] = [] {
    didSet {
      tableView.reloadData()
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.refreshControl = refreshControl
    prepareInfiniteScroll()

    api.fetctParks { [weak self] response in
      self?.parks = response.records
      self?.hasNext = response.next
    }
  }

  @objc func refresh() {
    print("Handling refresh..")
    parks.removeAll()
    api.fetctParks { [weak self] response in
      self?.parks = response.records
      self?.hasNext = response.next
    }
  }

  fileprivate func prepareInfiniteScroll() {
    tableView.addInfiniteScroll { [unowned self] (tableView) in
      self.api.next(next: self.hasNext) { [weak self] response in
        self?.parks.append(contentsOf: response.records)
        self?.hasNext = response.next
      }
      tableView.finishInfiniteScroll()
    }

    tableView.setShouldShowInfiniteScrollHandler { [unowned self] tableView -> Bool in
      return !self.hasNext.isEmpty && !self.parks.isEmpty
    }
  }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return parks.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: ParkItemCell.identifer, for: indexPath) as? ParkItemCell else {
      return UITableViewCell()
    }

    cell.configure(with: parks[indexPath.row])
    return cell
  }
}

extension ViewController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("Did clicked row at: \(indexPath.row)")
  }
}
