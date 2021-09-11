//
//  CategoryController.swift
//  FetchRewardsApp
//
//  Created by Tavon Gibbs on 9/10/21.
//

import Foundation

class CategoryController {
    enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case delete = "DELETE"
    }
    
    private let baseURL = URL(string: "https://www.themealdb.com/api.php")!
    private lazy var categoryURL = URL(string: "/api/json/v1/categories.php", relativeTo: baseURL)!
    
    var category: [category] = []
    
    func searchForCategoryWith(searchTerm: String, completion: @escaping () -> Void) {
        
        
        
        var urlComponents = URLComponents(url: categoryURL, resolvingAgainstBaseURL: true)
            let searchTermQueryItem = URLQueryItem(name: "search", value: searchTerm)
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
                let categoryMeal = try jsonDecoder.decode(CategoryMeal.self, from: data)
                self.category.append(contentsOf: categoryMeal.results)
                print(categoryMeal.count)
                completion()
            } catch {
                print("Unable to decode data into object of type CategoryMeal: \(error)")
                print(String(data: data, encoding: .utf8))
            }
        }
        task.resume()
    }
}
