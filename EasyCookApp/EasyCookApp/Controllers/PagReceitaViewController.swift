//
//  PagReceitaViewController.swift
//  EasyCookApp
//
//  Created by Rebecca Mello on 27/08/21.
//

import UIKit

class PagReceitaViewController: UIViewController {
    let scrollView = UIScrollView()
    
    var usernameLabel = UILabel()
    var timeLabel = UILabel()
    var yieldLabel = UILabel()
    var imageView = UIImageView()
    var ingredientesLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Dentro do didLoad
        view.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height * 1.1)
        usernameLabel.text = "@totitaus"
        timeLabel.text = "Tempo de preparo: 2 horas"
        yieldLabel.text = "Rendimento: 3 porções"
        imageView.backgroundColor = .red

        scrollElements()
        setConstraints()
    }
    
    func scrollElements(){
        scrollView.addSubview(usernameLabel)
        scrollView.addSubview(timeLabel)
        scrollView.addSubview(yieldLabel)
        scrollView.addSubview(imageView)
        scrollView.addSubview(ingredientesLabel)
    }
    
    func setConstraints(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        usernameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        usernameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        usernameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 15).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        timeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        
        yieldLabel.translatesAutoresizingMaskIntoConstraints = false
        yieldLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 15).isActive = true
        yieldLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        yieldLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        yieldLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: yieldLabel.bottomAnchor, constant: 30).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        ingredientesLabel.translatesAutoresizingMaskIntoConstraints = false
        ingredientesLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30).isActive = true
        ingredientesLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        ingredientesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ingredientesLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }

}
