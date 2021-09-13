//
//  MealsDetailViewController.swift
//  FetchRewardsApp
//
//  Created by Tavon Gibbs on 9/10/21.
//

import UIKit

class MealsDetailViewController: UIViewController {
    
    var details: meals?
    
    
    @IBOutlet var namelabel: UILabel!
    @IBOutlet var instructionlabel: UILabel!
    @IBOutlet var ingredientslabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(details)
        namelabel.text = details?.strMeal
        instructionlabel.text = details?.strInstructions
        ingredientslabel.text = details?.strIngredient1
        // Do any additional setup after loading the view.
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
