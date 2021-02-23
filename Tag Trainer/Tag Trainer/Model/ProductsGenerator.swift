//
//  ProductsGenerator.swift
//  Tag Trainer
//
//  Created by Ruth Ellen on 18/02/21.
//

import Foundation

func generate() -> [Products] {
        var products: [Products] = []
        let product1 = Products("Pato de Borracha", "Amarelo", "Banho", 1001, 5.99)
        let product2 = Products("Escova para Costas", "Azul", "Banho", 1002, 12.40)
        let product3 = Products("Toca de Sapo", "Verde", "Banho", 1003, 8.50)
        let product4 = Products("Esconivete", "Varials", "Higiene Bucal", 1004, 34.99)
        let product5 = Products("Escova de Dedo", "Branco", "Higiene Bucal", 1005, 3.99)
        let product6 = Products("Escova Dedinhos", "Vermelho", "Higiene Bucal", 1006, 42.50)
        
        products.append(product1)
        products.append(product2)
        products.append(product3)
        products.append(product4)
        products.append(product5)
        products.append(product6)
        
        return products
}




