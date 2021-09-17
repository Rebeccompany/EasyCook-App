//
//  NewRecipeControllerFirst.swift
//  EasyCookApp
//
//  Created by Gabriel Ferreira de Carvalho on 17/09/21.
//

import UIKit

class NewRecipeViewControllerFirst: UIViewController {
    
    @IBOutlet weak var recipeTitle: UITextField!
    @IBOutlet weak var time: UITextField!
    @IBOutlet weak var portion: UITextField!
    
    
    @IBAction func continueRegistration(_ sender: Any) {
        Recipe.shared.title.append(recipeTitle.text ?? "")
        Recipe.shared.preparationTime = Int(time.text ?? "0") ?? 0
        Recipe.shared.portions = Double(portion.text ?? "0") ?? 0
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "new2")
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
