//
//  CategoriesTableViewController.swift
//  TillerCodingTest
//
//  Created by Jérémie Foucault on 06/08/2015.
//  Copyright (c) 2015 Jérémie Foucault. All rights reserved.
//

import UIKit

class CategoriesTableViewController: UITableViewController {
    let categoriesURL = "https://app.tillersystems.com/api/inventary?restaurant_token=49970acd-39d6-11e5-b995-0ab7c77dd804&provider_token=77429162-39d5-11e5-b995-0ab7c77dd804"
    
    var categories: [Category] = [] {
        didSet {
            dispatch_async(dispatch_get_main_queue(),{
                self.tableView.reloadData()
            });
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Catégories"
        
        JSONService.getDataFromURL(NSURL(string: categoriesURL)!, completion:{(data, error) -> Void in
            if let categoriesRaw = data {
                let categoriesJson = JSON(data: categoriesRaw)
                var categories = CategoriesModelBuilder.buildCategoriesFromJSON(categoriesJson["categories"])
                // Sort categories according to their position field
                categories.sort { $0.position < $1.position }
                
                self.categories += categories
            }
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("categoryCell", forIndexPath: indexPath) as! UITableViewCell

        let category = categories[indexPath.row]
        cell.textLabel!.text = category.name
        
        return cell
    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "productsSegue" {
            if let destination = segue.destinationViewController as? ProductsTableViewController {
                if let categoryIndex = tableView.indexPathForSelectedRow()?.row {
                    destination.products += categories[categoryIndex].products
                }
            }
        }
    }
}
