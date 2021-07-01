//
//  EmptyView.swift
//  Food GIG
//
//  Created by Isaac Iniongun on 16/11/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import UIKit

class EmptyView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var emptyIconImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var reloadIconImageView: UIImageView!
    
    @IBInspectable var messageText: String? {
        get { messageLabel.text }
        set { messageLabel.text = newValue }
    }
    
    var reloadTapppedHandler: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.isUserInteractionEnabled = true
        setupTapGestures()
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
        Bundle.main.loadNibNamed(R.nib.emptyView.name, owner: self, options: nil)
        addSubview(contentView)
    }
    
    fileprivate func setupTapGestures() {
        reloadIconImageView.animateViewOnTapGesture { [weak self] in
            self?.reloadTapppedHandler?()
        }
    }
}
