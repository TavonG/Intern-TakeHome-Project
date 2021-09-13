//
//  MealsController.swift
//  FetchRewardsApp
//
//  Created by Tavon Gibbs on 9/11/21.
//

import Foundation

class MealsController {
    enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case delete = "DELETE"
    }
    
    private var baseURL = URL(string: "https://www.themealdb.com")!
    private lazy var mealURL = URL(string: "/api/json/v1/1/filter.php", relativeTo: baseURL)!
    
    var meals: [mealsbyid] = []
    
    func searchForMealsByCategory(_ category: category, completion: @escaping () -> Void) {

        print("search term:", category.strCategory)
        
        var urlComponents = URLComponents(url: mealURL, resolvingAgainstBaseURL: true)
        let searchTermQueryItem = URLQueryItem(name: "c", value: category.strCategory)
        urlComponents?.queryItems = [searchTermQueryItem]
        
        guard let requestURL = urlComponents?.url else {
            print("Request URL is nil")
            return
        }
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = "GET"
        print(request)
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            guard let data = data else {
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let mealId = try jsonDecoder.decode(MealResponse.self, from: data)
                self.meals.append(contentsOf: mealId.meals)
                print(mealId.meals.count)
                completion()
            } catch {
                print("Unable to decode data into object of type MealId: \(error)")
                print(String(data: data, encoding: .utf8))
            }
        }
        task.resume()
    }
}
