//
//  ViewController.swift
//  Mission02-Denny
//
//  Created by Denny on 2020/08/14.
//

import CoffeeCommon
import Combine
import SnapKit
import UIKit

public class MainViewController: UIViewController {

    var viewModel: MainViewModel = MainViewModel()
    private var cancellables: Set<AnyCancellable> = []
    
    private var debugLabel: UILabel = UILabel()
    private var requestButton: UIButton = UIButton()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        initViewLayout()
        bindViewModel()
    }
    
    private func initViewLayout() {
        view.addSubview(debugLabel)
        view.addSubview(requestButton)
        
        debugLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.top.equalToSuperview().offset(64)
        }
        
        debugLabel.numberOfLines = 0
        debugLabel.textColor = .black
        debugLabel.textAlignment = .center
        
        requestButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.top.equalTo(debugLabel.snp.bottom).offset(12)
        }
        
        requestButton.setTitle("랜덤값 요청", for: .normal)
        requestButton.setTitleColor(.systemBlue, for: .normal)
        requestButton.backgroundColor = .white
        requestButton.addTarget(self, action: #selector(requestValue(sender:)), for: .touchUpInside)
    }
    
    @objc
    private func requestValue(sender: UIButton) {
        viewModel.fetch()
    }

    private func bindViewModel() {
        viewModel.$title.sink { [weak self] title in
            self?.debugLabel.text = "bind title : \(title)"
        }.store(in: &cancellables)
    }
}

