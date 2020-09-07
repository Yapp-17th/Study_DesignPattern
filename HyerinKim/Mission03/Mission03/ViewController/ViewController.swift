//
//  ViewController.swift
//  Mission03
//
//  Created by dohan on 05/09/2020.
//  Copyright © 2020 Dohan. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource , UITableViewDelegate,UITableViewDataSource {
    

    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var printTableview: UITableView!
    @IBOutlet weak var logTableView: UITableView!
    let file = Files.shared
    let proxy = PrinterProxy.shared
    var selected = 0
    let disposebag = DisposeBag()
    
    @IBAction func printBtn(_ sender: Any) {
        proxy.addPrintFile(file: selected)
        printTableview.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
        printTableview.delegate = self
        printTableview.dataSource = self
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(refresh), userInfo: nil, repeats: true)
        
        
        
    }
    
    //picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return file.getFileList().count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let list = file.getFileList()
        return list[row].title
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selected = row
    }
    
    //table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PrinterProxy.fileQueue.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = printTableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
    @objc
    func refresh(){
        printTableview.reloadData()
        logTableView.reloadData()
        
    }
    

}

