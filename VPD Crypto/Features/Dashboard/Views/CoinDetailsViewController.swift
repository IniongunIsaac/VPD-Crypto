//
//  CoinDetailsViewController.swift
//  VPD Crypto
//
//  Created by Isaac Iniongun on 02/07/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import UIKit

class CoinDetailsViewController: BaseViewController {

    @IBOutlet weak var backNavImageView: UIImageView!
    @IBOutlet weak var coinImageView: UIImageView!
    @IBOutlet weak var coinNameLabel: UILabel!
    @IBOutlet weak var currentPriceLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var convertToNairaButton: UIButton!
    @IBOutlet weak var addToFavoritesButton: UIButton!
    @IBOutlet weak var percentageIconImageView: UIImageView!
    
    var dashboardViewModel: IDashboardViewModel!
    override func getViewModel() -> BaseViewModel { dashboardViewModel as! BaseViewModel }
    override var horizontalProgressBarYPosition: CGFloat { backNavImageView.minY - 5 }
    override var views: [UIView] { [addToFavoritesButton, convertToNairaButton, backNavImageView] }
    
    var coin: Coin!
    fileprivate var currency: Currency = .dollar
    
    override func configureViews() {
        super.configureViews()
        showCoinDetails()
        backNavImageView.addPopGesture(on: self)
    }
    
    fileprivate func showCoinDetails() {
        coin.do {
            coinNameLabel.text = "\($0.name)/\($0.symbol.uppercased())"
            coinImageView.setImageFromURL(url: $0.image, placeholderImage: R.image.bitcoin_icon(), cornerRadius: 0)
            currentPriceLabel.text = $0.currentPrice.currencyFormatted(symbol: "$")
            percentageLabel.text = "\($0.marketCapChangePercentage24H)%"
            percentageLabel.textColor = $0.marketCapChangePercentage24H > 0 ? .appGreen : .appRed
            percentageIconImageView.image = $0.marketCapChangePercentage24H > 0 ? R.image.angle_up() : R.image.angle_down()
            percentageIconImageView.tintColor = $0.marketCapChangePercentage24H > 0 ? .primaryColor : .appRed
        }
    }

    @IBAction func convertToNairaButtonTapped(_ sender: Any) {
        if currency == .dollar {
            currentPriceLabel.text = (coin.currentPrice * 411.50).currencyFormatted()
            currency = .naira
            convertToNairaButton.title = "Covert to Dollar"
        } else {
            currentPriceLabel.text = coin.currentPrice.currencyFormatted(symbol: "$")
            currency = .dollar
            convertToNairaButton.title = "Covert to Naira"
        }
        
    }
    
    @IBAction func addToFavoritesButtonTapped(_ sender: Any) {
        dashboardViewModel.saveFavoriteCoin(coin)
    }
    
}
