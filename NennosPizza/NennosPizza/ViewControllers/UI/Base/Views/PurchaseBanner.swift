//
//  PurchaseBanner.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 12/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit
import NotificationBannerSwift

final class PurchaseBanner {
    private static let bannerQueue = NotificationBannerQueue()
    
    private class NotificationHintColors: BannerColorsProtocol {
        func color(for style: BannerStyle) -> UIColor {
            switch style {
            case .success:
                return BrandColor.red.asUIColor()
            default:
                return UIColor.clear
            }
        }
    }
    
    func show() {
        let banner = StatusBarNotificationBanner(title: "ADDED TO CART", style: .success, colors: NotificationHintColors())
        
        banner.duration = 3.0
        
        let bannerQueue = PurchaseBanner.bannerQueue
        bannerQueue.removeAll()
        
        banner.show(queuePosition: .front, bannerPosition: .top, queue: bannerQueue, on: nil)
    }
}
