//
//  OnboardingCell.swift
//  WaterBalance
//
//  Created by Александр Бисеров on 5/7/22.
//

import UIKit

fileprivate let imageTopPadding: CGFloat = 125
fileprivate let imageBottomPadding: CGFloat = 150

final class OnboardingCell: UICollectionViewCell {
    
    private var viewModel: OnboardingCellViewModelDescription?
    
    private lazy var adviceView: AdviceView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(AdviceView())
    
    private lazy var imageView: UIImageView = {
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
   
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    func update(with viewModel: OnboardingCellViewModelDescription) {
        imageView.image = UIImage(systemName: viewModel.imageName) ?? UIImage(named: viewModel.imageName)
        adviceView.update(with: viewModel.advice)
    }
    
    private func setupUI() {
        backgroundColor = .white
        addSubivews([
            imageView,
            adviceView
        ])
        layout()
        
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: imageTopPadding),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            
            adviceView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: imageBottomPadding),
            adviceView.bottomAnchor.constraint(equalTo: bottomAnchor),
            adviceView.leadingAnchor.constraint(equalTo: leadingAnchor),
            adviceView.trailingAnchor.constraint(equalTo: trailingAnchor),
            adviceView.heightAnchor.constraint(equalToConstant: adviceViewHeight)
            
        ])
    }
}
