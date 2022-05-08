//
//  AdviceView.swift
//  WaterBalance
//
//  Created by Александр Бисеров on 5/8/22.
//

import UIKit

fileprivate let spacingBetweenTitleAndAdvice: CGFloat = 15

final class AdviceView: UIView {
    
    private var title: String? {
        get {
            titleLabel.text
        }
        
        set {
            titleLabel.text = newValue
        }
    }
    
    private var advice: String? {
        get {
            adviceLabel.text
        }
        
        set {
            adviceLabel.text = newValue
        }
    }
    
    private lazy var titleLabel: UILabel = {
        $0.textAlignment = .center
        $0.font = UIFont.boldSystemFont(ofSize: 23)
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    
    private lazy var adviceLabel: UILabel = {
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private lazy var contentView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    func update(with viewModel: AdviceViewViewModelDescription) {
        title = viewModel.title
        advice = viewModel.advice
    }
    
    private func setupUI() {
        backgroundColor = onboardingAdviceBackground
        contentView.addSubivews([
            titleLabel,
            adviceLabel
        ])
        addSubivews([
            contentView
        ])
        
        layout()
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            contentView.centerYAnchor.constraint(equalTo: centerYAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35),
            
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -10),
            
            adviceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: spacingBetweenTitleAndAdvice),
            adviceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            adviceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            adviceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
