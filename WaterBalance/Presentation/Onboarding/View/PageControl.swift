//
//  PageControl.swift
//  WaterBalance
//
//  Created by Александр Бисеров on 5/7/22.
//

import UIKit

fileprivate let pageControlLeadingOffset: CGFloat = -15
fileprivate let nextButtonTrailingOffset: CGFloat = -5

protocol PageControlDelegate: AnyObject {
    func didTapNextButton()
}

final class PageControl: UIView {
    
    weak var delegate: PageControlDelegate?
    
    var numberOfPages: Int {
        get {
            pageControl.numberOfPages
        }
        
        set {
            if newValue > 0 {
                pageControl.numberOfPages = newValue
                return
            }
            fatalError("Number of pages cannot be less than zero")
        }
    }
    
    var currentPage: Int {
        get {
            pageControl.currentPage
        }
        
        set {
            if (0..<pageControl.numberOfPages).contains(newValue) {
                pageControl.currentPage = newValue
                return
            }
            fatalError("curren page: \(newValue) is out of bounds: \(0..<pageControl.numberOfPages)")
        }
    }
    
    private lazy var pageControl: UIPageControl = {
        $0.currentPageIndicatorTintColor = UIColor(red: 0, green: 0.48, blue: 1, alpha: 1)
        $0.pageIndicatorTintColor = $0.currentPageIndicatorTintColor?.withAlphaComponent(0.5)
        $0.isUserInteractionEnabled = false
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIPageControl())
    
    private lazy var nextButton: UIButton = {
        $0.configuration = .tinted()
        $0.configuration?.title = "Далее"
        $0.configuration?.image = UIImage(systemName: "chevron.right")
        $0.configuration?.imagePadding = 7
        $0.configuration?.preferredSymbolConfigurationForImage = .init(font: .boldSystemFont(ofSize: 15), scale: .small)
        
        $0.configuration?.imagePlacement = .trailing
        $0.configuration?.baseBackgroundColor = .clear
        $0.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    private func setupUI() {
        backgroundColor = onboardingAdviceBackground
        addSubivews([
            pageControl,
            nextButton
        ])
        layout()
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            pageControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: pageControlLeadingOffset),
            pageControl.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: nextButtonTrailingOffset),
            nextButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    @objc private func didTapNextButton() {
        delegate?.didTapNextButton()
    }
}
