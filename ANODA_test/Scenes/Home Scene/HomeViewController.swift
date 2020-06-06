//
//  HomeViewController.swift
//  ANODA_test
//
//  Created by md760 on 05.06.2020.
//  Copyright © 2020 md760. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    //MARK: - Properties
    var postsArray = [PostModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupNavigationBar()
        NetworkService.getPostDataBy(forResource: "data", ofType: "json", completion: { [weak self] (model) in
            self?.postsArray = model!.data
                DispatchQueue.main.async {
                    //self.collectionView.reloadData()
                }
        
        })
        
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "outline_photo_camera_black_18dp"), style: .plain, target: self, action: #selector(takePhoto))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "baseline_send_black_18dp"), style: .plain, target: self, action: #selector(sendMessage))
        let titleImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 80.0, height: 40.0))
        titleImageView.image = #imageLiteral(resourceName: "hotpng.com")
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
    }
    
    @objc private func takePhoto() {
        print(#function)
    }
    
    @objc private func sendMessage() {
        print(#function)
    }
}
