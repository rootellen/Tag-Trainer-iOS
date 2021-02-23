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
        return "Total: R$ \(total)"
    }
    
}

extension CartTableViewController: CartProductTableViewCellDelegate {
    
    func btTrash(with cartProduct: CartProduct) {
        cart.removeFromCart(cartProduct.getProduct(), 0, true)
        atualizar()
    }
    
    func addToCart(with cartProduct: CartProduct, qtd: Int) {
        cart.addToCart(cartProduct.getProduct(), qtd)
        atualizar()
    }
    
    func removeFromCart(with cartProduct: CartProduct, qtd: Int) {
        cart.removeFromCart(cartProduct.getProduct(), qtd, false)
        atualizar()
    }
    
}
