//
//  OnboardingCellViewModelDescription.swift
//  WaterBalance
//
//  Created by Александр Бисеров on 5/8/22.
//

import Foundation

protocol OnboardingCellViewModelDescription {
    var imageName: String { get }
    var advice: AdviceViewViewModelDescription { get }
}
