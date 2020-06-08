//
//  HomeViewController.swift
//  ANODA_test
//
//  Created by md760 on 05.06.2020.
//  Copyright © 2020 md760. All rights reserved.
//

import UIKit
import SnapKit

final class HomeViewController: UIViewController {
    
    private lazy var flowCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    //MARK: - Properties
    let homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupCollectionView()
        homeViewModel.updateCollection = {
            self.flowCollectionView.reloadData()
        }
    }
    
    private func setupCollectionView() {
        view.addSubview(flowCollectionView)
        flowCollectionView.register(PostCell.self, forCellWithReuseIdentifier: PostCell.identifier)
        flowCollectionView.snp.makeConstraints {
            $0.top.equalTo(view.snp.topMargin)
            $0.bottom.equalTo(view.snp.bottomMargin)
            $0.left.right.equalToSuperview()
        }
        
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
