//
//  ViewController.swift
//  Mission05-Denny
//
//  Created by denny on 2020/10/25.
//

import SnapKit
import UIKit

public class CarListViewController: UIViewController {
    private var listTableView: UITableView = UITableView()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMainLayout()
    }
    
    private func setupMainLayout() {
        navigationController?.navigationBar.topItem?.title = "내 차 만들기"
        
        view.addSubview(listTableView)
        listTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        listTableView.delegate = self
        listTableView.dataSource = self
    }
}

extension CarListViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}

