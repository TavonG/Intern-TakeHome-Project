//
//  Category.swift
//  FetchRewardsApp
//
//  Created by Tavon Gibbs on 9/10/21.
//

import Foundation

struct category: Codable {
    let idCategory: String
    let strCategory: String
    let strCategoryDescription: String
}

struct CategoryMeal: Decodable {
    let results: [category]
    let count: Int
}
