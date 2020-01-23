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

class ViewController: UIViewController {

  @IBOutlet private weak var tableView: UITableView!

  private var parks: [Park] = [] {
    didSet {
      tableView.reloadData()
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    fetchPark()
  }

  private func fetchPark() {
    let url: URL = URL(string: "https://data.ibb.gov.tr/api/3/action/datastore_search?resource_id=c3eb0d72-1ce4-4983-a3a8-6b0b4b19fcb9")!

    AF.request(url).responseObject { [weak self] (response: AFDataResponse<ParkResponse>) in

      switch response.result {

      case .success(let data):
        print("Records: ", data)
        self?.parks = data.records

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
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
    cell.textLabel?.text = "Park Adı: \(parks[indexPath.row].name)"
    cell.detailTextLabel?.text = "Park Adresi: \(parks[indexPath.row].location)"
    return cell
  }
}

public struct ParkResponse: ImmutableMappable {

  let records: [Park]

  public init(map: Map) throws {
    records = try map.value("result.records")
  }
}

public struct Park: ImmutableMappable {


  let name: String
  let location: String

  public init(map: Map) throws {
    name = try map.value("Park Adi")
    location = try map.value("Adres")
  }
}

