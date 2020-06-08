//
//  PostCellDelegate.swift
//  ANODA_test
//
//  Created by md760 on 07.06.2020.
//  Copyright © 2020 md760. All rights reserved.
//

import UIKit

//MARK: - UICollectionViewDelegate
extension PostCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.botContainerView.pageControl.currentPage = indexPath.item
    }
}

//MARK: - UICollectionViewDataSource
extension PostCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let postPhotoCell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosPostCell.identifier, for: indexPath) as! PhotosPostCell
        postPhotoCell.postPhoto.setImageFromStringUrl = images[indexPath.item]
        return postPhotoCell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension PostCell: UICollectionViewDelegateFlowLayout {
    final public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = collectionView.frame.width
        return CGSize(width: width, height: height)
    }
}

