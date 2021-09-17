//
//  ViewController.swift
//  EasyCookApp
//
//  Created by Rebecca Mello on 20/08/21.
//

import UIKit
import Combine

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var searchBar: UISearchBar!
    
    let session: URLSession = .shared
    var recipes: [Recipe] = []
    var cancellables: Set<AnyCancellable> = .init()
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        requestAllRecipes()
    }
    
    private func requestAllRecipes() {
        session
            .dataTaskPublisher(for: URL(string: "http://localhost:3000/recipes")!)
            .map(\.data)
            .decode(type: [Recipe].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .sink(receiveValue: receiveDataAndReloadTable)
            .store(in: &cancellables)
    }
    
    private func receiveDataAndReloadTable(_ recipes: [Recipe]) {
        self.recipes = recipes
        collection.reloadData()
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
        return recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as? HomeCollectionViewCell else {preconditionFailure()}
        
        cell.name.text = recipes[indexPath.row].title.first
        cell.imageView.image = UIImage(named: "banoffe")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = PagReceitaViewController(recipe: recipes[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }


}

