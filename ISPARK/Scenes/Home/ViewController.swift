//
//  ViewController.swift
//  ISPARK
//
//  Created by Koray Yildiz on 23.01.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit
import ObjectMapper
import Alamofire
import AlamofireObjectMapper
import UIScrollView_InfiniteScroll

class ViewController: UIViewController {

  @IBOutlet private weak var tableView: UITableView! {
    didSet {
      tableView.register(
        UINib(nibName: String(describing: ParkItemCell.self), bundle: nil),
        forCellReuseIdentifier: ParkItemCell.identifer
      )
    }
  }

  private var parks: [ParkItem] = [] {
    didSet {
      tableView.reloadData()
    }
  }

  var hasNext: String = ""

  override func viewDidLoad() {
    super.viewDidLoad()
    fetchPark()

    tableView.addInfiniteScroll { [unowned self] (tableView) in
      self.next(next: self.hasNext)
      tableView.finishInfiniteScroll()
    }

    tableView.setShouldShowInfiniteScrollHandler { [unowned self] tableView -> Bool in
      return !self.hasNext.isEmpty
    }
  }

  private func next(next: String){

    let url: URL = URL(string: "https://data.ibb.gov.tr\(next)")!

    AF.request(url).responseObject { [weak self] (response: AFDataResponse<ParkItemResponse>) in

      switch response.result {

      case .success(let data):
        print("Records: ", data)
        self?.parks.append(contentsOf: data.records)
        self?.hasNext = data.next
        self?.tableView.reloadData()


      case .failure(let error):
        print(error)
      }
    }
  }

  private func fetchPark() {
    let url: URL = URL(string: "https://data.ibb.gov.tr/api/3/action/datastore_search?resource_id=c3eb0d72-1ce4-4983-a3a8-6b0b4b19fcb9&limit=5")!

    AF.request(url).responseObject { [weak self] (response: AFDataResponse<ParkItemResponse>) in

      switch response.result {

      case .success(let data):
        print("Records: ", data)
        self?.parks = data.records
        self?.hasNext = data.next

      case .failure(let error):
        print(error)
      }
    }
  }
}

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
