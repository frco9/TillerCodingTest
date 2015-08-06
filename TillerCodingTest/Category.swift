//
//  Category.swift
//  TillerCodingTest
//
//  Created by Jérémie Foucault on 06/08/2015.
//  Copyright (c) 2015 Jérémie Foucault. All rights reserved.
//

import Foundation

class Category: NSObject {
    let name    : String,
    products    : [Product],
    position    : Int
    
    
    init(name: String, products: [Product], position: Int) {
        self.name = name
        self.products = products
        self.position = position
    }
}

