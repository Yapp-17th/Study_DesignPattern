//
//  CartViewController.swift
//  MVVMPizza
//
//  Created by 고세림 on 2020/11/19.
//

import UIKit

class CartViewController: UIViewController {
    
    var viewModel: CartViewModelType
    
    lazy var titleLabel = UILabel().then {
        $0.text = "장바구니"
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 25)
    }
    lazy var orderTableView = UITableView().then {
        $0.delegate = self
        $0.dataSource = self
        $0.register(CartTableViewCell.self, forCellReuseIdentifier: CartTableViewCell.ID)
    }
    lazy var orderButton = UIButton().then {
        $0.setTitle("전체상품 주문하기", for: .normal)
        $0.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(touchUpOrderButton), for: .touchUpInside)
    }
    
    init(viewModel: CartViewModelType) {
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
    
    @objc private func touchUpOrderButton() {
        
    }
    
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CartItem.shared.getNumberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.ID) as? CartTableViewCell else { return UITableViewCell() }
        let cellViewModel = CartCellViewModel(item: CartItem.shared[indexPath.row])
        cell.configure(viewModel: cellViewModel)
        return cell
    }
    
}
