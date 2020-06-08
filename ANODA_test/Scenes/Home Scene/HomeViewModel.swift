//
//  HomeViewModel.swift
//  ANODA_test
//
//  Created by md760 on 08.06.2020.
//  Copyright © 2020 md760. All rights reserved.
//

import UIKit

final class HomeViewModel {
    
    struct HomeData {
        var usersProfileImage = String()
        var userName = String()
        var locationName = String()
        var photoImages = [String]()
        var peopleWhoLiked = NSAttributedString()
        var photoDescripion = NSAttributedString()
        var time = String()
    }
    
    //MARK: - Properties
    var homeData = [HomeData]()
    var updateCollection: (() -> Void)?
    
    //MARK: - Init
    init() {
        receiveModelObjects()
    }
    
    //MARK: - Func
    private func receiveModelObjects() {
        NetworkService.getPostDataBy(forResource: "data", ofType: "json", completion: { [weak self] (model) in
            guard let self = self, let data = model?.data else { return }
            self.homeData = data.map { self.createHomeDataObject($0) }
            DispatchQueue.main.async {
                self.updateCollection?()
            }
        })
    }
    
    func createHomeDataObject(_ model: PostModel) -> HomeData {
        var homeDataObject = HomeData()
        //HeaderView
        homeDataObject.usersProfileImage = model.usersProfileImage
        homeDataObject.locationName = model.locationName
        homeDataObject.userName = model.userName

        //PhotoPostCell
        homeDataObject.photoImages = model.photoImages

        //LikesView
        let peopleWhoLiked = NSMutableAttributedString()
        let lightAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor.gray
        ]
        let boldAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 14),
            .foregroundColor: UIColor.black
        ]
        
        let likeString = NSMutableAttributedString(string: "Liked by ", attributes: lightAttributes)
        peopleWhoLiked.append(likeString)
        let peopleWhoLikedString = model.peopleWhoLiked.map {$0}.joined(separator: ", ")
        let peopleWhoLikedAttribute = NSAttributedString(string: peopleWhoLikedString, attributes: boldAttributes)
        peopleWhoLiked.append(peopleWhoLikedAttribute)
        let andString = NSMutableAttributedString(string: " and ", attributes: lightAttributes)
        peopleWhoLiked.append(andString)
        let likeCountString = NSMutableAttributedString(string: "\(model.likeCount - 2) others", attributes: boldAttributes)
        peopleWhoLiked.append(likeCountString)
        homeDataObject.peopleWhoLiked = peopleWhoLiked
        
        //DescriptionView
        let photoDescription = NSMutableAttributedString()
        let profileString = NSMutableAttributedString(string: model.userName, attributes: boldAttributes)
        photoDescription.append(profileString)
        let commentString = NSMutableAttributedString(string: " Beauty ", attributes: lightAttributes)
        photoDescription.append(commentString)
        let clickableAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor.blue
        ]
        let commentWithCharacters = NSMutableAttributedString(string: model.photoDescripion, attributes: clickableAttributes)
        photoDescription.append(commentWithCharacters)
        homeDataObject.photoDescripion = photoDescription
        
        //TimeView
        homeDataObject.time = model.time
        return homeDataObject
    }
}
