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
    
    init(viewModel: NoticeListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
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
}
