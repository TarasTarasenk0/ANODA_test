//
//  PostCell.swift
//  ANODA_test
//
//  Created by md760 on 06.06.2020.
//  Copyright © 2020 md760. All rights reserved.
//

import UIKit

final class PostCell: UICollectionViewCell {
    
    private lazy var photosCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0.0
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        return collectionView
    }()
    
    let topContainerView: CellHeaderView = {
        let view = CellHeaderView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var botContainerView: CellFooterView = {
        let view = CellFooterView()
        view.backgroundColor = .white
        return view
    }()
    
    var images: [String] = [] {
        didSet {
            botContainerView.pageControl.numberOfPages = images.count
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame )
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(topContainerView)
        topContainerView.snp.makeConstraints {
            $0.top.equalTo(self.snp.top)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        photosCollectionView.register(PhotosPostCell.self, forCellWithReuseIdentifier: PhotosPostCell.identifier)
        addSubview(photosCollectionView)
        photosCollectionView.snp.makeConstraints {
            $0.top.equalTo(topContainerView.snp.bottom).offset(6.0)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(500)
        }
        
        addSubview(botContainerView)
        botContainerView.snp.makeConstraints {
            $0.bottom.equalTo(self.snp.bottom)
            $0.left.right.equalToSuperview()
            $0.top.equalTo(photosCollectionView.snp.bottom)
        }
    }
}
