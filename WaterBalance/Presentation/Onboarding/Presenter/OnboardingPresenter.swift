//
//  OnboardingPresenter.swift
//  WaterBalance
//
//  Created by Александр Бисеров on 5/8/22.
//

import Foundation

final class OnboardingPresenter {
    var onboardingView: OnboardingViewInput?
}


extension OnboardingPresenter: OnboardingPresenterInput {
    func found(_ data: OnboardingModelDescription) {
        var cellViewModels = [OnboardingCellViewModelDescription]()
        for item in data.onboardinItems {
            let cellViewModel = OnboardingCellViewModel(model: item)
            cellViewModels.append(cellViewModel)
        }
        let onboardingViewModel = OnboardingViewModel(viewModels: cellViewModels)
        onboardingView?.display(onboardingViewModel)
    }
}
