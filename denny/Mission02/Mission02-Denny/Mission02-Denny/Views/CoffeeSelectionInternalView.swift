//
//  CoffeeSelectionInternalView.swift
//  Mission02-Denny
//
//  Created by Denny on 2020/08/16.
//

import Foundation
import CoffeeCommon
import SnapKit
import UIKit

public protocol CoffeeSelectionInternalDelegate {
    func selectionInternalView(view: CoffeeSelectionInternalView, at index: Int, selected: Bool)
}

public class CoffeeSelectionInternalView: UIView {
    private var checkButton: UIButton = UIButton()
    private var nameLabel: UILabel = UILabel()
    
    private let checkOnImage: UIImage = UIImage(named: "storageIcoCheckOn")!
    private let checkOffImage: UIImage = UIImage(named: "storageIcoCheckOff")!
    
    public var viewHeight: CGFloat = 44
    public var isSelected: Bool = false {
        didSet {
            checkButton.backgroundColor = isSelected ? .green : .orange
            checkButton.setImage(isSelected ? checkOnImage : checkOffImage, for: .normal)
            nameLabel.font = isSelected ? .font15PBold : .font15P
        }
    }
    
    public var index: Int = 0
    public var delegate: CoffeeSelectionInternalDelegate?
    public var itemTitle: String? {
        didSet {
            nameLabel.text = itemTitle
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setViewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViewLayout() {
        addSubview(checkButton)
        addSubview(nameLabel)
        
        checkButton.snp.makeConstraints { make in
            make.top.bottom.left.equalToSuperview()
            make.height.equalTo(viewHeight)
            make.width.equalTo(viewHeight)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(checkButton.snp.right).offset(10)
            make.right.equalToSuperview()
        }
        
        checkButton.addTarget(self, action: #selector(onClickCheckButton(_:)), for: .touchUpInside)
        
        checkButton.backgroundColor = isSelected ? .green : .orange
        checkButton.setImage(isSelected ? checkOnImage : checkOffImage, for: .normal)
        
        nameLabel.font = isSelected ? .font15PBold : .font15P
        nameLabel.textColor = .talkGray900s
        nameLabel.text = itemTitle
    }
    
    @objc
    private func onClickCheckButton(_ sender: UIButton) {
        isSelected = !isSelected
        delegate?.selectionInternalView(view: self, at: index, selected: isSelected)
    }
    
}
