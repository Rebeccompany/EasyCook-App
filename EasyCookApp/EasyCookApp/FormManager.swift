//
//  FormManager.swift
//  EasyCookApp
//
//  Created by Gabriel Ferreira de Carvalho on 01/10/21.
//

import Foundation

class FormManager {
    
    private(set) var recipe: Recipe
    
    init() {
        recipe = Recipe(title: [], preparationMethod: "", preparationTime: 0, portions: 0, ingredients: [])
    }
    
    func addFirstBatchOfInformation(title: String, preparationTime: Int, portion: Double) {
        recipe.title.append(title)
        recipe.preparationTime = preparationTime
        recipe.portions = portion
    }
    
    func addIgredients(title: String, value: Double) {
        let igredient = Ingredient(name: [title], quantity: value)
        recipe.ingredients.append(igredient)
    }
    
    func addPreparationMethod(_ value: String) {
        recipe.preparationMethod = value
    }
    
    
}
