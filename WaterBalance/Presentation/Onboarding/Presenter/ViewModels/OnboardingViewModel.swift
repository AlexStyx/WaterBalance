//
//  OnbardingViewModel.swift
//  WaterBalance
//
//  Created by Александр Бисеров on 5/8/22.
//

import Foundation

struct OnboardingViewModel: OnboardingViewModelDescription {
    var numberOfItems: Int {
        viewModels.count
    }
    
    private var viewModels: [OnboardingCellViewModelDescription]
    
    init(viewModels: [OnboardingCellViewModelDescription]) {
        self.viewModels = viewModels
    }
    
    func viewModel(for indexPath: IndexPath) -> OnboardingCellViewModelDescription? {
        if indexPath.item < viewModels.count {
            return viewModels[indexPath.item]
        }
        return nil
    }
}

