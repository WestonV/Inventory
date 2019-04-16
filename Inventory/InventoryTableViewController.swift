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
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
