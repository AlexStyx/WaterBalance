//
//  OnboardingViewModelDescription.swift
//  WaterBalance
//
//  Created by Александр Бисеров on 5/8/22.
//

import Foundation

protocol OnboardingViewModelDescription {
    var numberOfItems: Int { get }
    func viewModel(for indexPath: IndexPath) -> OnboardingCellViewModelDescription?
}
