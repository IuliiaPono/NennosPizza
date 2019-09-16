//
//  GratitudePresenter.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 13/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

protocol GratitudePresenter: Presenter {
    func moveBack()
}

class DefaultGratitudePresenter: BasePresenter {
    private weak var view: GratitudeViewInput?
    
    init(router: Router, view: GratitudeViewInput?) {
        super.init(router: router)
        self.view = view
    }
}

extension DefaultGratitudePresenter: GratitudePresenter {
    func moveBack() {
        router.popToRoot()
    }
}
