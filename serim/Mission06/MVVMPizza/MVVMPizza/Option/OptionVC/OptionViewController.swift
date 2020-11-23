//
//  OptionViewController.swift
//  MVVMPizza
//
//  Created by 고세림 on 2020/11/19.
//

import UIKit

protocol PresentDelegate: class {
    func pushCartVC()
}

class OptionViewController: UIViewController {
    
    var viewModel: OptionViewModelType
    var delegate: PresentDelegate?
    
    lazy var titleLabel = UILabel().then {
        $0.text = "MVVM 피자"
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 35)
    }
    lazy var descriptionLabel = UILabel().then {
        $0.text = "옵션을 선택해주세요."
        $0.textAlignment = .left
    }
    lazy var orderTableView = UITableView().then {
        $0.dataSource = self
        $0.delegate = self
        $0.register(OptionTableViewCell.self, forCellReuseIdentifier: OptionTableViewCell.ID)
        $0.allowsMultipleSelection = true
    }
    lazy var orderButton = UIButton().then {
        $0.setTitle("장바구니 담기", for: .normal)
        $0.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(order), for: .touchUpInside)
    }
    lazy var totalPriceLabel = UILabel().then {
        $0.textAlignment = .right
        $0.text = "주문금액 : \(viewModel.totalPrice)원"
        $0.font = .systemFont(ofSize: 20)
    }
    
    init(viewModel: OptionViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func order() {
        var options = [OptionToppingType]()
        orderTableView.indexPathsForSelectedRows?.forEach { indexPath in
            options.append(OptionToppingType.allCases[indexPath.row])
        }
        viewModel.orderPizza()
        let cartViewModel = CartViewModel()
        let cartVC = CartViewController(viewModel: cartViewModel)
        self.present(cartVC, animated: true, completion: nil)
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
}

extension OptionViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return OptionToppingType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = orderTableView.dequeueReusableCell(withIdentifier: OptionTableViewCell.ID) as? OptionTableViewCell else { return UITableViewCell() }
        let viewModel = OptionCellViewModel(item: OptionToppingType.allCases[indexPath.row])
        cell.configure(viewModel: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.add(item: OptionToppingType.allCases[indexPath.row])
        self.totalPriceLabel.text = "주문금액 : \(viewModel.totalPrice)원"
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        viewModel.remove(item: OptionToppingType.allCases[indexPath.row])
        self.totalPriceLabel.text = "주문금액 : \(viewModel.totalPrice)원"
    }
}
