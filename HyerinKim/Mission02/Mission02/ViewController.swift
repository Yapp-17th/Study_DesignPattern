//
//  ViewController.swift
//  Mission02
//
//  Created by dohan on 28/08/2020.
//  Copyright © 2020 Dohan. All rights reserved.
//

import UIKit
import Combine



class ViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menu: UIPickerView!
    @IBOutlet weak var orderBtn: UIButton!
    @IBOutlet weak var sum: UILabel!
    
    var total: Int = 0
    @IBAction func order(_ sender: Any) {
        customerNumber += 1
//        var newCustomer = Customer(ordered: selected,customer: customerNumber)
        var newOrder = Ordered(customerNumber,pickerList[selected][1] as! String,.Paid)
        customers.orderedList.append(newOrder)
//        print(newCustomer.orderedCoffee)
//        print(newCustomer.Id)
        print(customers.orderedList)
        let subject = Subject()
        let cash = Cashier(subject)
        let money = cash.$income
        let price:Int = pickerList[selected][2] as! Int
        total += price
        
        
        var subscriber: AnyCancellable? = money.sink(){_ in
            self.sum.text = "\(self.total) 원"
        }

        
        tableView.reloadData()
        
        
    }
    
    var customers = OrderList()
    
    let menuList = ["아메리카노   3500원","라떼  4000","카라멜마끼야또   4500원","바닐라라떼   4500원","자바칩프라푸치노   6000원", "밀크티   5500원"]
    let pickerList = [[0,"아메리카노",3500], [1,"라떼",4000], [2,"카라멜마끼야또",4500], [3,"바닐라라떼",4500] , [4,"자바칩프라푸치노", 6000], [5,"밀크티",5500]]
    var selected = 0
    public var customerNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menu.delegate = self
        menu.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
        

    }
    
    //pickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return menuList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return menuList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selected = row
        
    }
    
    //tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customers.orderedList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as! CustomCell
        cell.number.text = String(customers.orderedList[indexPath.row].ID)
//        cell.number.text = "dkdkdk"
        cell.drink.text = customers.orderedList[indexPath.row].orderedDrink
        cell.status.text = customers.orderedList[indexPath.row].orderStatus.rawValue
        return cell

    }
    
    

}
class Order: Subject{
    var observers: [Observer] = []
    private var orders = [Ordered]()
    
    func addOrder(_ order: Ordered){
        self.orders.append(order)
        
    }
    
}
