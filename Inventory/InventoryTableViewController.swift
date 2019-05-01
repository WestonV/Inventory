//
//  InventoryTableViewController.swift
//  Inventory
//
//  Created by Weston Verhulst on 4/16/19.
//  Copyright © 2019 Weston Verhulst. All rights reserved.
//

import UIKit

class InventoryTableViewController: UITableViewController {

    var products = [Product?]()
//    let jsonFileName = "inventory"
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        products = InventoryLoader.load(jsonFileName: jsonFileName)
        if let jsonFileUrl = Bundle.main.url(forResource: "inventory", withExtension: ".json"),
            let jsonData = try? Data(contentsOf: jsonFileUrl) {
            parse(json: jsonData)
        }
    }
    
    func parse(json: Data){
        let decoder = JSONDecoder()
        if let jsonProducts = try? decoder.decode(Products.self, from: json){
            products = jsonProducts.products
            tableView.reloadData()
        }
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return products.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath)

        // Configure the cell...
        let product = products[indexPath.row]
        cell.textLabel?.text = product?.title
        cell.detailTextLabel?.text = "\(product!.stockedQuantity)"
        
        return cell
    }
 



}
