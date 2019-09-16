//
//  ImageDownloader.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 11/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation
import Nuke

protocol ImageDownloader {
    func loadImage(from url: String, into imageView: UIImageView, defaultImageName: String)
}

class DefaultImageDownloader: ImageDownloader {
    func loadImage(from url: String, into imageView: UIImageView, defaultImageName: String) {
        guard let url = URL(string: url), let request = try? URLRequest(url: url, method: .get) else { return }
        
        Nuke.loadImage(
            with: ImageRequest(urlRequest: request),
            options: ImageLoadingOptions(
                placeholder: UIImage(named: defaultImageName),
                transition: .fadeIn(duration: 0.33)
            ),
            into: imageView
        )
    }
}
