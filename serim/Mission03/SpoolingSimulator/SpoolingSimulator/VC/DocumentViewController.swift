//
//  ViewController.swift
//  SpoolingSimulator
//
//  Created by 바보세림이 on 2020/08/30.
//  Copyright © 2020 serim. All rights reserved.
//

import UIKit
import SnapKit

class DocumentViewController: UIViewController {
    
    let backgroundView = UIView()
    let titleLabel = UILabel()
    let titleTextField = UITextField()
    let lineLabel = UILabel()
    let lineTextField = UITextField()
    let saveButton = UIButton()
    
    var savedDocuments = [Document]()

    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.delegate = self
        lineTextField.delegate = self
        configureViews()
        saveButton.addTarget(self, action: #selector(save), for: .touchUpInside)
    }
    
    @objc func save() {
        guard let title = titleTextField.text, let lineString = lineTextField.text else {
            return
        }
        guard let line = Int(lineString) else {
            return
        }
        let document = Document(id: getId(), title: title, line: line)
        savedDocuments.append(document)
    }

    private func getId() -> String {
        let id = UUID().uuidString
        return String(id.split(separator: "-")[0])
    }
    
    private func configureViews() {
        backgroundView.backgroundColor = UIColor(red: 243/256, green: 242/256, blue: 255/256, alpha: 1)
        titleLabel.text = "Title"
        titleTextField.placeholder = "제목을 입력해주세요."
        titleTextField.borderStyle = .roundedRect
        lineLabel.text = "Line"
        lineTextField.placeholder = "line 수를 입력해주세요."
        lineTextField.borderStyle = .roundedRect
        saveButton.setTitle("Save", for: .normal)
        saveButton.titleLabel?.textColor = .gray
        saveButton.backgroundColor = UIColor(red: 202/256, green: 198/256, blue: 255/256, alpha: 1)
        
        self.view.addSubview(backgroundView)
        backgroundView.addSubview(titleLabel)
        backgroundView.addSubview(titleTextField)
        backgroundView.addSubview(lineLabel)
        backgroundView.addSubview(lineTextField)
        backgroundView.addSubview(saveButton)
        
        backgroundView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(320)
            $0.height.equalTo(400)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(120)
            $0.leading.equalTo(20)
            $0.width.equalTo(40)
            $0.height.equalTo(30)
        }
        
        titleTextField.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.trailing).offset(10)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(30)
            $0.centerY.equalTo(titleLabel)
        }
        
        lineLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(50)
            $0.leading.equalTo(20)
            $0.width.equalTo(40)
        }
        
        lineTextField.snp.makeConstraints {
            $0.leading.equalTo(lineLabel.snp.trailing).offset(10)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(30)
            $0.centerY.equalTo(lineLabel)
        }
        
        saveButton.snp.makeConstraints {
            $0.top.equalTo(lineLabel.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(40)
        }
    }
}

extension DocumentViewController: UITextFieldDelegate {
    
}
