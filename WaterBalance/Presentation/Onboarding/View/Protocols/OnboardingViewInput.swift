//
//  OnboardingViewInOut.swift
//  WaterBalance
//
//  Created by Александр Бисеров on 5/8/22.
//

import UIKit

protocol OnboardingViewInput: AnyObject {
    func display(_ viewModel: OnboardingViewModelDescription)
}
