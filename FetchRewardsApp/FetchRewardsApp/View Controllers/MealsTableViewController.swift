//
//  MealsTableViewController.swift
//  FetchRewardsApp
//
//  Created by Tavon Gibbs on 9/10/21.
//

import UIKit

class MealsTableViewController: UITableViewController {
    
    let mealsController = MealsController()
    var meal: Recipe?
    var category: category!
    
    var strMeal: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        mealsController.searchForMealsByCategory(category) {
            DispatchQueue.main.sync {
                self.tableView.reloadData()
            }
            print(self.mealsController.meals)
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mealsController.meals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        let meal = mealsController.meals[indexPath.row]
        
        cell.textLabel?.text = meal.strMeal
        print(meal.strMeal)

        // Configure the cell...

        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? MealsDetailViewController else { return}
        guard let cell = sender as? UITableViewCell else {return}
        guard let indexPath = tableView.indexPath(for: cell) else { return}
        let details = mealsController.meals[indexPath.row]
        
        detailVC.details = details
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    



}
