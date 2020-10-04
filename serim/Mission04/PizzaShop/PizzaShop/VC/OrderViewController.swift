//
//  ViewController.swift
//  PizzaShop
//
//  Created by 바보세림이 on 2020/09/13.
//  Copyright © 2020 serim. All rights reserved.
//

import UIKit
import SnapKit
import Then

class OrderViewController: UIViewController {
    lazy var titleLabel = UILabel().then {
        $0.text = "세림이네 피자"
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 35)
    }
    lazy var descriptionLabel = UILabel().then {
        $0.text = "원하시는 메뉴를 선택해주세요."
        $0.textAlignment = .left
    }
    lazy var orderTableView = UITableView()
    lazy var nextButton = UIButton().then {
        $0.setTitle("N E X T", for: .normal)
        $0.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(touchUpNextButton), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orderTableView.dataSource = self
        orderTableView.delegate = self
        orderTableView.register(MainMenuCell.self, forCellReuseIdentifier: "mainMenuCell")
        configureViews()
    }
    
    @objc func touchUpNextButton() {
        guard let selectedIndex = orderTableView.indexPathForSelectedRow else { return }
        let optionVC = OptionViewController(mainMenu: MainToppingType.allCases[selectedIndex.row])
        present(optionVC, animated: true, completion: nil)
    }

    private func configureViews() {
        [titleLabel, descriptionLabel, orderTableView, nextButton].forEach {
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
            $0.bottom.equalTo(nextButton.snp.top).offset(-30)
        }
        nextButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-60)
            $0.width.equalTo(150)
            $0.height.equalTo(50)
        }
    }
}

extension OrderViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MainToppingType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = orderTableView.dequeueReusableCell(withIdentifier: "mainMenuCell") as? MainMenuCell else { return UITableViewCell() }
        cell.menuImageView.image = UIImage(named: "\(MainToppingType.allCases[indexPath.row].getName())")
        cell.menuLabel.text = "\(MainToppingType.allCases[indexPath.row].getName())"
        cell.priceLabel.text = "\(MainToppingType.allCases[indexPath.row].getPrice())원"
        return cell
    }
    
}
