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
    
    var formManager: FormManager?
    
    
    @IBAction func continueRegistration(_ sender: Any) {
        let text = recipeTitle.text ?? ""
        let preparationTime = Int(time.text ?? "0") ?? 0
        let portions = Double(portion.text ?? "0") ?? 0
        
        formManager?.addFirstBatchOfInformation(title: text, preparationTime: preparationTime, portion: portions)
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "new2") as! IngredientesViewController
        vc.formManager = formManager
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
