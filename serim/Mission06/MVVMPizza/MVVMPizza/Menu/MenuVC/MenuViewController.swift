//
//  MenuViewController.swift
//  MVVMPizza
//
//  Created by 고세림 on 2020/11/19.
//

import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

class MenuViewController: UIViewController, PresentDelegate {
    
    var viewModel: MenuViewModelType

    lazy var titleLabel = UILabel().then {
        $0.text = "MVVM 피자 🍕"
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 25)
    }
    lazy var descriptionLabel = UILabel().then {
        $0.text = "원하시는 메뉴를 선택해주세요."
        $0.textAlignment = .left
    }
    lazy var orderTableView = UITableView().then {
        $0.delegate = self
        $0.dataSource = self
        $0.register(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell.ID)
    }
    lazy var nextButton = UIButton().then {
        $0.setTitle("N E X T", for: .normal)
        $0.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(touchUpNextButton), for: .touchUpInside)
    }
    
    init(viewModel: MenuViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setUpLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    @objc func touchUpNextButton() {
        guard let selectedIndex = orderTableView.indexPathForSelectedRow else { return }
        let optionViewModel = OptionViewModel(main: MainToppingType.allCases[selectedIndex.row])
        let optionVC = OptionViewController(viewModel: optionViewModel)
        self.present(optionVC, animated: true, completion: nil)
    }
    
    func pushCartVC() {
        let cartViewModel = CartViewModel()
        let cartVC = CartViewController(viewModel: cartViewModel)
        cartVC.navigationController?.pushViewController(self, animated: false )
    }

}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MainToppingType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = orderTableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.ID) as? MenuTableViewCell else { return UITableViewCell() }
        let cellViewModel = MenuCellViewModel(main: MainToppingType.allCases[indexPath.row])
        cell.configure(viewModel: cellViewModel)
        return cell
    }

}
