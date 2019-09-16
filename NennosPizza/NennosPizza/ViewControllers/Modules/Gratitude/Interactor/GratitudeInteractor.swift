//
//  GratitudeInteractor.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 13/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

protocol GratitudeInteractor: Interactor {
    func moveBack()
}

class DefaultGratitudeInteractor: BaseInteractor {
    private let presenter: GratitudePresenter
    
    init(presenter: GratitudePresenter) {
        self.presenter = presenter
        super.init()
    }
}

extension DefaultGratitudeInteractor: GratitudeInteractor {
    func moveBack() {
        presenter.moveBack()
    }
}
