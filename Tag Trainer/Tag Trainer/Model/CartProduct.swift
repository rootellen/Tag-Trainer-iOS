//
//  CartProduct.swift
//  Tag Trainer
//
//  Created by Ruth Ellen on 19/02/21.
//

import Foundation

class CartProduct {
    private var product: Products!
    private var quantity: Int
    
    init(_ product: Products, _ quantity: Int) {
        self.product = product
        self.quantity = quantity
    }
    
    func setQuantity(_ quantity: Int) {
        self.quantity = quantity
    }
    
    func getQuantity() -> Int {
        return self.quantity
    }
    
    func getProduct() -> Products {
        return self.product
    }
    
    func getTotalPrice() -> Double {
        return (self.product.getPrice() * Double(self.quantity))
    }
}
