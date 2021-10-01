//
//  IngredientesViewController.swift
//  EasyCookApp
//
//  Created by Rebecca Mello on 20/08/21.
//

import Foundation
import UIKit

class IngredientesViewController: UIViewController{
    
    var formManager: FormManager?
    
    @IBAction func addIngredientButton(_ sender: Any) {
        let alert = UIAlertController(title: "Ingrediente", message: "", preferredStyle: .alert)
        alert.addTextField { (textField) in
                    textField.placeholder = "Nome"
                }
        alert.addTextField { (textField) in
                    textField.placeholder = "Quantidade"
                }

        alert.addAction(UIAlertAction(title: "Adicionar", style: .default, handler: {[weak self] action in
            let name = alert.textFields![0].text ?? ""
            let value = Double(alert.textFields![1].text ?? "0") ?? 0
            
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(identifier: "new3") as! NewRecipeViewControllerThree
            vc.formManager = self?.formManager
            
            self?.formManager?.addIgredients(title: name, value: value)
            
            self?.navigationController?.pushViewController(vc, animated: true)
            
        }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))

        self.present(alert, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}
