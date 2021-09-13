//
//  MealsdetailController.swift
//  FetchRewardsApp
//
//  Created by Tavon Gibbs on 9/13/21.
//

import Foundation

class MealsdetailController {
    enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case delete = "DELETE"
    }
    
    private var baseURL = URL(string: "https://www.themealdb.com")!
    private lazy var detailURL = URL(string: "/api/json/v1/1/lookup.php", relativeTo: baseURL)!

    
    func searchForRecipe(for meal: mealsbyid, completion: @escaping (Recipe?) -> Void) {
        
        print("search term:", meal.idMeal)
        
        
        var urlComponents = URLComponents(url: detailURL, resolvingAgainstBaseURL: true)
        let searchTermQueryItem = URLQueryItem(name: "i", value: meal.idMeal)
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
                let mealDetail = try jsonDecoder.decode(DetailResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(mealDetail.meals.first)
                }
            } catch {
                print("Unable to decode data into object of mealDetail: \(error)")
                print(String(data: data, encoding: .utf8))
            }
        }
        task.resume()
    }
    
}
