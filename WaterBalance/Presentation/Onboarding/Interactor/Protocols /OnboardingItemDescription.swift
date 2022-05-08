//
//  OnboardingItemDescription.swift
//  WaterBalance
//
//  Created by Александр Бисеров on 5/8/22.
//

import Foundation

protocol OnboardingItemDescription {
    var imageName: String { get }
    var title: String { get }
    var advice: String { get }
}
