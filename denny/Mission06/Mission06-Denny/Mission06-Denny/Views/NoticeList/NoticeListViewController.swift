//
//  NoticeListViewController.swift
//  Mission06-Denny
//
//  Created by denny on 2020/10/31.
//

import Foundation
import Combine
import SnapKit
import UIKit

public class NoticeListViewController: BaseViewController {
    var viewModel: NoticeListViewModel
    private var cancellables = Set<AnyCancellable>()
    
    private var segmentControl: UISegmentedControl = UISegmentedControl()
    private var listTableView: UITableView = UITableView()
    
    init(viewModel: NoticeListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = NoticeListViewModel()
        super.init(coder: coder)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
        setupViewLayout()
    }
    
    private func bindViewModel() {
        viewModel.$dept.sink { [weak self] dept in
            print(dept.getTitle())
            self?.navigationItem.title = dept.getTitle()
        }.store(in: &cancellables)
        
        viewModel.$noticeList.sink { [weak self] noticeList in
            print(noticeList.count) // TODO
            self?.listTableView.reloadData()
        }.store(in: &cancellables)
    }
    
    private func setupViewLayout() {
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.title = "컴퓨터공학부"
        
        view.backgroundColor = .white
        view.addSubview(segmentControl)
        view.addSubview(listTableView)
        
        segmentControl.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
        }
        
        for (index, dept) in Dept.allCases.enumerated() {
            segmentControl.insertSegment(withTitle: dept.getTitle(), at: index, animated: false)
        }
        
        segmentControl.addTarget(self, action: #selector(didChangeDept), for: .valueChanged)
        segmentControl.selectedSegmentIndex = 0
        
        listTableView.snp.makeConstraints { make in
            make.top.equalTo(segmentControl.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        listTableView.delegate = self
        listTableView.dataSource = self
        
        viewModel.fetchNoticeList()
    }
    
    @objc
    private func didChangeDept() {
        print("Segment Changed")
        viewModel.dept = Dept(rawValue: segmentControl.selectedSegmentIndex) ?? .computer
    }
}

extension NoticeListViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.noticeList.count
    }
    
    // TOOD
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
