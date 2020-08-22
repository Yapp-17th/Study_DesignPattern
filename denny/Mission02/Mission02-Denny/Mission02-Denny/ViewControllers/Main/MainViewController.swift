//
//  ViewController.swift
//  Mission02-Denny
//
//  Created by Denny on 2020/08/14.
//

import CoffeeCommon
import Combine
import NotificationCenter
import SnapKit
import UIKit

public class MainViewController: UIViewController {

    var viewModel: MainViewModel = MainViewModel()
    private var cancellables: Set<AnyCancellable> = []
    
    private var debugLabel: UILabel = UILabel()
    private var requestButton: UIButton = UIButton()
    
    private var orderButton: UIButton = UIButton()
    private var debugLogTableView: UITableView = UITableView()
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        debugLogTableView.delegate = self
        debugLogTableView.dataSource = self
        debugLogTableView.register(UINib(nibName: "DebugLogTableViewCell", bundle: nil), forCellReuseIdentifier: DebugLogTableViewCell.identifier)
        
        initViewLayout()
        bindViewModel()
    }
    
    private func initViewLayout() {
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.barTintColor = .talkWhite000s
        self.navigationItem.title = "커피 전문점"
        
        // MARK: Main Section
        view.addSubview(orderButton)
        view.addSubview(debugLogTableView)
        
        orderButton.setTitle("주문하기", for: .normal)
        orderButton.titleLabel?.font = .font14P
        orderButton.addTarget(self, action: #selector(onClickReqOrderButton(_:)), for: .touchUpInside)
        
        orderButton.setTitleColor(.talkGray900s, for: .normal)
        orderButton.backgroundColor = .talkYellow550s
        orderButton.layer.cornerRadius = 4
        orderButton.layer.masksToBounds = true
        
        debugLogTableView.tableFooterView = UIView()
        
        orderButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
            make.height.equalTo(44)
        }
        
        debugLogTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(12)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(16)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-16)
            make.bottom.equalTo(orderButton.snp.top).offset(-12)
        }
    }
    
    @objc
    private func onClickReqOrderButton(_ sender: UIButton) {
        let viewController = OrderViewController()
        viewController.completion = viewModel.processOrder
        viewController.customerId = viewModel.getRandomNumber()
        viewController.modalPresentationStyle = .overCurrentContext
        self.present(viewController, animated: true, completion: nil)
    }
    
    @objc
    private func requestValue(sender: UIButton) {
        viewModel.fetch()
    }

    private func updateLogTableView(logList: [String]) {
        DebugLog("[MainVC] Update Log")
        debugLogTableView.reloadData()
    }
    
    private func bindViewModel() {
        viewModel.$title.sink { [weak self] title in
            self?.debugLabel.text = "bind title : \(title)"
        }.store(in: &cancellables)
        
        viewModel.$logList.sink { [weak self] logList in
            self?.updateLogTableView(logList: logList)
        }.store(in: &cancellables)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.logList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: DebugLogTableViewCell.identifier, for: indexPath) as? DebugLogTableViewCell {
            cell.content = viewModel.logList[indexPath.row]
            cell.separatorInset = .zero
            return cell
        }
        return UITableViewCell()
    }
    
}
