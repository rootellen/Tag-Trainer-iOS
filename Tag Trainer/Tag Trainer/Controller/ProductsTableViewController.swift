//
//  ProductsTableViewController.swift
//  Tag Trainer
//
//  Created by Ruth Ellen on 18/02/21.
//

import UIKit



class ProductsTableViewController: UITableViewController {
    
    @IBOutlet weak var btCart: UIButton!
    
    var cart = Cart.getInstance()
    var products: [Products] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        products = generate()
        btCart.layer.cornerRadius = 25
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ProductScreenViewController {
            let product =  products[tableView.indexPathForSelectedRow!.row]
            vc.product = product
        }
    }

    @IBAction func goToCart(_ sender: UIButton) {
        performSegue(withIdentifier: "cartSegue", sender: nil)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return products.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProductTableViewCell

        let product = products[indexPath.row]
        cell.prepare(with: product)
        cell.delegate = self

        return cell
    }

}

extension ProductsTableViewController: ProductTableViewCellDelegate {
    func addToCart(with product: Products) {
        cart.addToCart(product, 1)
    }
}
