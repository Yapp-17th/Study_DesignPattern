//
//  OrderViewController.swift
//  Mission02-Denny
//
//  Created by Denny on 2020/08/16.
//

import CoffeeCommon
import Foundation
import Combine
import SnapKit
import UIKit

public class OrderViewController: UIViewController {
    private var viewModel: OrderViewModel? = OrderViewModel()
    private var cancellables: Set<AnyCancellable> = []
    
    private var contentView: UIView = UIView()
    private var buttonStackView: UIStackView = UIStackView()
    private var orderButton: UIButton = UIButton()
    private var cancelButton: UIButton = UIButton()
    
    private var titleLabel: UILabel = UILabel()
    private var descLabel: UILabel = UILabel()
    private var coffeeOptionView: CoffeeOptionSelectionView = CoffeeOptionSelectionView()
    
    private var orderConfirmTitleLabel: UILabel = UILabel()
    private var orderListLabel: UILabel = UILabel()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        setViewLayout()
    }
    
    private func setViewLayout() {
        view.backgroundColor = .talkGray200a
        view.addSubview(contentView)
        contentView.backgroundColor = .talkWhite000s
        contentView.layer.cornerRadius = 16
        contentView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        contentView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(100)
        }
        
        setContentViewLayout()
        setActionButtonLayout()
        bindViewModel()
        viewModel?.generateCoffeeMenu()
    }
    
    private func setContentViewLayout() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(descLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.centerX.equalToSuperview()
        }
        titleLabel.text = "주문하기"
        titleLabel.font = .font26PBold
        titleLabel.textColor = .talkGray900s
        
        descLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        descLabel.text = "메뉴 선택 후 주문해주세요."
        descLabel.font = UIFont.font15P
        descLabel.textColor = UIColor(rgb: 0x7c7c7c)
        
        contentView.addSubview(coffeeOptionView)
        coffeeOptionView.delegate = self
        coffeeOptionView.snp.makeConstraints { make in
            make.top.equalTo(descLabel.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        contentView.addSubview(orderConfirmTitleLabel)
        contentView.addSubview(orderListLabel)
        
        orderConfirmTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(coffeeOptionView.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        orderListLabel.snp.makeConstraints { make in
            make.top.equalTo(orderConfirmTitleLabel.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        orderConfirmTitleLabel.text = "메뉴 확인"
        orderConfirmTitleLabel.font = .font15PBold
        orderConfirmTitleLabel.textColor = .talkGray900s
        
        orderListLabel.text = ""
        orderListLabel.font = .font15PBold
        orderListLabel.textColor = .talkGray900s
    }
    
    private func setActionButtonLayout() {
        view.addSubview(buttonStackView)
        buttonStackView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
        }

        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 12
        buttonStackView.distribution = .fillEqually
        buttonStackView.addArrangedSubview(orderButton)
        buttonStackView.addArrangedSubview(cancelButton)
        
        orderButton.backgroundColor = .talkYellow550s
        orderButton.setTitle("주문하기", for: .normal)
        orderButton.titleLabel?.font = .font14P
        orderButton.setTitleColor(.talkGray900s, for: .normal)
        orderButton.layer.cornerRadius = 6
        orderButton.layer.masksToBounds = true
        
        cancelButton.backgroundColor = .talkWhite000s
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.titleLabel?.font = .font14P
        cancelButton.setTitleColor(.talkGray900s, for: .normal)
        cancelButton.layer.cornerRadius = 6
        cancelButton.layer.borderWidth = 0.5
        cancelButton.layer.borderColor = UIColor.talkGray200a.cgColor
        cancelButton.addTarget(self, action: #selector(onClickCancelButton(sender:)), for: .touchUpInside)
        
        orderButton.snp.makeConstraints { make in
            make.height.equalTo(44)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.height.equalTo(44)
        }
    }
    
    @objc
    private func onClickCancelButton(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func bindViewModel() {
        viewModel?.$coffeeItem.sink { [weak self] item in
            self?.coffeeOptionView.item = item
        }.store(in: &cancellables)
    }
}

extension OrderViewController: CoffeeSelectionInternalDelegate {
    public func selectionInternalView(view: CoffeeSelectionInternalView, at index: Int, selected: Bool) {
        DebugLog("[Selected] 커피이름 : \(viewModel?.coffeeItem.options[index].coffeeName ?? "nil") / 선택여부 : \(selected)")
    }
}
