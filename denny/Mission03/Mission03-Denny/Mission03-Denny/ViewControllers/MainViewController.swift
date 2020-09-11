//
//  ViewController.swift
//  Mission03-Denny
//
//  Copyright © 2020 Denny. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    private var requestSectionView: UIView = UIView()
    private var fieldStackView: UIStackView = UIStackView()
    private var fileNameField: UITextField = UITextField()
    private var pagesField: UITextField = UITextField()
    private var errorView: UILabel = UILabel()
    
    private var buttonStackView: UIStackView = UIStackView()
    private var printButton: UIButton = UIButton()
    private var manageButton: UIButton = UIButton()
    
    private var separator: UIView = UIView()
    
    private var tableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewLayout()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(LogCell.self, forCellReuseIdentifier: LogCell.identifier)
        NotificationCenter.default.addObserver(self, selector: #selector(updateLogView), name: NotificationConstant.addLog.notification(), object: nil)
    }
    
    @objc
    private func updateLogView() {
        tableView.reloadData()
    }

    private func initViewLayout() {
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.barTintColor = .printerWhite000s
        self.navigationItem.title = "프린터 인쇄 관리"
        
        view.addSubview(requestSectionView)
        requestSectionView.addSubview(fieldStackView)
        fieldStackView.addArrangedSubview(fileNameField)
        fieldStackView.addArrangedSubview(pagesField)
        fieldStackView.addArrangedSubview(errorView)
        
        requestSectionView.addSubview(buttonStackView)
        requestSectionView.addSubview(separator)
        
        buttonStackView.addArrangedSubview(printButton)
        buttonStackView.addArrangedSubview(manageButton)
        
        view.addSubview(tableView)
        
        requestSectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
        }
        
        fieldStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        fieldStackView.axis = .vertical
        fieldStackView.spacing = 4
        
        fileNameField.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(44)
        }
        
        pagesField.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(44)
        }
        
        pagesField.keyboardType = .numberPad
        
        fileNameField.placeholder = "파일 이름 입력"
        fileNameField.font = .font14P
        
        pagesField.placeholder = "페이지 수 입력"
        pagesField.font = .font14P
        
        errorView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        errorView.font = .font12P
        errorView.textColor = .printerRed500s
        errorView.isHidden = true
        
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(fieldStackView.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(44)
        }
        
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 8
        buttonStackView.distribution = .fillEqually
        
        printButton.backgroundColor = .printerBlue500s
        printButton.setTitle("프린트", for: .normal)
        printButton.titleLabel?.font = .font14P
        printButton.setTitleColor(.printerWhite000s, for: .normal)
        printButton.layer.cornerRadius = 4
        printButton.addTarget(self, action: #selector(printAction(_:)), for: .touchUpInside)
        
        manageButton.layer.borderWidth = 0.5
        manageButton.layer.borderColor = UIColor.printerGray200a.cgColor
        manageButton.setTitle("프린터 관리", for: .normal)
        manageButton.titleLabel?.font = .font14P
        manageButton.setTitleColor(.printerGray900s, for: .normal)
        manageButton.layer.cornerRadius = 4
        manageButton.addTarget(self, action: #selector(manageAction(_:)), for: .touchUpInside)
        
        separator.snp.makeConstraints { make in
            make.top.equalTo(buttonStackView.snp.bottom).offset(12)
            make.left.right.equalToSuperview()
            make.height.equalTo(0.5)
            make.bottom.equalToSuperview()
        }
        
        separator.backgroundColor = .printerGray300s
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(requestSectionView.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }

    @objc
    private func printAction(_ sender: UIButton) {
        if let fileName = fileNameField.text, let page = pagesField.text {
            errorView.isHidden = true
            print("문서를 프린터에게 요청합니다...")
            PrinterProxyManager.shared.insertNewTask(task: PrintTask(documentName: fileName, pages: Int(page) ?? 0))
        } else {
            errorView.isHidden = false
            errorView.text = "파일명과 페이지 수를 올바르게 입력해주세요."
        }
    }
    
    @objc
    private func manageAction(_ sender: UIButton) {
        let vc = ManageViewController()
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DebugWorker.shared.getLogCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: LogCell.identifier) as? LogCell {
            print(DebugWorker.shared.getLog()[indexPath.row])
            cell.contentLabel.text = DebugWorker.shared.getLog()[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
}

public class LogCell: UITableViewCell {
    public static let identifier: String = "LogCell"
    public var contentLabel: UILabel = UILabel()
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(contentLabel)
        contentLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
