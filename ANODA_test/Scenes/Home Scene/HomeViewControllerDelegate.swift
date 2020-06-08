//
//  HomeViewControllerDelegate.swift
//  ANODA_test
//
//  Created by md760 on 06.06.2020.
//  Copyright © 2020 md760. All rights reserved.
//

import UIKit

//MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
}

//MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeViewModel.homeData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let postCell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCell.identifier, for: indexPath) as! PostCell
        let currentPost = homeViewModel.homeData[indexPath.item]
        postCell.images = currentPost.photoImages
        postCell.topContainerView.profileImageView.setImageFromStringUrl = currentPost.usersProfileImage
        postCell.topContainerView.profileTitle.text = currentPost.userName
        postCell.topContainerView.imageLocationName.text = currentPost.locationName
        postCell.botContainerView.likesLabel.attributedText = currentPost.peopleWhoLiked
        postCell.botContainerView.photoDescripionLabel.attributedText = currentPost.photoDescripion
        postCell.botContainerView.timeLabel.text = currentPost.time
        return postCell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    final public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = 700.0
        let width = collectionView.frame.width
        return CGSize(width: width, height: height)
    }
}
