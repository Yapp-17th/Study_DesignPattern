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
    private let viewModel: NoticeListViewModel
    private var bindings = Set<AnyCancellable>()
    
    init(viewModel: NoticeListViewModel = NoticeListViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
}
