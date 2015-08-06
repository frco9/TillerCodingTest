//
//  ProductsTableViewController.swift
//  TillerCodingTest
//
//  Created by Jérémie Foucault on 06/08/2015.
//  Copyright (c) 2015 Jérémie Foucault. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {

    var products: [Product] = [] {
        didSet {
            dispatch_async(dispatch_get_main_queue(),{
                self.tableView.reloadData()
            });
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Sort products according to their position field
        products.sort { $0.position < $1.position }
        
        tableView.registerNib(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "productCell")
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


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> ProductTableViewCell {
        let identifier = "productCell"
        var cell: ProductTableViewCell! = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as! ProductTableViewCell

        
        let product = products[indexPath.row]
        cell.productTitle.text = product.name ?? "[No Name]"
        cell.productPrice.text = String(product.price) ?? "[No Price]"
        
        return cell
    }
    
}