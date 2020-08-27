//
//  ViewController.swift
//  CoffeeShop
//
//  Created by 바보세림이 on 2020/08/09.
//  Copyright © 2020 serim. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var menuTableView: UITableView!
    let serim = Customer("serim")
    let gogo = Barista("gogo")

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuList.shared.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuCell
        cell.menuLabel.text = MenuList.shared.list[indexPath.row].menu
        cell.priceLabel.text = "\(MenuList.shared.list[indexPath.row].price)원"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        menuTableView.deselectRow(at: indexPath, animated: false)
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "CoffeeViewController") as! CoffeeViewController
        vc.madeCoffee = serim.order(MenuList.shared.list[indexPath.row], in: MenuList.shared, to: gogo)
        self.present(vc,animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.delegate = self
        menuTableView.dataSource = self
    }
    
}

