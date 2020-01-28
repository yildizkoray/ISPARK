//
//  ViewController.swift
//  ISPARK
//
//  Created by Koray Yildiz on 23.01.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit
import UIScrollView_InfiniteScroll

public final class HomeViewController: UIViewController, Storyboarded {

  let api = HomeAPI()
  var hasNext: String = ""

  weak var coordinator: HomeCoordinator?

  @IBOutlet private weak var tableView: UITableView!

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

  override public func viewDidLoad() {
    super.viewDidLoad()

    prepareTableView()

    api.fetctParks { [weak self] response in
      self?.parks = response.records
      self?.hasNext = response.next
    }
  }

  @objc func refresh() {

    parks.removeAll()
    api.fetctParks { [weak self] response in
      self?.parks = response.records
      self?.hasNext = response.next
      self?.refreshControl.endRefreshing()
    }
  }

  fileprivate func prepareTableView() {
    tableView.refreshControl = refreshControl
    prepareInfiniteScroll()
    tableView.register(
      UINib(nibName: String(describing: ParkItemCell.self), bundle: nil),
      forCellReuseIdentifier: ParkItemCell.identifer
    )
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

extension HomeViewController: UITableViewDataSource {

  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return parks.count
  }

  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: ParkItemCell.identifer, for: indexPath) as? ParkItemCell else {
      return UITableViewCell()
    }

    cell.configure(with: parks[indexPath.row])
    return cell
  }
}

extension HomeViewController: UITableViewDelegate {

  public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    coordinator?.goDetailPage(with: parks[indexPath.row])
  }
}
