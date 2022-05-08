//
//  UIView+Subivews.swift
//  WaterBalance
//
//  Created by Александр Бисеров on 5/7/22.
//

import UIKit

extension UIView {
    func addSubivews(_ subivews: [UIView]) {
        for view in subivews {
            addSubview(view)
        }
    }
}


