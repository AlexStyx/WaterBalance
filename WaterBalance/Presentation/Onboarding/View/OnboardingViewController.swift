//
//  ViewController.swift
//  WaterBalance
//
//  Created by Александр Бисеров on 5/7/22.
//

import UIKit

final class OnboardingViewController: UIViewController {
    
    override func loadView() {
        view = OnboardingView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        build()
        let closeBarButtoItem = UIBarButtonItem(image: UIImage(named: "close"), style: .done, target: self, action: nil)
        closeBarButtoItem.tintColor = .black
        navigationItem.setRightBarButtonItems([closeBarButtoItem], animated: true)
        navigationController?.navigationBar.backgroundColor = .white
       
    }
    
    private func build() {
        let interactor = OnboardingInteractor()
        let presenter = OnboardingPresenter()
        let onboardingView = view as? OnboardingView
        
        interactor.presenter = presenter
        presenter.onboardingView = onboardingView
        onboardingView?.interactor = interactor
    }


}

