//
//  MealsDetailViewController.swift
//  FetchRewardsApp
//
//  Created by Tavon Gibbs on 9/10/21.
//

import UIKit

class MealsDetailViewController: UIViewController {
    
    let detailController = MealsdetailController()
    var details: mealsbyid!
    var recipe: Recipe?
    
    
    @IBOutlet var label: UILabel!
    @IBOutlet var mealName: UILabel!
    @IBOutlet var instructions: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailController.searchForRecipe(for: details) { recipe in
            guard let recipe = recipe else { return }
            self.label.text = self.details.strMeal
            //self.mealName.text = recipe.description
            self.instructions.text = recipe.instructions
            
            for ingredient in recipe.ingredients {
                self.instructions.text? += "\n\(ingredient.name) - \(ingredient.measurement)"
            }
            
            // add a table view of all the ingredients
        }
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}
