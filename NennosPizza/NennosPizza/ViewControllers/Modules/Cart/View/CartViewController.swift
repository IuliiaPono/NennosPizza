//
//  CartViewController.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 12/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

protocol CartViewInput: BaseViewInput {
    func display(_ cartModels: [BasePurchasableViewModel], totalPrice: String)
    func removeFromCart(_ purchase: BasePurchasableViewModel)
}

class CartViewController: BaseViewController {
    @IBOutlet private var tableView: UITableView!
    
    @IBOutlet private var navigationBar: BaseNavigationBarView!
    
    var viewModels: [AnyCellViewModel.Type] {
        return [
            BasePurchasableViewModel.self
        ]
    }
    
    var interactor: CartInteractor?
    
    private let refreshControl: UIRefreshControl = UIRefreshControl()
    
    private lazy var tableViewAdapter = TableViewDataAdapter<BasePurchasableViewModel>(tableView: tableView)
    
    private var cartFooterView: CartFooterView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setFooterView()
        
        interactor?.getPurchases()
    }
    
    override func setupInterface() {
        tableView.refreshControl = refreshControl
        tableView.delegate = self
        tableView.register(viewModels)
        
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    
    private func setFooterView() {
        let footerFrame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 88)
        let footerView = CartFooterView(frame: footerFrame)
        
        tableView.tableFooterView = footerView
        self.cartFooterView = footerView
    }
    
    private func setupNavigationBar() {
        navigationBar.attachToSafeArea(in: self)
        navigationBar.leftActionHandler = { [weak self] _ in
            self?.interactor?.moveBack()
        }
        navigationBar.rightActionHandler = { [weak self] _ in
            self?.interactor?.openBeverage()
        }
    }
    
    @IBAction private func refreshData() {
        interactor?.getPurchases()
    }
    
    @IBAction private func doCheckout() {
        
    }
}

extension CartViewController: CartViewInput {
    func display(_ cartModels: [BasePurchasableViewModel], totalPrice: String) {
        tableViewAdapter.data = cartModels
        
        cartFooterView.updateSum(with: totalPrice)
        
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    func removeFromCart(_ purchase: BasePurchasableViewModel) {
        interactor?.removeFromCart(purchase)
    }
}

extension CartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
}
