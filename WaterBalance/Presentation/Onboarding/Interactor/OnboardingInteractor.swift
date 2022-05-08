//
//  OnboardingInteractor.swift
//  WaterBalance
//
//  Created by Александр Бисеров on 5/8/22.
//

import Foundation


final class OnboardingInteractor {
    var presenter: OnboardingPresenterInput?
    private var model: OnboardingModelDescription = OnboardingModel(onboardinItems: [
        OnboardingItem(imageName: "bottle", title: "Концентрация внимания и активная работа мозга", advice: "Полезная привычка пить воду в течение дня помогает сохранять концентрацию внимания и активную работу мозга"),
        OnboardingItem(imageName: "leaf", title: "Красота и здоровье", advice: "Употребление достаточного количества воды, оказывает благотворное влияение на организм, помогая сохранить красоту \"изнутри\""),
        OnboardingItem(imageName: "sport", title: "Будьте в форме", advice: "Стакан воды перед едой не только ускоряет метаболизм, но и помогает съесть меньше")

    ])
    
}


extension OnboardingInteractor: OnboardingInteractorInput {
    func viewLoaded() {
        presenter?.found(model)
    }
}
