//
//  ProductTableViewCell.swift
//  Tag Trainer
//
//  Created by Ruth Ellen on 18/02/21.
//

import UIKit

protocol ProductTableViewCellDelegate: AnyObject {
    func addToCart(with product: Products)
}

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var btAddToCart: UIButton!
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lbPrice: UILabel!
    
    var cart = Cart.getInstance()
    private var product: Products?
    weak var delegate: ProductTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare(with product: Products) {
        lbName.text = product.getName()
        lbPrice.text = "R$ "+String(format: "%.02f", product.getPrice())
        imgProduct.image = UIImage(named: "\(product.getName())")
        btAddToCart.layer.cornerRadius = 17.5
        self.product = product
    }

    @IBAction func addToCart(_ sender: UIButton) {
        delegate?.addToCart(with: product!)
    }
}
