//
//  DashboardViewController.swift
//  VPD Crypto
//
//  Created by Isaac Iniongun on 01/07/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import UIKit

class DashboardViewController: BaseViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var favoritesImageView: UIImageView!
    @IBOutlet weak var bitcoinPortfolioView: PortfolioBalanceView!
    @IBOutlet weak var etheriumPortfolioView: PortfolioBalanceView!
    @IBOutlet weak var allCoinsTableView: UITableView!
    
    var dashboardViewModel: IDashboardViewModel!
    override func getViewModel() -> BaseViewModel { dashboardViewModel as! BaseViewModel }

    override func configureViews() {
        super.configureViews()
        hideNavBar()
    }

}
