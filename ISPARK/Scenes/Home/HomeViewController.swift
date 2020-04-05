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
    
    weak var coordinator: HomeCoordinator?
    
    private let viewModel = HomeViewModel()
    
    @IBOutlet private weak var tableView: UITableView!
    
    let refreshControl : UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControl
    }()
    
    private var parks: [ParkItem] = .empty() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        prepareNavigation()
        prepareTableView()
        
        viewModel.parks { [weak self] response in
            self?.parks = response.records
        }
    }
    
    @objc func refresh() {
        
        parks.removeAll()
        viewModel.parks { [weak self] response in
            self?.parks = response.records
            self?.refreshControl.endRefreshing()
        }
    }
    
    private func prepareNavigation() {
        title = "ISPARKS"
    }
    
    fileprivate func prepareTableView() {
        tableView.refreshControl = refreshControl
        prepareInfiniteScroll()
        tableView.registerCells(for: [ParkItemCell.self])
    }
    
    fileprivate func prepareInfiniteScroll() {
        
        tableView.addInfiniteScroll { [unowned self] (tableView) in
            self.viewModel.next { [weak self] response in
                self?.parks.append(contentsOf: response.records)
            }
            tableView.finishInfiniteScroll()
        }
        
        tableView.setShouldShowInfiniteScrollHandler { [unowned self] tableView -> Bool in
            return self.viewModel.hasNextPage
        }
    }
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parks.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ParkItemCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(with: parks[indexPath.row])
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.goDetailPage(with: parks[indexPath.row])
    }
}
