//
//  ViewController.swift
//  Mission03
//
//  Created by dohan on 05/09/2020.
//  Copyright © 2020 Dohan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    

    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var printBtn: UIButton!
    @IBOutlet weak var printTableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        <#code#>
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        <#code#>
    }


}

