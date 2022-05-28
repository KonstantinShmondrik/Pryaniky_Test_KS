//
//  FrontView.swift
//  PryanikyTest_KS
//
//  Created by Константин Шмондрик on 27.05.2022.
//

import UIKit

class FrontView: UIView {
    
    var collectionView: UICollectionView!
    
    // MARK: - Init
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = .systemBackground
        setupCollectioneView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    
    func setupCollectioneView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize.height = 100
        layout.itemSize.width = UIScreen.main.bounds.width / 2
        layout.minimumLineSpacing = 50
        
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.register(HzCollectionViewCell.self, forCellWithReuseIdentifier: HzCollectionViewCell.reuseIdentifier)
        collectionView.register(PictureCollectionViewCell.self, forCellWithReuseIdentifier: PictureCollectionViewCell.reuseIdentifier)
        collectionView.register(SelectorCollectionViewCell.self, forCellWithReuseIdentifier: SelectorCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = .systemBackground
        addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
