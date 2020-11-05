//
//  ViewController.swift
//  Subway
//
//  Created by 바보세림이 on 2020/10/22.
//

import UIKit
import SnapKit
import Then


class MenuViewController: UIViewController {
    lazy var titleImageView = UIImageView().then {
        $0.image = UIImage(named: "titleImage")
        $0.contentMode = .scaleAspectFit
    }
    lazy var descriptionLabel = UILabel().then {
        $0.text = "원하시는 메뉴를 선택해주세요."
        $0.textAlignment = .right
    }
    lazy var menuTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.register(MenuCell.self, forCellReuseIdentifier: "menuCell")
        configureViews()
    }

}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MainItem.allCases.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = menuTableView.dequeueReusableCell(withIdentifier: "menuCell") as? MenuCell else { return UITableViewCell() }
        return cell
    }
    
}
