//
//  AppCheckbox.swift
//  Food GIG
//
//  Created by Isaac Iniongun on 11/11/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import UIKit
import BEMCheckBox

class AppCheckbox: UIView {
    
    @IBOutlet weak var checkbox: BEMCheckBox!
    @IBOutlet weak var valueTextLabel: UILabel!
    @IBOutlet var contentView: UIView!
    
    @IBInspectable var valueText: String? {
        get { valueTextLabel.text }
        set { valueTextLabel.text = newValue }
    }
    
    weak var appCheckboxDelegate: AppCheckboxDelegate?
    
    fileprivate var checkboxSelected = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.isUserInteractionEnabled = true
        setupTapGestures()
        configureCheckbox()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        commonInit()
        contentView.prepareForInterfaceBuilder()
    }
    
    fileprivate func commonInit() {
        loadFromNib()
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    fileprivate func loadFromNib() {
        Bundle.main.loadNibNamed(R.nib.appCheckbox.name, owner: self, options: nil)
        addSubview(contentView)
    }
    
    fileprivate func setupTapGestures() {
        valueTextLabel.animateViewOnTapGesture { [weak self] in
            guard let self = self else { return }
            self.checkboxSelected = !self.checkboxSelected
            self.appCheckboxDelegate?.setValue(self.checkboxSelected, self)
            self.checkbox.setOn(self.checkboxSelected, animated: true)
        }
    }
    
    fileprivate func configureCheckbox() {
        checkbox.apply {
            $0.boxType = .square
            $0.delegate = self
        }
    }
    
}

//MARK: - BEMCheckBoxDelegate
extension AppCheckbox: BEMCheckBoxDelegate {
    func didTap(_ checkBox: BEMCheckBox) {
        appCheckboxDelegate?.setValue(checkBox.on, self)
    }
}
