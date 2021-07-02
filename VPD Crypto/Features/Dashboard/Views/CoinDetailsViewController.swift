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
    
    override func configureViews() {
        super.configureViews()
        showCoinDetails()
        backNavImageView.addPopGesture(on: self)
    }
    
    fileprivate func showCoinDetails() {
        coin.do {
            coinNameLabel.text = "\($0.name)/\($0.symbol)"
            coinImageView.setImageFromURL(url: $0.image, placeholderImage: R.image.bitcoin_icon(), cornerRadius: 0)
            currentPriceLabel.text = $0.currentPrice.currencyFormatted(symbol: "$")
            percentageLabel.text = "\($0.marketCapChangePercentage24H)%"
            percentageLabel.textColor = $0.marketCapChangePercentage24H > 0 ? .appGreen : .appRed
        }
    }

    @IBAction func convertToNairaButtonTapped(_ sender: Any) {
    }
    
    @IBAction func addToFavoritesButtonTapped(_ sender: Any) {
    }
    
}
