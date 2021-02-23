//
//  Cart.swift
//  Tag Trainer
//
//  Created by Ruth Ellen on 19/02/21.
//

import Foundation

class Cart {
    private static var cart: Cart?
    private var cartList: [Int : CartProduct]
    
    init() {
        cartList = [:]
    }
    
    static func getInstance() -> Cart {
        if cart == nil {
            cart = Cart()
        }
        return cart!
    }
    
    func getCartList() -> [Int : CartProduct] {
        return self.cartList
    }
    
    func addToCart(_ product: Products, _ quantity:Int) {
        let keys = Array(cartList.keys)
        var flag = 0
        for i in keys {
            if i == product.getId() {
                let newQuantity = (cartList[product.getId()]?.getQuantity())! + quantity
                cartList.updateValue(CartProduct(product, newQuantity), forKey: product.getId())
                flag += 1
            }
        }
        if flag == 0 {
            cartList[product.getId()] = CartProduct(product, quantity)
        }
    }
    
    func removeFromCart(_ product: Products, _ quantity: Int, _ tudo: Bool) {
        if tudo == true {
            cartList.removeValue(forKey: product.getId())
        } else {
            let newQuantity = (cartList[product.getId()]?.getQuantity())! - quantity
            if newQuantity <= 0 {
                cartList.removeValue(forKey: product.getId())
            } else {
                cartList.updateValue(CartProduct(product, newQuantity), forKey: product.getId())
            }
        }
    }
    
    func emptyCart() {
        cartList = [:]
    }
}
