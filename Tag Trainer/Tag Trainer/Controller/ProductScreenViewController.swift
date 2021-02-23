//
//  ProductScreenViewController.swift
//  Tag Trainer
//
//  Created by Ruth Ellen on 18/02/21.
//

import UIKit

class ProductScreenViewController: UIViewController {

    
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lbQuantity: UILabel!
    @IBOutlet weak var btAddToCart: UIButton!
    @IBOutlet weak var lbPrice: UILabel!
    @IBOutlet weak var stQuantity: UIStepper!
    
    let cart = Cart.getInstance()
    var product: Products!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        btAddToCart.layer.cornerRadius = 20
        stQuantity.wraps = false
        stQuantity.autorepeat = false
        stQuantity.maximumValue = 10
        lbName.text = product.getName()
        imgProduct.image = UIImage(named: product.getName())
        lbPrice.text = "Preço: R$ "+String(product.getPrice())
        lbQuantity.text = "1"
    }
    
    @IBAction func quantityController(_ sender: UIStepper) {
        lbQuantity.text = Int(sender.value).description
    }
    
    @IBAction func addToCart(_ sender: UIButton) {
        cart.addToCart(product, Int(lbQuantity.text!)!)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
