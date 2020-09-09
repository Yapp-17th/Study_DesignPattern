//
//  ViewController.swift
//  Mission03
//
//  Created by dohan on 05/09/2020.
//  Copyright © 2020 Dohan. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource , UITableViewDelegate,UITableViewDataSource {
    

    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var printTableview: UITableView!
    @IBOutlet weak var logTableView: UITableView!
    
    let file = Files.shared
    let proxy = PrinterProxy.shared
    var selected = 0
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
        printTableview.delegate = self
        printTableview.dataSource = self
        logTableView.delegate = self
        logTableView.dataSource = self
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(refresh), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func printBtn(_ sender: Any) {
        proxy.addPrintFile(file: selected)
        printTableview.reloadData()
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
        var count = 0
        if(tableView == printTableview){
            count = PrinterProxy.fileQueue.count
        }
        if(tableView == logTableView){
            count = PrinterProxy.logArray.count
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(tableView == printTableview){
            let cell = printTableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as! PrinterTableCell
            
            cell.title.text = file.getTitle(row: PrinterProxy.fileQueue[indexPath.row].index)
            cell.status.text = PrinterProxy.fileQueue[indexPath.row].status
            
            return cell
            
        }
        if(tableView == logTableView){
            let cell = logTableView.dequeueReusableCell(withIdentifier: "logCell", for: indexPath) as! LogTableCell
            cell.log.text = PrinterProxy.logArray[indexPath.row]
            
            return cell
            
        }
        
        return UITableViewCell()
    }
    
    @objc
    func refresh(){
        printTableview.reloadData()
        logTableView.reloadData()
        
    }
    

}

