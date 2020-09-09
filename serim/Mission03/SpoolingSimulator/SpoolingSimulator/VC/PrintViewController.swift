//
//  PrintViewController.swift
//  SpoolingSimulator
//
//  Created by 바보세림이 on 2020/09/02.
//  Copyright © 2020 serim. All rights reserved.
//

import UIKit

class PrintViewController: UIViewController {
    
    var savedDocument: [Document] {
        SavedDocument.shared.savedDocument
    }
    
    let documentTableView = UITableView()
    let cellIdentifier = "documentCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        documentTableView.delegate = self
        documentTableView.dataSource = self
        documentTableView.register(DocumentCell.self, forCellReuseIdentifier: cellIdentifier)
        configureViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        documentTableView.reloadData()
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
                print("printing... \(document.title) \(document.id)")
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
        self.view.addSubview(documentTableView)
        documentTableView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(20)
            $0.leading.trailing.equalTo(0)
            $0.height.equalTo(300)
        }
    }
}
