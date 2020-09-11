//
//  PrintViewController.swift
//  SpoolingSimulator
//
//  Created by 바보세림이 on 2020/09/02.
//  Copyright © 2020 serim. All rights reserved.
//

import UIKit

protocol progressDelegate {
    func updateProgessLabel(_ progress: String)
}

class PrintViewController: UIViewController, progressDelegate {
    
    var savedDocument: [Document] {
        SavedDocument.shared.savedDocument
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "문서 목록"
        label.textColor = #colorLiteral(red: 0.1294187009, green: 0.1176761761, blue: 0.1053736731, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 26)
        label.textAlignment = .center
        return label
    }()
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 243/256, green: 242/256, blue: 255/256, alpha: 1)
        return view
    }()
    let progressTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "출력 진행 상황"
        label.textColor = #colorLiteral(red: 0.1294187009, green: 0.1176761761, blue: 0.1053736731, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    let progressLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.1294187009, green: 0.1176761761, blue: 0.1053736731, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    let printerImageView: UIImageView = {
        let image = UIImage(named: "print")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    let documentTableView = UITableView()
    let cellIdentifier = "documentCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        documentTableView.delegate = self
        documentTableView.dataSource = self
        documentTableView.register(DocumentCell.self, forCellReuseIdentifier: cellIdentifier)
        configureViews()
        PrinterProxy.shared.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        documentTableView.reloadData()
    }
    
    func updateProgessLabel(_ progress: String) {
        DispatchQueue.main.async {
            self.progressLabel.text = progress
        }
    }
    
}

// MARK: TableView

extension PrintViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedDocument.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: DocumentCell = documentTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? DocumentCell else {
            return UITableViewCell()
        }
        cell.document = savedDocument[indexPath.row]
        cell.titleLabel.text = savedDocument[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let printAction = UIContextualAction(style: .normal, title: "Print") { (action, view, success) in
            let document = SavedDocument.shared.savedDocument[indexPath.row]
            SavedDocument.shared.savedDocument.remove(at: indexPath.row)
            tableView.reloadData()
            DispatchQueue.global().async {
                PrinterProxy.shared.printDocument(document: document)
            }
        }
        return UISwipeActionsConfiguration(actions: [printAction])
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete) {
            SavedDocument.shared.savedDocument.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

// MARK: AutoLayout

extension PrintViewController {
    private func configureViews() {
        self.view.backgroundColor = .white
        self.view.addSubview(titleLabel)
        self.view.addSubview(documentTableView)
        self.view.addSubview(backgroundView)
        backgroundView.addSubview(printerImageView)
        backgroundView.addSubview(progressTitleLabel)
        backgroundView.addSubview(progressLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(60)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(140)
            $0.height.equalTo(40)
        }
        documentTableView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.trailing.equalTo(0)
            $0.height.equalTo(300)
        }
        backgroundView.snp.makeConstraints {
            $0.top.equalTo(documentTableView.snp.bottom).offset(10)
            $0.bottom.equalTo(-50)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
        }
        printerImageView.snp.makeConstraints {
            $0.centerY.equalTo(progressTitleLabel)
            $0.width.height.equalTo(40)
            $0.leading.equalTo(30)
        }
        progressTitleLabel.snp.makeConstraints {
            $0.top.equalTo(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(180)
            $0.height.equalTo(40)
        }
        progressLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalTo(320)
            $0.height.equalTo(40)
        }
    }
}
