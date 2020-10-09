//
//  OptionViewController.swift
//  PizzaShop
//
//  Created by 바보세림이 on 2020/10/04.
//  Copyright © 2020 serim. All rights reserved.
//

import UIKit
import SnapKit
import Then
import Toaster

class OptionViewController: UIViewController {
    let manager = Manager()
    
    var mainMenu: MainToppingType
    var totalPrice = 10000
    
    lazy var titleLabel = UILabel().then {
        $0.text = "세림이네 피자"
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 35)
    }
    lazy var descriptionLabel = UILabel().then {
        $0.text = "옵션을 선택해주세요."
        $0.textAlignment = .left
    }
    lazy var orderTableView = UITableView()
    lazy var orderButton = UIButton().then {
        $0.setTitle("주문하기", for: .normal)
        $0.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(order), for: .touchUpInside)
    }
    lazy var totalPriceLabel = UILabel().then {
        $0.textAlignment = .right
        $0.text = "주문금액 : \(totalPrice)원"
        $0.font = .systemFont(ofSize: 20)
    }
    
    init(mainMenu: MainToppingType) {
        self.mainMenu = mainMenu
        self.totalPrice = mainMenu.getPrice()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func order() {
        let user = User(id: "1")
        var options = [OptionToppingType]()
        orderTableView.indexPathsForSelectedRows?.forEach { indexPath in
            options.append(OptionToppingType.allCases[indexPath.row])
        }
        user.order(pizzaType: mainMenu, toppingType: options)
        Toast(text: "주문 완료").show()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orderTableView.dataSource = self
        orderTableView.delegate = self
        orderTableView.register(OptionMenuCell.self, forCellReuseIdentifier: "optionMenuCell")
        orderTableView.allowsMultipleSelection = true
        configureViews()
    }

    private func configureViews() {
        self.view.backgroundColor = .white
        [titleLabel, descriptionLabel, orderTableView, totalPriceLabel, orderButton].forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(60)
            $0.width.equalToSuperview()
            $0.height.equalTo(50)
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(40)
            $0.trailing.equalToSuperview().offset(-40)
            $0.height.equalTo(40)
        }
        orderTableView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(350)
        }
        totalPriceLabel.snp.makeConstraints {
            $0.top.equalTo(orderTableView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(40)
            $0.trailing.equalToSuperview().offset(-40)
            $0.height.equalTo(50)
        }
        orderButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-60)
            $0.width.equalTo(150)
            $0.height.equalTo(50)
        }
    }
}

extension OptionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return OptionToppingType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = orderTableView.dequeueReusableCell(withIdentifier: "optionMenuCell") as? OptionMenuCell else { return UITableViewCell() }
        cell.menuLabel.text = "\(OptionToppingType.allCases[indexPath.row].getName())"
        cell.priceLabel.text = "+\(OptionToppingType.allCases[indexPath.row].getPrice())원"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.totalPrice += OptionToppingType.allCases[indexPath.row].getPrice()
        self.totalPriceLabel.text = "주문금액 : \(totalPrice)원"
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self.totalPrice -= OptionToppingType.allCases[indexPath.row].getPrice()
        self.totalPriceLabel.text = "주문금액 : \(totalPrice)원"
    }
}
