//
//  DetailMeals.swift
//  FetchRewardsApp
//
//  Created by Tavon Gibbs on 9/10/21.
//

import Foundation

struct mealsbyid: Codable {
    let strMeal: String
    let idMeal: String
//    let strInstructions: String
//    let strIngredient1: String
//    let strIngredient2: String
//    let strIngredient3: String
//    let strIngredient4: String
//    let strIngredient5: String
//    let strIngredient6: String
//    let strIngredient7: String
//    let strIngredient8: String
}

struct MealResponse: Decodable {
    let meals: [mealsbyid]
}
