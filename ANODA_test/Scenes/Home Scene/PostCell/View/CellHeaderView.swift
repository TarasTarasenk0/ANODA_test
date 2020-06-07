//
//  CellHeaderView.swift
//  ANODA_test
//
//  Created by md760 on 07.06.2020.
//  Copyright © 2020 md760. All rights reserved.
//

import UIKit

final class CellHeaderView: UIView {
    
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .green //set a image then
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = self.frame.width / 2
        return imageView
    }()
    
    let profileTitle: UILabel = {
        let label = UILabel()
        label.backgroundColor = .black
        label.textAlignment = .left
        return label
    }()
    
    let imageLocationName: UILabel = {
        let label = UILabel()
        label.backgroundColor = .brown
        label.textAlignment = .left
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [profileTitle, imageLocationName])
        sv.axis = .vertical
        sv.distribution = .fillEqually
        return sv
    }()
    
    let moreButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .orange
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(profileImageView)
        profileImageView.snp.makeConstraints {
            $0.left.equalTo(self.snp.left).inset(6.0)
            $0.centerY.equalTo(self.snp.centerY)
            $0.height.width.equalTo(35.0)
        }
        
        addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.left.equalTo(profileImageView.snp.right).offset(8.0)
            $0.right.equalTo(self.snp.right).inset(50.0)
            $0.top.equalTo(self.snp.top).inset(6.0)
            $0.bottom.equalTo(self.snp.bottom).inset(6.0)
        }
        
        addSubview(moreButton)
        moreButton.snp.makeConstraints {
            $0.right.equalToSuperview().inset(6.0)
            $0.centerY.equalTo(self.snp.centerY)
            $0.height.width.equalTo(35.0)
        }
    }
}
