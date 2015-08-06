//
//  CategoriesModelBuilder.swift
//  TillerCodingTest
//
//  Created by Jérémie Foucault on 06/08/2015.
//  Copyright (c) 2015 Jérémie Foucault. All rights reserved.
//

import Foundation

class CategoriesModelBuilder {
    
    class func buildCategoriesFromJSON(categoriesJson: JSON) -> [Category] {
        var categories: [Category] = [];
        
        for (index, categoryJson) in categoriesJson {
            let name : String       = categoryJson["name"].stringValue
            let products: [Product] = self.buildProductsFromJSON(categoryJson["products"])
            let position: Int       = categoryJson["position"].intValue
            
            categories.append(Category(name: name, products: products, position: position))
            
        }
        return categories
    }
    
    class func buildProductsFromJSON(productsJson: JSON) -> [Product] {
        var products: [Product] = [];
        
        for (index, productJson) in productsJson {
            let name : String   = productJson["name"].stringValue
            let price: Int      = productJson["price"].intValue
            let position: Int   = productJson["position"].intValue
            
            products.append(Product(name: name, price: price, position: position))
            
        }
        return products
    }
    
}