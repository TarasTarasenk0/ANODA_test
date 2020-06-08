//
//  CellFooterView.swift
//  ANODA_test
//
//  Created by md760 on 07.06.2020.
//  Copyright © 2020 md760. All rights reserved.
//

import UIKit

final class CellFooterView: UIView {
    
    lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "baseline_favorite_border_black_18dp"), for: .normal)
        button.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
        return button
    }()
    
    let commentButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "outline_mode_comment_black_18dp"), for: .normal)
        return button
    }()
    
    let sendButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "baseline_send_black_18dp"), for: .normal)
        return button
    }()
    
    let saveButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "baseline_bookmark_border_black_18dp"), for: .normal)
        return button
    }()
    
    let likesLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        return label
    }()
    
    let photoDescripionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 12)
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
            $0.left.equalToSuperview().inset(10.0)
            $0.top.equalTo(self.snp.top).inset(6.0)
            $0.width.height.equalTo(30.0)
        }

        addSubview(commentButton)
        commentButton.snp.makeConstraints {
            $0.left.equalTo(likeButton.snp.right).offset(10.0)
            $0.top.equalTo(self.snp.top).offset(6.0)
            $0.width.height.equalTo(30.0)
        }
        
        addSubview(sendButton)
        sendButton.snp.makeConstraints {
            $0.left.equalTo(commentButton.snp.right).offset(10.0)
            $0.top.equalTo(self.snp.top).offset(6.0)
            $0.width.height.equalTo(30.0)
        }
        
        addSubview(saveButton)
        saveButton.snp.makeConstraints {
            $0.right.equalToSuperview().inset(10.0)
            $0.top.equalTo(self.snp.top).offset(6.0)
            $0.width.height.equalTo(30.0)
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
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .blue
    }
    
    @objc func likeButtonClicked() {
        if likeButton.currentImage == #imageLiteral(resourceName: "baseline_favorite_border_black_18dp") {
            likeButton.setImage(#imageLiteral(resourceName: "baseline_favorite_black_18dp"), for: .normal)
        } else {
            likeButton.setImage(#imageLiteral(resourceName: "baseline_favorite_border_black_18dp"), for: .normal)
        }
           likeButton.tintColor = .red
       }
}
