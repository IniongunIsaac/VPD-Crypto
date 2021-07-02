//
//  PortfolioBalanceView.swift
//  VPD Crypto
//
//  Created by Isaac Iniongun on 02/07/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import UIKit

class PortfolioBalanceView: BaseView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var coinImageView: UIImageView!
    @IBOutlet weak var coinLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var percentageImageView: UIImageView!
    
    override var kContentView: UIView { contentView }
    override var nibName: String { R.nib.portfolioBalanceView.name }
    
    @IBInspectable var coinIcon: UIImage? {
        get { coinImageView.image }
        set { coinImageView.image = newValue }
    }
    
    @IBInspectable var coinName: String {
        get { coinLabel.text.orEmpty }
        set { coinLabel.text = newValue }
    }
    
    @IBInspectable var percentage: String {
        get { percentageLabel.text.orEmpty }
        set { percentageLabel.text = newValue }
    }
    
    @IBInspectable var percentageIcon: UIImage? {
        get { percentageImageView.image }
        set { percentageImageView.image = newValue }
    }
    
    @IBInspectable var balance: String {
        get { balanceLabel.text.orEmpty }
        set { balanceLabel.text = newValue }
    }
    
    override func configureViews() {
        
    }
    
}
