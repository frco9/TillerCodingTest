//
//  Product.swift
//  TillerCodingTest
//
//  Created by Jérémie Foucault on 06/08/2015.
//  Copyright (c) 2015 Jérémie Foucault. All rights reserved.
//

import Foundation

class Product: NSObject {
    let name    : String,
        price   : Int,
        position: Int
    
    
    init(name: String, price: Int, position: Int) {
        self.name = name
        self.price = price
        self.position = position
    }
}