//
//  FavoritesViewController.swift
//  VPD Crypto
//
//  Created by Isaac Iniongun on 01/07/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import UIKit

class FavoritesViewController: BaseViewController {
    
    @IBOutlet weak var backNavImageView: UIImageView!
    @IBOutlet weak var favoriteCoinsTableView: UITableView!
    var dashboardViewModel: IDashboardViewModel!
    override func getViewModel() -> BaseViewModel { dashboardViewModel as! BaseViewModel }

    override func configureViews() {
        super.configureViews()
        hideNavBar()
        setupFavoriteCoinsTableView()
        dashboardViewModel.getFavoriteCoins()
        backNavImageView.addPopGesture(on: self)
    }
    
    fileprivate func setupFavoriteCoinsTableView() {
        dashboardViewModel.favoriteCoins.map({ $0.isEmpty }).distinctUntilChanged().bind(to: favoriteCoinsTableView.rx.isEmpty(message: "You don't have any favorite coins yet!")).disposed(by: disposeBag)
        dashboardViewModel.favoriteCoins.bind(to: favoriteCoinsTableView.rx.items(cellIdentifier: R.reuseIdentifier.favoriteCoinsTableViewCell.identifier, cellType: CoinTableViewCell.self)) { index, coin, cell in
            
            cell.coinView.configureView(coin: coin)
            cell.animateViewOnTapGesture {}
            
        }.disposed(by: disposeBag)
    }

}
