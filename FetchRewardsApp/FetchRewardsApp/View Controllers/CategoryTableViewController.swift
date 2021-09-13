//
//  CategoryTableViewController.swift
//  FetchRewardsApp
//
//  Created by Tavon Gibbs on 9/10/21.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    
    let categoryController = CategoryController()
   // var name: String?
    
    var strCategory: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        categoryController.searchForCategoryWith(searchTerm: "") {
            DispatchQueue.main.sync {
                self.tableView.reloadData()
            }
            print(self.categoryController.category)
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
        return categoryController.category.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let category = categoryController.category[indexPath.row]
        
        cell.textLabel?.text = category.idCategory
        cell.detailTextLabel?.text = category.strCategory
        print(category.strCategory)
        

        // Configure the cell...

        return cell
    }

    
    // MARK: - Navigation

//    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let mealsVC = segue.destination as? MealsTableViewController else { return}
        guard let cell = sender as? UITableViewCell else { return}
        guard let indexPath = tableView.indexPath(for: cell) else { return}
        let meal = categoryController.category[indexPath.row]
        
        mealsVC.category = meal
        
        
     
    
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    


}
