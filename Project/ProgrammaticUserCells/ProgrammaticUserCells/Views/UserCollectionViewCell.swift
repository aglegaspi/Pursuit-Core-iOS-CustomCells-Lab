//
//  UserCollectionViewCell.swift
//  ProgrammaticUserCells
//
//  Created by Alexander George Legaspi on 10/9/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class UserCollectionViewCell: UICollectionViewCell {
    
    /// VIEWS
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    /// LIFE CYCLES & INITIALIZERS
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// FUNCTIONS
    func addViews(){
        backgroundColor = UIColor.white
        addSubview(nameLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.widthAnchor.constraint(equalToConstant: 200),
            nameLabel.heightAnchor.constraint(equalToConstant: 75),
            nameLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)
        ])
    }
    
}
