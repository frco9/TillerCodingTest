//
//  ProductsTableViewController.swift
//  TillerCodingTest
//
//  Created by Jérémie Foucault on 06/08/2015.
//  Copyright (c) 2015 Jérémie Foucault. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {

    var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("productCell", forIndexPath: indexPath) as! UITableViewCell
        
        let product = products[indexPath.row]
        cell.textLabel!.text = product.name
        
        return cell
    }
    
}