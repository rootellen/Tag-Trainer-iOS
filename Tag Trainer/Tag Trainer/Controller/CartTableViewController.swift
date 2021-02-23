//
//  CartTableViewController.swift
//  Tag Trainer
//
//  Created by Ruth Ellen on 19/02/21.
//

import UIKit

class CartTableViewController: UITableViewController {
    
    @IBOutlet weak var btCheckout: UIButton!
    @IBOutlet weak var lbTotal: UILabel!
    @IBOutlet weak var lbSemProdutos: UILabel!
    
    var cart = Cart.getInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        atualizar()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cart.getCartList().count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CartProductTableViewCell

        let cartProducts = cart.getCartList()
        let values = Array(cartProducts.values)
        let value = values[indexPath.row]
        cell.delegate = self
        cell.prepare(with: value)
        
        return cell
    }
    
    func atualizar(){
        tableView.reloadData()
        let p = cart.getCartList()
        if p.isEmpty {
            lbSemProdutos.isHidden = false
        }
        lbTotal.text = somaTotal()
    }
    
    
    @IBAction func goToCheckout(_ sender: Any) {
        let p = cart.getCartList()
        if p.isEmpty {
            let alert = UIAlertController(title: "Carrinho vazio", message: "Não foi possível ir para o checkout", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {_ in }))
            present(alert, animated: true)
        } else {
            performSegue(withIdentifier: "checkout", sender: nil)
        }
    }
    
    func somaTotal() -> String{
        var total = 0.00
        let carrinho = cart.getCartList()
        let produtos = Array(carrinho.values)
        for i in produtos {
            total += Double(i.getTotalPrice())
        }
        return "Total: \(String(format: "%.02f", total))"
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

extension CartTableViewController: CartProductTableViewCellDelegate {
    
    func btTrash(with cartProduct: CartProduct) {
        cart.removeFromCart(cartProduct.getProduct(), 0, true)
        atualizar()
        self.showToast(message: "Removido do carrinho", font: .systemFont(ofSize: 12.0))
    }
    
    func addToCart(with cartProduct: CartProduct, qtd: Int) {
        cart.addToCart(cartProduct.getProduct(), qtd)
        atualizar()
        self.showToast(message: "Adicionado ao carrinho", font: .systemFont(ofSize: 12.0))
    }
    
    func removeFromCart(with cartProduct: CartProduct, qtd: Int) {
        cart.removeFromCart(cartProduct.getProduct(), qtd, false)
        atualizar()
        self.showToast(message: "Removido do carrinho", font: .systemFont(ofSize: 12.0))
    }
    
}
