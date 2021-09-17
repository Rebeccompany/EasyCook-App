//
//  Recipe.swift
//  EasyCookApp
//
//  Created by Gabriel Ferreira de Carvalho on 17/09/21.
//

import Foundation

/**
 export interface RecipeDTO {
     title: string
     preparation_method: string
     preparation_time: number
     portions: number
     ingredients: [{
         name: string
         quantity: number
     }]
 }
 */

struct Recipe: Codable {
    static var shared = Recipe(title: [], preparationMethod: "", preparationTime: 0, portions: 0, ingredients: [])
    
    var title: [String]
    var preparationMethod: String
    var preparationTime: Int
    var portions: Double
    var ingredients: [Ingredient]
    
    enum CodingKeys: String, CodingKey {
        case title
        case preparationMethod = "preparation_method"
        case preparationTime = "preparation_time"
        case portions
        case ingredients
    }
}

struct Ingredient: Codable {
    var name: [String]
    var quantity: Double
}
