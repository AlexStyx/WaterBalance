//
//  UserDefaultsStore.swift
//  WaterBalance
//
//  Created by Александр Бисеров on 5/8/22.
//

import Foundation


final class UserDefaultsStore {
    private static let userDefaults = UserDefaults.standard
    
    // MARK: - Keys
    private static let didFinishOnboardingKey = "did_finish_onboarding"

    
    
    // MARK: - Saving
    static func setDidFinishOnboarding(_ finished: Bool) {
        userDefaults.set(finished, forKey: didFinishOnboardingKey)
    }
    
    
    // MARK: - Getting
    static func didFinishOnboaring() -> Bool {
        return userDefaults.bool(forKey: didFinishOnboardingKey)
    }
}
