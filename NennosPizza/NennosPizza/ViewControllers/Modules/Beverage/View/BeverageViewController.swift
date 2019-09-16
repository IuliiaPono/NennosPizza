//
//  BeverageViewController.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 12/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

protocol BeverageViewInput: BaseViewInput {
    func display(_ cartModels: [BasePurchasableViewModel])
    func addPurchaseToCart(with beverageModel: BasePurchasableViewModel)
}

private enum Layout {
    static let rowHeight: CGFloat = 44.0
}

class BeverageViewController: BaseViewController {
    @IBOutlet private var tableView: UITableView!
    
    @IBOutlet private var navigationBar: BaseNavigationBarView!
    
    var viewModels: [AnyCellViewModel.Type] {
        return [
            BasePurchasableViewModel.self
        ]
    }
    
    var interactor: BeverageInteractor?
    
    private let refreshControl: UIRefreshControl = UIRefreshControl()
    
    private lazy var tableViewAdapter = TableViewDataAdapter<BasePurchasableViewModel>(tableView: tableView)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        interactor?.getBeverage()
    }
    
    override func setupInterface() {
        tableView.refreshControl = refreshControl
        tableView.delegate = self
        tableView.register(viewModels)
        
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    
    private func setupNavigationBar() {
        navigationBar.attachToSafeArea(in: self)
        navigationBar.leftActionHandler = { [weak self] _ in
            self?.interactor?.moveBack()
        }
    }
    
    @IBAction private func refreshData() {
        interactor?.getBeverage()
    }
}

extension BeverageViewController: BeverageViewInput {
    func display(_ cartModels: [BasePurchasableViewModel]) {
        tableViewAdapter.data = cartModels
        
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    func addPurchaseToCart(with beverageModel: BasePurchasableViewModel) {
        interactor?.addToCart(beverageModel)
    }
}

extension BeverageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Layout.rowHeight
    }
}
