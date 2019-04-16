//
//  InventoryStruct.swift
//  Inventory
//
//  Created by Weston Verhulst on 4/15/19.
//  Copyright © 2019 Weston Verhulst. All rights reserved.
//

import UIKit

struct Product: Codable {
    var id: Int
    enum category: String {case Computers, Electronics, Kitchen, Pets}
    var title: String
    var price: Double
    var stockedQuantity: Int
}

struct Products: Codable {
    var products: [Product]
}

