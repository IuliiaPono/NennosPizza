//
//  BasePresenter.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation

class BasePresenter {
    let router: Router
    
    init(router: Router) {
        self.router = router
    }
}

extension BasePresenter: Presenter {
    func showLoadingView() {
        router.showLoadingView()
    }
    
    func hideLoadingView() {
        router.hideLoadingView()
    }
}
