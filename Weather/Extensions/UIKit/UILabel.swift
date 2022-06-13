//
//  UILabel.swift
//  Weather
//
//  Created by Максим Боталов on 13.06.2022.
//

import UIKit

extension UILabel {
    convenience init(text: String? = nil, font: UIFont, textColor: UIColor, textAlignment: NSTextAlignment) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.numberOfLines = 0
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
