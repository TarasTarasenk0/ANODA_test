//
//  PhotosPostCell.swift
//  ANODA_test
//
//  Created by md760 on 07.06.2020.
//  Copyright © 2020 md760. All rights reserved.
//

import UIKit

final class PhotosPostCell: UICollectionViewCell {
    let postPhoto: CustomUIImage = {
        let image = CustomUIImage()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame )
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(postPhoto)
        postPhoto.snp.makeConstraints {
            $0.edges.equalTo(self)
        }
    }
}
