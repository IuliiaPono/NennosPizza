//
//  Router+LoaderView.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit
import PromiseKit

extension Router {
    
    func showLoadingView<T>(task: Promise<T>? = nil) {
        guard let viewController = viewController?.view else {
            return
        }
        let pizzaLoadingView = showLoadingView(over: viewController)
        _ = task?.ensure {
            pizzaLoadingView?.removeFromSuperview()
        }
    }
    
    func showLoadingView<T>(over view: UIView, task: Promise<T>? = nil) {
        let pizzaLoadingView = showLoadingView(over: view)
        _ = task?.ensure {
            pizzaLoadingView?.removeFromSuperview()
        }
    }
    
    func showLoadingView() {
        if let viewController = self.viewController?.view {
            showLoadingView(over: viewController)
        }
    }
    
    func hideLoadingView(delay: TimeInterval? = nil) {
        if let viewController = self.viewController?.view {
            hideLoadingView(over: viewController, delay: delay)
        }
    }
    
    @discardableResult
    func showLoadingView(over view: UIView) -> PizzaLoadingView? {
        guard view.subviews.first(where: { $0 is PizzaLoadingView }) == nil else { return nil }
        
        let pizzaLoadingView = loadingView(view.bounds)
        view.addSubview(pizzaLoadingView)
        
        UIView.animate(withDuration: 0.25) {
            pizzaLoadingView.showLoading()
        }
        
        return pizzaLoadingView
    }
    
    func hideLoadingView(over view: UIView, delay: TimeInterval? = nil) {
        let closure = {
            self.hideLoadingView(over: view)
        }
        
        if let delay = delay {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                closure()
            }
        } else {
            closure()
        }
    }
    
    private func hideLoadingView(over view: UIView) {
        if let pizzaLoadingView = view.subviews.last as? PizzaLoadingView {
            UIView.animate(withDuration: 0.25, animations: {
                pizzaLoadingView.hideLoading()
            }, completion: { _ in
                pizzaLoadingView.removeFromSuperview()
            })
        }
    }
    
    private func loadingView(_ frame: CGRect) -> PizzaLoadingView {
        let view = PizzaLoadingView(frame: frame)
        view.hideLoading()
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        return view
    }
}

