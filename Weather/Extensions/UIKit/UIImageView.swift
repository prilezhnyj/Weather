//
//  UIImageView.swift
//  Weather
//
//  Created by Максим Боталов on 13.06.2022.
//

import UIKit

extension UIImageView {
    convenience init(image: UIImage? = nil) {
        self.init()
        self.image = image
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
