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
    private var cancelButton: UIButton = UIButton()
    
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
            make.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(100)
        }
        
        // MARK: Button Section
        view.addSubview(buttonStackView)
        buttonStackView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
        }

        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 12
        buttonStackView.distribution = .fillEqually
        buttonStackView.addArrangedSubview(cancelButton)
        
        cancelButton.backgroundColor = .printerWhite000s
        cancelButton.setTitle("취소", for: .normal)
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
}
