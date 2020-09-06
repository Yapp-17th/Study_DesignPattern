//
//  ViewController.swift
//  SpoolingSimulator
//
//  Created by 바보세림이 on 2020/08/30.
//  Copyright © 2020 serim. All rights reserved.
//

import UIKit

class DocumentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let doc1 = Document(id: "1", "Hi", line: 40)
        PrinterProxy.shared.printDocument(document: doc1)
    }
    
}

