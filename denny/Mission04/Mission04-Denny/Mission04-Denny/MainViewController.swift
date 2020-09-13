//
//  ViewController.swift
//  Mission04-Denny
//
//  Created by denny on 2020/09/12.
//

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
    private var resetButton: UIButton = UIButton()
    private var debugLogTableView: UITableView = UITableView()
    
    private var placeholderView: UIView = UIView()
    private var placeholderImageView: UIImageView = UIImageView()
    private var placeholderStackView: UIStackView = UIStackView()
    private var placeholderTitleLabel: UILabel = UILabel()
    private var placeholderDescLabel: UILabel = UILabel()
    
    
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
        self.navigationItem.title = "피자 전문점"
        
        // MARK: Main Section
        view.addSubview(resetButton)
        view.addSubview(orderButton)
        view.addSubview(debugLogTableView)
        
        // MARK: Reset Button
        resetButton.setTitle("로그삭제", for: .normal)
        resetButton.titleLabel?.font = .font14P
        resetButton.addTarget(self, action: #selector(onClickClearLogButton(_:)), for: .touchUpInside)
        
        resetButton.setTitleColor(.talkGray900s, for: .normal)
        resetButton.backgroundColor = .talkWhite000s
        resetButton.layer.cornerRadius = 6
        resetButton.layer.masksToBounds = true
        resetButton.layer.borderWidth = 0.5
        resetButton.layer.borderColor = UIColor.talkGray200a.cgColor
        
        // MARK: Order Button
        orderButton.setTitle("주문하기", for: .normal)
        orderButton.titleLabel?.font = .font14P
        orderButton.addTarget(self, action: #selector(onClickReqOrderButton(_:)), for: .touchUpInside)
        
        orderButton.setTitleColor(.talkGray900s, for: .normal)
        orderButton.backgroundColor = .talkYellow550s
        orderButton.layer.cornerRadius = 6
        orderButton.layer.masksToBounds = true
        
        debugLogTableView.tableFooterView = UIView()
        
        resetButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
            make.height.equalTo(44)
        }
        
        orderButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalTo(resetButton.snp.top).offset(-8)
            make.height.equalTo(44)
        }
        
        debugLogTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(12)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(16)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-16)
            make.bottom.equalTo(orderButton.snp.top).offset(-12)
        }
        
        // MARK: Placeholder View
        placeholderView.isHidden = true
        view.addSubview(placeholderView)
        placeholderView.addSubview(placeholderStackView)
        placeholderStackView.addArrangedSubview(placeholderImageView)
        placeholderStackView.addArrangedSubview(placeholderTitleLabel)
        placeholderStackView.addArrangedSubview(placeholderDescLabel)
        
        placeholderStackView.axis = .vertical
        placeholderStackView.spacing = 12
        placeholderStackView.setCustomSpacing(6, after: placeholderTitleLabel)
        
        placeholderImageView.snp.makeConstraints { make in
            make.height.equalTo(96)
            make.centerX.equalToSuperview()
        }
        
        placeholderStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        placeholderView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        placeholderImageView.image = UIImage(named: "img_empty_block", in: .coffeeCommon, with: .none)
        placeholderImageView.contentMode = .scaleAspectFit
        
        placeholderTitleLabel.text = "주문을 해보세요!"
        placeholderTitleLabel.font = .font17PBold
        placeholderTitleLabel.textColor = .talkGray900s
        placeholderTitleLabel.textAlignment = .center
        
        placeholderDescLabel.text = "주문을 하면 로그가 보입니다."
        placeholderDescLabel.font = .font14P
        placeholderDescLabel.textColor = .talkGray500s
        placeholderDescLabel.textAlignment = .center
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
    private func onClickClearLogButton(_ sender: UIButton) {
        DebugWorker.shared.clearLogList()
        viewModel.logList.removeAll()
    }
    
    @objc
    private func requestValue(sender: UIButton) {
        viewModel.fetch()
    }

    private func updateLogTableView(logList: [String]) {
        DebugLog("[MainVC] Update Log")
        
        debugLogTableView.isHidden = (logList.count < 1)
        placeholderView.isHidden = !(logList.count < 1)
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
        return (viewModel.logList.count > 0 ? viewModel.logList.count + 1 : 0)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: DebugLogTableViewCell.identifier, for: indexPath) as? DebugLogTableViewCell {
            if viewModel.logList.count > 1 {
                cell.content = viewModel.logList[indexPath.row]
            }
            cell.separatorInset = .zero
            cell.clearsContextBeforeDrawing = true
            return cell
        }
        return UITableViewCell()
    }
    
}
