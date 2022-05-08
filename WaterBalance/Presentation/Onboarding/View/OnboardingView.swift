//
//  OnboardingView.swift
//  WaterBalance
//
//  Created by Александр Бисеров on 5/7/22.
//

import UIKit

fileprivate let pageControlHeight: CGFloat = 50

final class OnboardingView: UIView {
    
    var interactor: OnboardingInteractorInput?
    
    private var dataSource: OnboardingCollecionViewDataSourceDescription = OnboardingCollecionViewDataSource()
    
    private var isLoaded = false {
        didSet {
            if isLoaded == true, isLoaded != oldValue {
                interactor?.viewLoaded()
            }
        }
    }
    
    private lazy var collectionViewLayout: UICollectionViewFlowLayout = {
        $0.scrollDirection = .horizontal
        $0.itemSize = CGSize(width: bounds.width, height: safeAreaLayoutGuide.layoutFrame.height - pageControlHeight)
        $0.minimumLineSpacing = 0
        return $0
    }(UICollectionViewFlowLayout())
    
    private lazy var collectionView: UICollectionView = {
        $0.isPagingEnabled = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.dataSource = dataSource
        $0.delegate = self
        $0.backgroundView = UIView()
        let adviceBacbkground = UIView(frame: CGRect(x: 0, y: safeAreaLayoutGuide.layoutFrame.height - 200 - pageControlHeight, width: bounds.width, height: 200))
        adviceBacbkground.backgroundColor = onboardingAdviceBackground
        $0.backgroundView?.addSubview(adviceBacbkground)
        $0.register(OnboardingCell.self, forCellWithReuseIdentifier: String(describing: OnboardingCell.self))
        $0.showsHorizontalScrollIndicator = false
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout))
    
    private lazy var pageControl: PageControl = {
        $0.delegate = self
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(PageControl())
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .white
        setupUI()
        isLoaded = true
    }
    
   
}

// MARK: - Setup UI
extension OnboardingView {
    private func setupUI() {
        addSubivews([
            collectionView,
            pageControl
        ])
        layout()
        setupBottomSafeAreaBackground()
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            
            pageControl.leadingAnchor.constraint(equalTo: leadingAnchor),
            pageControl.trailingAnchor.constraint(equalTo: trailingAnchor),
            pageControl.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            pageControl.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: pageControlHeight)
        ])
    }
    
    private func setupBottomSafeAreaBackground() {
        let safeAreaBackground = UIView(frame: CGRect(x: 0, y: safeAreaLayoutGuide.layoutFrame.maxY, width: bounds.width, height: safeAreaInsets.bottom))
        safeAreaBackground.backgroundColor = onboardingAdviceBackground
        addSubview(safeAreaBackground)
    }
}

// MARK: - OnboardingViewInput
extension OnboardingView: OnboardingViewInput {
    func display(_ viewModel: OnboardingViewModelDescription) {
        pageControl.numberOfPages = viewModel.numberOfItems
        dataSource.update(with: viewModel)
    }
}

// MARK: - UICollectionViewDelegate
extension OnboardingView: UICollectionViewDelegate {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let currentPage = targetContentOffset.pointee.x / bounds.width
        pageControl.currentPage = Int(currentPage)
    }
}

// MARK: - PageControlDelegate
extension OnboardingView: PageControlDelegate {
    func didTapNextButton() {
        if pageControl.currentPage < pageControl.numberOfPages - 1 {
            pageControl.currentPage += 1
            let indexPath = IndexPath(item: pageControl.currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            return
        }
        
    }
}
