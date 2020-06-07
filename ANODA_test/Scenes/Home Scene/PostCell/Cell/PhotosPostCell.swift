//
//  PhotosPostCell.swift
//  ANODA_test
//
//  Created by md760 on 07.06.2020.
//  Copyright © 2020 md760. All rights reserved.
//

import UIKit

final class PhotosPostCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame )
        setupView()
    }
    
    private func setupView() {
        backgroundColor = .darkGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
