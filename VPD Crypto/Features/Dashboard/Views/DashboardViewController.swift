//
//  DashboardViewController.swift
//  VPD Crypto
//
//  Created by Isaac Iniongun on 01/07/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import UIKit

class DashboardViewController: BaseViewController {
    
    @IBOutlet weak var usernameStackView: UIStackView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var favoritesImageView: UIImageView!
    @IBOutlet weak var bitcoinPortfolioView: PortfolioBalanceView!
    @IBOutlet weak var etheriumPortfolioView: PortfolioBalanceView!
    @IBOutlet weak var allCoinsTableView: UITableView!
    @IBOutlet weak var allCoinsLabel: UILabel!
    
    var dashboardViewModel: IDashboardViewModel!
    override func getViewModel() -> BaseViewModel { dashboardViewModel as! BaseViewModel }
    override var horizontalProgressBarYPosition: CGFloat { usernameStackView.minY - 5 }
    override var views: [UIView] { [allCoinsTableView, favoritesImageView] }
    
    fileprivate lazy var emptyView: EmptyView = {
        EmptyView().apply {
            $0.messageText = "Coins data not available at the moment!"
            $0.retryTapHandler = { [weak self] in
                self?.dashboardViewModel.getCoins(isInitial: true)
            }
        }
    }()
    
    fileprivate lazy var uiRefreshControl: UIRefreshControl = {
        UIRefreshControl().apply {
            $0.addTarget(self, action: #selector(refreshCoins), for: .valueChanged)
        }
    }()
    
    fileprivate var coins: [Coin] { dashboardViewModel.coins }

    override func configureViews() {
        super.configureViews()
        hideNavBar()
        
        [bitcoinPortfolioView, etheriumPortfolioView].addClearBackground()
        
        favoritesImageView.animateViewOnTapGesture { [weak self] in
            
        }
        
        allCoinsTableView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.refreshControl = uiRefreshControl
        }
        
        showCoins()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dashboardViewModel.getCoins(isInitial: true)
    }
    
    @objc fileprivate func refreshCoins() {
        dashboardViewModel.getCoins(isInitial: true)
    }
    
    override func hideLoading() {
        super.hideLoading()
        uiRefreshControl.endRefreshing()
    }
    
    override func setChildViewControllerObservers() {
        super.setChildViewControllerObservers()
        observeUserData()
        observeShowCoins()
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
    
    fileprivate func observeShowCoins() {
        dashboardViewModel.showCoins.bind { [weak self] show in
            if show {
                self?.showCoins()
            }
        }.disposed(by: disposeBag)
    }
    
    fileprivate func showCoins() {
        if coins.isEmpty {
            allCoinsTableView.showView(false)
            view.addSubview(emptyView)
            emptyView.anchor(top: allCoinsLabel.bottomAnchor, paddingTop: 20, bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 20, left: view.safeAreaLayoutGuide.leftAnchor, paddingLeft: 20, right: view.safeAreaLayoutGuide.rightAnchor, paddingRight: 20)
            emptyView.do {
                if dashboardViewModel.hasFetchedCoins {
                    $0.messageText = "Coins data not available at the moment!"
                    $0.showRetryIcon = true
                    $0.showEmptyIcon = true
                } else {
                    $0.messageText = "Loading coins, please wait..."
                    $0.showRetryIcon = false
                    $0.showEmptyIcon = false
                }
            }
        } else {
            emptyView.removeFromSuperview()
            allCoinsTableView.do {
                $0.showView()
                $0.reloadData()
            }
        }
    }

}

//MARK: - UITableViewDataSource, UITableViewDelegate
extension DashboardViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.coinTableViewCell.identifier, for: indexPath) as! CoinTableViewCell
        
        let coin = coins[indexPath.row]
        cell.configureView(coin: coin)
        cell.animateViewOnTapGesture { [weak self] in
            self?.showCoinDetailsViewController(coin)
        }
        
        return cell
    }
    
    fileprivate func showCoinDetailsViewController(_ coin: Coin) {
        pushViewController(R.storyboard.dashboard.coinDetailsViewController()!.apply {
            $0.coin = coin
        })
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        dashboardViewModel.do {
            if indexPath.row == coins.count - 1 {
                if $0.canFetchMoreCoins {
                    $0.getCoins(isInitial: false)
                }
            }
        }
    }
    
}
