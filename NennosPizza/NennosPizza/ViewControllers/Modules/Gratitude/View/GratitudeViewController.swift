//
//  GratitudeViewController.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 13/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

protocol GratitudeViewInput: BaseViewInput {
    
}

class GratitudeViewController: BaseViewController {
    var interactor: GratitudeInteractor?
    
    @IBAction private func doNavigateBack() {
        interactor?.moveBack()
    }
}

extension GratitudeViewController: GratitudeViewInput { }
