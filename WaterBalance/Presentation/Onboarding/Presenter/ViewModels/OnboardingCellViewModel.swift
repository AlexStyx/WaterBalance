//
//  OnboardingCellViewModel.swift
//  WaterBalance
//
//  Created by Александр Бисеров on 5/8/22.
//

import Foundation

struct OnboardingCellViewModel: OnboardingCellViewModelDescription {
    var imageName: String
    var advice: AdviceViewViewModelDescription
    
    init(model: OnboardingItemDescription) {
        imageName = model.imageName
        let advice = AdviceViewModel(title: model.title, advice: model.advice)
        self.advice = advice
    }
}
