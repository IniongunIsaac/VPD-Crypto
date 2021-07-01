//
//  RoundedFloatingLabelTextfield.swift
//  GIGM Mobile
//
//  Created by Isaac Iniongun on 20/06/2021.
//  Copyright © 2021 GIG Mobility Limited. All rights reserved.
//

import UIKit

class AppTextfield: BaseView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var floatingLabel: UIPaddableLabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var rightIconImageView: UIImageView!
    @IBOutlet weak var rightIconImageviewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightIconImageviewWidthConstraint: NSLayoutConstraint!
    
    override var kContentView: UIView { contentView }
    override var nibName: String { R.nib.appTextfield.name }
    
    @IBInspectable var placeholderText: String? {
        get { textField.placeholder }
        set { textField.placeholder = newValue }
    }
    
    @IBInspectable var floatingLabelText: String? {
        get { floatingLabel.text }
        set { floatingLabel.text = newValue }
    }
    
    @IBInspectable var rightIcon: UIImage? {
        get { rightIconImageView.image }
        set { rightIconImageView.image = newValue }
    }
    
    @IBInspectable var rightIconTintColor: UIColor {
        get { rightIconImageView.tintColor }
        set { rightIconImageView.tintColor = newValue }
    }
    
    @IBInspectable var rightIconSize: CGFloat {
        get { rightIconImageviewHeightConstraint.constant }
        set {
            rightIconImageviewHeightConstraint.constant = newValue
            rightIconImageviewWidthConstraint.constant = newValue
        }
    }
    
    @IBInspectable var showsLabels: Bool {
        get { floatingLabel.isHidden }
        set {
            newValue ? floatingLabel.showView() : floatingLabel.hideView()
            newValue ? errorLabel.showView() : errorLabel.hideView()
        }
    }
    
    @IBInspectable var showsErrorLabel: Bool {
        get { errorLabel.isHidden }
        set { errorLabel.showView(newValue) }
    }
    
    @IBInspectable var showsRightIcon: Bool {
        get { rightIconImageView.isHidden }
        set { rightIconImageView.showView(newValue) }
    }
    
    @IBInspectable var isEditable: Bool {
        get { textField.isHidden }
        set { newValue ? textField.enableUserInteraction() : textField.disableUserInteraction() }
    }
    
    var text: String {
        get { textField.text.orEmpty }
        set { textField.text = newValue }
    }
    
    @IBInspectable var errorText: String? {
        get { errorLabel.text }
        set {
            errorLabel.text = newValue
            newValue == nil || newValue?.isEmpty ?? true ? errorLabel.fadeOut() : errorLabel.fadeIn()
        }
    }
    
    var keyboardType: UIKeyboardType {
        get { textField.keyboardType }
        set { textField.keyboardType = newValue }
    }
    
    @IBInspectable var isSecureTextEntry: Bool = false {
        didSet {
            passwordVisible = isSecureTextEntry
            rightIconImageView.do {
                isSecureTextEntry ? $0.showView() : $0.showView(false)
            }
        }
    }
    
    fileprivate var passwordVisible: Bool = false {
        didSet {
            textField.isSecureTextEntry = passwordVisible
            rightIconImageView.apply {
                $0.image = passwordVisible ? R.image.eye_on_icon() : R.image.eye_off_icon()
            }
        }
    }
    
    var validationType: ValidationType?
    var rightIconTapHandler: NoParamHandler?
    fileprivate var floatingLabelOrigin: CGPoint!
    
    override func configureViews() {
        [errorLabel, floatingLabel].hideViews()
        floatingLabelOrigin = floatingLabel.frame.origin
        
        textField.do {
            $0.delegate = self
            $0.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        }
        
        rightIconImageView.animateViewOnTapGesture(duration: 0.2) { [weak self] in
            guard let self = self else { return }
            if self.isSecureTextEntry {
                self.passwordVisible = !self.passwordVisible
            } else {
                self.rightIconTapHandler?()
            }
        }
    }
    
    fileprivate func updateFloatingLabelOrigin(_ origin: CGPoint) {
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            self?.floatingLabel.frame.origin = origin
        })
    }
    
    fileprivate func updateFloatingLabelPosition() {
        floatingLabel.do {
            if text.isNotEmpty {
                $0.showView()
                updateFloatingLabelOrigin(CGPoint(x: 15, y: -11))
            } else {
                $0.showView(false)
                updateFloatingLabelOrigin(floatingLabelOrigin)
            }
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        updateFloatingLabelPosition()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        //detailsView.borderColor = R.color.borderColor(compatibleWith: traitCollection)
    }
    
}

// MARK: - UITextfieldDelegate Methods
extension AppTextfield: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        switch keyboardType {
        case .phonePad:
            return textField.restrictToDigitsWithMaximumLength(range: range, string: string, maxLength: AppConstants.MAX_PHONE_NUMBER_LENGTH)
            
        case .numberPad:
            return textField.restrictInputToDigits(string: string)
            
        default:
            return true
        }
        
    }
}

extension AppTextfield {
    func showMessage(_ msg: ValidationMessage) {
        if msg.isValid {
            errorText = nil
        } else {
            errorText = msg.message.rawValue
        }
    }
}
