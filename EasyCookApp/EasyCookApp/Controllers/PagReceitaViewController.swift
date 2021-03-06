//
//  PagReceitaViewController.swift
//  EasyCookApp
//
//  Created by Rebecca Mello on 27/08/21.
//

import UIKit

class PagReceitaViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    let scrollView = UIScrollView()
    
    var usernameLabel = UILabel()
    var timeLabel = UILabel()
    var yieldLabel = UILabel()
    var imageView = UIImageView()
    var ingredientesLabel = UILabel()
    var ing1 = UILabel()
    var ing2 = UILabel()
    var prepareLabel = UILabel()
    var textView = UITextView()
    var commentsLabel = UILabel()
    var ratingLabel = UILabel()
    var commentButton = UIButton()
    
    lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 300, height: 150) // tamanho das células
        layout.scrollDirection = .horizontal
        let padding: CGFloat = 100
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let col = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return col
    }()
    
    init(recipe: Recipe) {
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = recipe.title.first
        prepareLabel.text = "Tempo de preparo: \(recipe.preparationTime)"
        yieldLabel.text = "Rendimento: \(recipe.portions) porções"
        textView.text = recipe.preparationMethod
        textView.font = .systemFont(ofSize: 24)
        ing1.text = recipe.ingredients[0].name.first
        textView.isEditable = false
        title = recipe.title[0]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        let but = UIBarButtonItem(image: UIImage(systemName: "heart"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(actFave))
        navigationItem.rightBarButtonItem = but
        
        view.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height * 1.6)
        
        configureElements()
        scrollElements()
        setConstraints()
    }
    
    func configureElements(){
        usernameLabel.text = "@totitaus"
        ingredientesLabel.text = "Ingredientes"
        ingredientesLabel.font = .boldSystemFont(ofSize: 20)
        prepareLabel.font = .boldSystemFont(ofSize: 20)
        commentsLabel.text = "Avaliações e comentários"
        commentsLabel.font = .boldSystemFont(ofSize: 20)
        ratingLabel.text = "Avaliação média: 3"
        commentButton.setTitle("Comentar e avaliar", for: .normal)
        commentButton.setTitleColor(.black, for: .normal)
        commentButton.setTitleColor(.systemGray3, for: .highlighted)
        commentButton.setImage(UIImage(named: "plus.circle"), for: .normal)
        commentButton.tintColor = .systemBackground
    }
    
    func scrollElements(){
        scrollView.addSubview(usernameLabel)
        scrollView.addSubview(timeLabel)
        scrollView.addSubview(yieldLabel)
        scrollView.addSubview(imageView)
        scrollView.addSubview(ingredientesLabel)
        scrollView.addSubview(ing1)
        scrollView.addSubview(ing2)
        scrollView.addSubview(prepareLabel)
        scrollView.addSubview(textView)
        scrollView.addSubview(commentsLabel)
        scrollView.addSubview(ratingLabel)
        scrollView.addSubview(commentButton)
        scrollView.addSubview(collection)
        
        collection.register(CommentsCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collection.dataSource = self
        collection.delegate = self
        collection.backgroundColor = .clear
    }
    
    func setConstraints(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
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
        ingredientesLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40).isActive = true
        ingredientesLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        ingredientesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        ingredientesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        
        ing1.translatesAutoresizingMaskIntoConstraints = false
        ing1.topAnchor.constraint(equalTo: ingredientesLabel.bottomAnchor, constant: 15).isActive = true
        ing1.heightAnchor.constraint(equalToConstant: 20).isActive = true
        ing1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        ing1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        
        ing2.translatesAutoresizingMaskIntoConstraints = false
        ing2.topAnchor.constraint(equalTo: ing1.bottomAnchor, constant: 15).isActive = true
        ing2.heightAnchor.constraint(equalToConstant: 20).isActive = true
        ing2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        ing2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        
        prepareLabel.translatesAutoresizingMaskIntoConstraints = false
        prepareLabel.topAnchor.constraint(equalTo: ing2.bottomAnchor, constant: 40).isActive = true
        prepareLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        prepareLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        prepareLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.topAnchor.constraint(equalTo: prepareLabel.bottomAnchor, constant: 15).isActive = true
        textView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        
        commentsLabel.translatesAutoresizingMaskIntoConstraints = false
        commentsLabel.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 40).isActive = true
        commentsLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        commentsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        commentsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.topAnchor.constraint(equalTo: commentsLabel.bottomAnchor, constant: 15).isActive = true
        ratingLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        ratingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        ratingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        
        commentButton.translatesAutoresizingMaskIntoConstraints = false
        commentButton.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 15).isActive = true
        commentButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        commentButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        commentButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.topAnchor.constraint(equalTo: commentButton.bottomAnchor, constant: 20).isActive = true
        collection.heightAnchor.constraint(equalToConstant: 150).isActive = true
        collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        collection.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    @objc func actFave(){
        print("Favoritou")
    }
    
    //MARK: CollectionView Delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CommentsCollectionViewCell else {preconditionFailure()}
        
        cell.username.text = "@totitaus"
        return cell
    }

}
