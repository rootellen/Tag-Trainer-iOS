//
//  Products.swift
//  Tag Trainer
//
//  Created by Ruth Ellen on 08/02/21.
//

import Foundation

class Products {
    private var name: String
    private var id:Int
    private var price: Double
    private var category: String
    private var variant: String
    
    init(_ name:String, _ variant:String, _ category:String, _ id:Int, _ price:Double) {
        self.name = name
        self.variant = variant
        self.category = category
        self.id = id
        self.price = price
    }
    
    func setName(name:String) {
        self.name = name
    }
    
    func getName() -> String {
        return name
    }
    
    func setId(id:Int) {
        self.id = id
    }
    
    func getId() -> Int {
        return self.id
    }
    
    func setPrice(price:Double) {
        self.price = price
    }
    
    func getPrice() -> Double {
        return self.price
    }
    
    func setCategory(category:String) {
        self.category = category
    }
    
    func getCategory() -> String {
        return self.category
    }
    
    func setVariant(variant:String) {
        self.variant = variant
    }
    
    func getVariant() -> String {
        return self.variant
    }
}
    

