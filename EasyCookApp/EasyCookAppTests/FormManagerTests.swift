//
//  FormManagerTests.swift
//  EasyCookAppTests
//
//  Created by Gabriel Ferreira de Carvalho on 01/10/21.
//

import XCTest
@testable import EasyCookApp

class FormManagerTests: XCTestCase {
    
    var sut: FormManager!

    override func setUp() {
        sut = FormManager()
    }

    override func tearDown() {
        sut = nil
    }

    func testFirstBatch() {
        let stubRecipe = Recipe(title: ["Rebeccamarão"], preparationMethod: "", preparationTime: 10, portions: 1, ingredients: [])
        sut.addFirstBatchOfInformation(title: "Rebeccamarão", preparationTime: 10, portion: 1)
        XCTAssertEqual(sut.recipe, stubRecipe)
    }
    
    func testIngredientAdd() {
        let stubIngredient = Ingredient(name: ["RebeSalsicha"], quantity: 2)
        
        sut.addIgredients(title: "RebeSalsicha", value: 2)
        
        XCTAssertEqual([stubIngredient], sut.recipe.ingredients)
    }

    func testPreparationMethod() {
        let stubRecipe = Recipe(title: [], preparationMethod: "Colocar a RebeSsalsicha no Rebeccamarão", preparationTime: 0, portions: 0, ingredients: [])
        sut.addPreparationMethod("Colocar a RebeSsalsicha no Rebeccamarão")
        XCTAssertEqual(sut.recipe, stubRecipe)
    }
    
    func testWholeFormProcess() {
        let stubRecipe = Recipe(title: ["Rebeccamarão"], preparationMethod: "Colocar a RebeSsalsicha no Rebeccamarão", preparationTime: 10, portions: 1, ingredients: [Ingredient(name: ["RebeSalsicha"], quantity: 2)])
        
        sut.addFirstBatchOfInformation(title: "Rebeccamarão", preparationTime: 10, portion: 1)
        sut.addIgredients(title: "RebeSalsicha", value: 2)
        sut.addPreparationMethod("Colocar a RebeSsalsicha no Rebeccamarão")
        
        XCTAssertEqual(sut.recipe, stubRecipe)
    }

}
