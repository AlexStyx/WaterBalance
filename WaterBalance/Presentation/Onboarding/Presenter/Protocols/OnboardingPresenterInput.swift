//
//  OnbardingPresenterInput.swift
//  WaterBalance
//
//  Created by Александр Бисеров on 5/8/22.
//

import Foundation


protocol OnboardingPresenterInput: AnyObject {
    func found(_ data: OnboardingModelDescription)
}
