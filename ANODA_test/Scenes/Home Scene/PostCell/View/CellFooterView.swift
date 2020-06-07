//
//  CellFooterView.swift
//  ANODA_test
//
//  Created by md760 on 07.06.2020.
//  Copyright © 2020 md760. All rights reserved.
//

import UIKit

final class CellFooterView: UIView {
    
    let likeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        return button
    }()
    
    let commentButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        return button
    }()
    
    let sendButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        return button
    }()
    
    let saveButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        return button
    }()
    
    let likesLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .purple
        return label
    }()
    
    let photoDescripionLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .blue
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .green
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [likesLabel, photoDescripionLabel, timeLabel])
        sv.axis = .vertical
        sv.distribution = .fillEqually
        return sv
    }()
    
    var pageControl = UIPageControl(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        configurePageControl()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(likeButton)
        likeButton.snp.makeConstraints {
            $0.left.equalToSuperview().inset(6.0)
            $0.top.equalTo(self.snp.top).inset(6.0)
            $0.width.height.equalTo(35.0)
        }
        
        addSubview(commentButton)
        commentButton.snp.makeConstraints {
            $0.left.equalTo(likeButton.snp.right).offset(6.0)
            $0.top.equalTo(self.snp.top).offset(6.0)
            $0.width.height.equalTo(35.0)
        }
        
        addSubview(sendButton)
        sendButton.snp.makeConstraints {
            $0.left.equalTo(commentButton.snp.right).offset(6.0)
            $0.top.equalTo(self.snp.top).offset(6.0)
            $0.width.height.equalTo(35.0)
        }
        
        addSubview(saveButton)
        saveButton.snp.makeConstraints {
            $0.right.equalToSuperview().inset(6.0)
            $0.top.equalTo(self.snp.top).offset(6.0)
            $0.width.height.equalTo(35.0)
        }
        
        addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.right.equalToSuperview().inset(6.0)
            $0.left.equalToSuperview().offset(6.0)
            $0.bottom.equalTo(self.snp.bottom)
            $0.top.equalTo(likeButton.snp.bottom).offset(6.0)
        }
        
        addSubview(pageControl)
        pageControl.snp.makeConstraints {
            $0.centerY.equalTo(likeButton.snp.centerY)
            $0.centerX.equalTo(self.snp.centerX)
            $0.height.equalTo(10.0)
        }
    }
    
    func configurePageControl() {
        pageControl.currentPage = 0
        pageControl.tintColor = .red
        pageControl.pageIndicatorTintColor = .black
        pageControl.currentPageIndicatorTintColor = .green
    }
}
