//
//  CommentsCollectionViewCell.swift
//  EasyCookApp
//
//  Created by Rebecca Mello on 27/08/21.
//

import UIKit

class CommentsCollectionViewCell: UICollectionViewCell {
    var username: UILabel = {
        let titulo = UILabel()
        titulo.textColor = .white
        titulo.translatesAutoresizingMaskIntoConstraints = false
        titulo.font = UIFont.boldSystemFont(ofSize: 18.0)
        return titulo
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.addSubview(username)

        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
        self.backgroundColor = .systemGray3
        
        username.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        username.widthAnchor.constraint(equalToConstant: 100).isActive = true
        username.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        username.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
