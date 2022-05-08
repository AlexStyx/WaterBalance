//
//  OnboardingCollecionViewDataSourceDescription.swift
//  WaterBalance
//
//  Created by Александр Бисеров on 5/8/22.
//

import UIKit

protocol OnboardingCollecionViewDataSourceDescription: UICollectionViewDataSource {
    func update(with dataStore: OnboardingViewModelDescription)
}
