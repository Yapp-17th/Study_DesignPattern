//
//  ViewController.swift
//  ObservingCafe
//
//  Created by 바보세림이 on 2020/08/24.
//  Copyright © 2020 serim. All rights reserved.
//

import UIKit


class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var orderButton: UIButton!
    
    var customerID = 0
    let menu = Menu()
    let barista1 = Barista(id: "dodo")
    let barista2 = Barista(id: "mimi")
    let barista3 = Barista(id: "solsol")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.delegate = self
        menuTableView.dataSource = self
        orderButton.addTarget(self, action: #selector(order), for: .touchUpInside)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.menuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuCell
        cell.menuLabel.text = menu.menuList[indexPath.row].type.rawValue
        cell.priceLabel.text = "\(menu.menuList[indexPath.row].price)원"
        return cell
    }
    
    @objc func order() {
        guard let selectedRow = menuTableView.indexPathForSelectedRow else {
            print("메뉴를 선택해주세요 제발!!!")
            return
        }
        customerID += 1
        let customer = Customer(id: customerID)
        customer.order(coffee: menu.menuList[selectedRow.row])
    }
}


class MenuCell: UITableViewCell {
    @IBOutlet weak var menuLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
}
