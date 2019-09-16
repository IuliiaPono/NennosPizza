//
//  AppDelegate.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 09/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    private let applicationContext = ApplicationContext()
    
    private var appCoordinator: ApplicationCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        
        guard let window = window else { return true }
        
        appCoordinator = ApplicationCoordinator(window: window, applicationContext: applicationContext)
        
        appCoordinator.start()
        
        return true
    }
}
