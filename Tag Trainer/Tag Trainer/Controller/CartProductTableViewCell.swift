//
//  CartProductTableViewCell.swift
//  Tag Trainer
//
//  Created by Ruth Ellen on 19/02/21.
//

import UIKit

protocol CartProductTableViewCellDelegate: AnyObject {
    func btTrash(with cartProduct: CartProduct)
    func addToCart(with cartProduct: CartProduct, qtd: Int)
    func removeFromCart(with cartProduct: CartProduct, qtd:Int)
}

class CartProductTableViewCell: UITableViewCell {

    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbPrice: UILabel!
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lbQuantity: UILabel!
    @IBOutlet weak var stQuantity: UIStepper!
    @IBOutlet weak var lbQuantityChange: UILabel!
    @IBOutlet weak var btAddToCart: UIButton!
    @IBOutlet weak var btRemove: UIButton!
    
    let cart = Cart.getInstance()
    var cartProduct: CartProduct?
    weak var delegate: CartProductTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func btTrash(_ sender: UIButton) {
        delegate?.btTrash(with: cartProduct!)
        lbQuantityChange.text = String(0)
        stQuantity.value = 0
    }
    
    func prepare(with cartProduct: CartProduct) {
        let product = cartProduct.getProduct()
        lbQuantity.text = "Quantidade: "+String(cartProduct.getQuantity())
        lbName.text = product.getName()
        imgProduct.image = UIImage(named: product.getName())
        lbPrice.text = "Preço: R$ "+String(format: "%.02f", product.getPrice())
        btAddToCart.layer.cornerRadius = 16
        btRemove.layer.cornerRadius = 16
        self.cartProduct = cartProduct
    }
    
    @IBAction func removeFromCart(_ sender: UIButton) {
        delegate?.removeFromCart(with: cartProduct!, qtd: Int(lbQuantityChange.text!)!)
        lbQuantityChange.text = String(0)
        stQuantity.value = 0
    }
    
    
    @IBAction func addToCart(_ sender: UIButton) {
        delegate?.addToCart(with: cartProduct!, qtd: Int(lbQuantityChange.text!)!)
        lbQuantityChange.text = String(0)
        stQuantity.value = 0
    }
    
    @IBAction func quantityController(_ sender: UIStepper) {
        lbQuantityChange.text = Int(sender.value).description
    }
    
}
