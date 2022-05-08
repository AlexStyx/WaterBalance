//
//  OnboardingCollecionViewDataSource.swift
//  WaterBalance
//
//  Created by Александр Бисеров on 5/7/22.
//

import UIKit

final class OnboardingCollecionViewDataSource: NSObject, OnboardingCollecionViewDataSourceDescription {
    
    private var dataStore: OnboardingViewModelDescription?
    
    func update(with dataStore: OnboardingViewModelDescription) {
        self.dataStore = dataStore
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataStore?.numberOfItems ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: OnboardingCell.self), for: indexPath) as? OnboardingCell else { fatalError("Cannot find cell") }
        if let item = dataStore?.viewModel(for: indexPath) {
            cell.update(with: item)
        }
        return cell
    }
    
}
