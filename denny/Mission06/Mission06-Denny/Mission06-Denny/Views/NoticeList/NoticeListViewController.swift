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
    
    private var searchBar: UISearchBar = UISearchBar()
    private var listTableView: UITableView = UITableView()
    
    init(viewModel: NoticeListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewLayout()
        bindViewModel()
        viewModel.fetchNoticeList()
    }
    
    private func bindViewModel() {
        viewModel.$dept.sink { [weak self] dept in
            self?.navigationController?.navigationItem.title = dept.getTitle() // TODO
        }.store(in: &cancellables)
        
        viewModel.$noticeList.sink { [weak self] noticeList in
            print(noticeList.count) // TODO
        }.store(in: &cancellables)
    }
    
    private func setupViewLayout() {
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.title = "공지사항"
        
        view.addSubview(searchBar)
        view.addSubview(listTableView)
        
        searchBar.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
        }
        
        listTableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
}
