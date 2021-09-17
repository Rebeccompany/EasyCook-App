//
//  HomeCollectionViewCell.swift
//  EasyCookApp
//
//  Created by Rebecca Mello on 28/08/21.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    var name: UILabel = {
        let titulo = UILabel()
        titulo.textColor = .white
        titulo.translatesAutoresizingMaskIntoConstraints = false
        titulo.font = UIFont.boldSystemFont(ofSize: 18.0)
        return titulo
    }()
    
    var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 8
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.addSubview(imageView)
        self.addSubview(name)

        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
        self.backgroundColor = .systemGray3
        
        name.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        name.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        name.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        name.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
