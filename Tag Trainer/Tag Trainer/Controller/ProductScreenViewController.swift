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
        self.showToast(message: "Adicionado ao Carrinho", font: .systemFont(ofSize: 12.0))
    }
    
    //Toast
    func showToast(message : String, font: UIFont) {

        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 2.5, delay: 0.1, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }

}
