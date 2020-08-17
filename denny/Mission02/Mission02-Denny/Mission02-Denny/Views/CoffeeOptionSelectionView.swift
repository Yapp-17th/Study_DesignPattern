//
//  OptionSelectionView.swift
//  Mission02-Denny
//
//  Created by Denny on 2020/08/16.
//

import CoffeeCommon
import Foundation
import SnapKit
import UIKit

public class CoffeeOptionSelectionView: UIView {
    public var item: CoffeeOptionItem? {
        didSet {
            updateViewInfo()
        }
    }
    
    public var delegate: CoffeeSelectionInternalDelegate?
    private var titleLabel: UILabel = UILabel()
    private var optionStackView: UIStackView = UIStackView()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setViewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViewLayout() {
        addSubview(titleLabel)
        addSubview(optionStackView)
        
        titleLabel.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        
        titleLabel.font = .font15PBold
        
        optionStackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.right.bottom.equalToSuperview()
        }
        
        optionStackView.axis = .vertical
        optionStackView.distribution = .equalSpacing
        optionStackView.spacing = 6
    }
    
    private func updateViewInfo() {
        guard let options = item?.options else { return }
        
        titleLabel.text = item?.title
        for subview in optionStackView.subviews {
            optionStackView.removeArrangedSubview(subview)
        }
        
        for (index, coffee) in options.enumerated() {
            let selectionView = CoffeeSelectionInternalView()
            selectionView.itemTitle = coffee.coffeeName
            selectionView.index = index
            selectionView.delegate = delegate
            optionStackView.addArrangedSubview(selectionView)
        }
    }
}
