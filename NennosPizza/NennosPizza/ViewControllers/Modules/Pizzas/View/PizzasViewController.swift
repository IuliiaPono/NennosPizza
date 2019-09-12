//
//  PizzasViewController.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 09/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

protocol PizzasViewInput: BaseViewInput {
    func display(_ pizzaModels: [PizzaBasicCellViewModel])
    func addPurchaseToCart(with pizzaModel: PizzaBasicCellViewModel)
}

class PizzasViewController: BaseViewController {
    @IBOutlet private var tableView: UITableView!
    
    @IBOutlet private var navigationBar: BaseNavigationBarView!
    
    var viewModels: [AnyCellViewModel.Type] {
        return [
            PizzaBasicCellViewModel.self
        ]
    }
    
    var interactor: PizzasInteractor?
    
    private let refreshControl: UIRefreshControl = UIRefreshControl()
    
    private lazy var tableViewAdapter = TableViewDataAdapter<PizzaBasicCellViewModel>(tableView: tableView)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        interactor?.getPizzasList()
    }
    
    override func setupInterface() {
        tableView.refreshControl = refreshControl
        tableView.delegate = self
        tableView.register(viewModels)
        
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    
    private func setupNavigationBar() {
        navigationBar.attachToSafeArea(in: self)
        navigationBar.actionHandler = { [weak self] _ in
            self?.interactor?.openCart()
        }
    }
    
    @IBAction private func refreshData() {
        interactor?.getPizzasList()
    }
}

extension PizzasViewController: PizzasViewInput {
    func addPurchaseToCart(with pizzaModel: PizzaBasicCellViewModel) {
        interactor?.addToCart(pizzaModel)
    }
    
    func display(_ pizzaModels: [PizzaBasicCellViewModel]) {
        tableViewAdapter.data = pizzaModels
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
}

extension PizzasViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let pizzaModel = tableViewAdapter.itemModel(at: indexPath) as? PizzaBasicCellViewModel else { return }
        
        interactor?.openDetails(pizzaModel)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
}
