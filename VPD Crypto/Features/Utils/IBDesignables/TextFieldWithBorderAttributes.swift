//
//  TextFieldWithBorderAttributes.swift
//  Spottr
//
//  Created by Isaac Iniongun on 16/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class TextFieldWithBorderAttributes: UITextField {
    @IBInspectable override var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable override var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable override var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        
        if leftPadding != 0 {
            textRect.origin.x += leftPadding
        }
        
        if leftContentPadding != 0 {
            textRect.origin.x += leftContentPadding
        }
        
        return textRect
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        
        if rightPadding != 0 {
            textRect.origin.x += rightPadding
        }
        
        if rightContentPadding != 0 {
            textRect.origin.x += rightContentPadding
        }
        
        return textRect
    }
    
    @IBInspectable var rightImage: UIImage? {
        didSet {
            updateView()
        }
    }

    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }

    @IBInspectable var leftPadding: CGFloat = 0
    
    @IBInspectable var rightPadding: CGFloat = 0
    
    @IBInspectable var leftIconPadding: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var rightIconPadding: CGFloat = 8 {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var leftContentPadding: CGFloat = 0 {
        didSet {
            leftView = UIView(frame: CGRect(x: 0, y: 0, width: oldValue, height: frame.size.height))
            leftViewMode = .always
        }
    }
    
    @IBInspectable var rightContentPadding: CGFloat = 0 {
        didSet {
            rightView = UIView(frame: CGRect(x: 0, y: 0, width: oldValue, height: frame.size.height))
            rightViewMode = .always
        }
    }

    @IBInspectable var color: UIColor = UIColor.lightGray {
        didSet {
            updateView()
        }
    }

    func updateView() {
        if let image = leftImage {
            leftViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            
            let view = UIView()
            view.addSubview(imageView)
            imageView.anchor(top: view.topAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, paddingLeft: leftIconPadding, right: view.rightAnchor, paddingRight: rightIconPadding, width: 20, height: 20)
            
            imageView.tintColor = color
            leftView = view
        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }
        
        if let rightImage = rightImage {
            rightViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = rightImage
            imageView.tintColor = color
            rightView = imageView
        } else {
            rightViewMode = UITextField.ViewMode.never
            rightView = nil
        }

        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])
    }
    
}
