//
//  ManageViewController.swift
//  Mission03-Denny
//
//  Created by Denny on 2020/09/08.
//  Copyright © 2020 KakaoTalk. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

public class ManageViewController: UIViewController {
    private var contentView: UIView = UIView()
    
    private var buttonStackView: UIStackView = UIStackView()
    private var createButton: UIButton = UIButton()
    private var cancelButton: UIButton = UIButton()
    
    private var titleLabel: UILabel = UILabel()
    private var descLabel: UILabel = UILabel()
    
    private var printerListView: UITableView = UITableView()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setViewLayout()
    }
    
    private func setViewLayout() {
        view.backgroundColor = .printerGray200a
        view.addSubview(contentView)
        contentView.backgroundColor = .printerWhite000s
        contentView.layer.cornerRadius = 16
        contentView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        contentView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.top.equalToSuperview().offset(100)
        }
        
        // MARK: Title Section
        contentView.addSubview(titleLabel)
        contentView.addSubview(descLabel)
        
        contentView.addSubview(printerListView)
        contentView.addSubview(buttonStackView)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.centerX.equalToSuperview()
        }
        titleLabel.text = "프린터 목록 관리"
        titleLabel.font = .font26PBold
        titleLabel.textColor = .printerGray900s
        
        descLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        descLabel.text = "프린터 목록을 추가할 수 있습니다."
        descLabel.font = UIFont.font15P
        descLabel.textColor = UIColor(rgb: 0x7c7c7c)
        
        printerListView.snp.makeConstraints { make in
            make.top.equalTo(descLabel.snp.bottom).offset(12)
            make.bottom.equalTo(buttonStackView.snp.top).offset(-12)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        printerListView.separatorInset = .zero
        
        // MARK: Button Section
        buttonStackView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
        }

        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 12
        buttonStackView.distribution = .fillEqually
        buttonStackView.addArrangedSubview(createButton)
        buttonStackView.addArrangedSubview(cancelButton)
        
        createButton.backgroundColor = .printerBlue500s
        createButton.setTitle("새 프린터 추가", for: .normal)
        createButton.titleLabel?.font = .font14P
        createButton.setTitleColor(.printerWhite000s, for: .normal)
        createButton.layer.cornerRadius = 6
        createButton.layer.masksToBounds = true
        createButton.addTarget(self, action: #selector(onClickCreateButton(sender:)), for: .touchUpInside)
        
        cancelButton.backgroundColor = .printerWhite000s
        cancelButton.setTitle("닫기", for: .normal)
        cancelButton.titleLabel?.font = .font14P
        cancelButton.setTitleColor(.printerGray900s, for: .normal)
        cancelButton.layer.cornerRadius = 6
        cancelButton.layer.borderWidth = 0.5
        cancelButton.layer.borderColor = UIColor.printerGray200a.cgColor
        cancelButton.addTarget(self, action: #selector(onClickCancelButton(sender:)), for: .touchUpInside)
        
        cancelButton.snp.makeConstraints { make in
            make.height.equalTo(44)
        }
    }
    
    @objc
    private func onClickCancelButton(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc
    private func onClickCreateButton(sender: UIButton) {
        PrinterProxyManager.shared.createNewPrinter()
    }
}
