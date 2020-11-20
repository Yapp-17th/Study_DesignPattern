//
//  ViewController.swift
//  Mission06-Denny
//
//  Created by denny on 2020/10/31.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
//            let viewModel = NoticeListViewModel()
//            viewModel.dept = .computer
//            let vc = NoticeListViewController(viewModel: viewModel)
//            SwitchRootVC.updateRootVC(vc: vc)
            SwitchRootVC.updateListVCForRoot()
        })
    }

}

