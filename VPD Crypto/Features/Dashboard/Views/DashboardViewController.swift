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
        
        [bitcoinPortfolioView, etheriumPortfolioView].addClearBackground()
        
        favoritesImageView.animateViewOnTapGesture { [weak self] in
            
        }
    }
    
    override func setChildViewControllerObservers() {
        super.setChildViewControllerObservers()
        observeUserData()
    }
    
    fileprivate func observeUserData() {
        dashboardViewModel.user.bind { [weak self] user in
            self?.showUserDetails(user)
        }.disposed(by: disposeBag)
    }
    
    fileprivate func showUserDetails(_ user: VPDUser) {
        user.do {
            usernameLabel.text = $0.fullname
            updatePortfolioView(balance: $0.btcBalance, percentage: $0.btcPercentage)
            updatePortfolioView(isBTC: false, balance: $0.ethBalance, percentage: $0.ethPercentage)
        }
    }
    
    fileprivate func updatePortfolioView(isBTC: Bool = true, balance: Double, percentage: Int) {
        (isBTC ? bitcoinPortfolioView : etheriumPortfolioView)?.do {
            $0.balance = balance.currencyFormatted(symbol: "$")
            $0.percentage = "+\(percentage)%"
        }
    }

}
