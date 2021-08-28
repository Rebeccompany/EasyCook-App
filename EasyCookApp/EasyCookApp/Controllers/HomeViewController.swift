//
//  ViewController.swift
//  EasyCookApp
//
//  Created by Rebecca Mello on 20/08/21.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var searchBar: UISearchBar!
    
    lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 300, height: 150) // tamanho das células
        layout.scrollDirection = .vertical
        let col = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return col
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collection)
        
        collection.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "homeCell")
        collection.dataSource = self
        collection.delegate = self
        collection.backgroundColor = .clear
        
        setConstraints()
    }
    
    func setConstraints(){
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        collection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        collection.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 15).isActive = true
        collection.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    //MARK: Collection Delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as? HomeCollectionViewCell else {preconditionFailure()}
        
        cell.name.text = "Banoffe"
        cell.imageView.image = UIImage(named: "banoffe")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = PagReceitaViewController()
        navigationController?.pushViewController(vc, animated: true)
    }


}

