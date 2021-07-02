//
//  CoinTableViewCell.swift
//  VPD Crypto
//
//  Created by Isaac Iniongun on 02/07/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import UIKit

class CoinTableViewCell: UITableViewCell {

    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var coinImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var currentPriceLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    
    func configureView(coin: Coin) {
        coin.do {
            nameLabel.text = $0.name
            symbolLabel.text = $0.symbol
            coinImageView.setImageFromURL(url: $0.image, placeholderImage: R.image.bitcoin_icon(), cornerRadius: 0)
            currentPriceLabel.text = $0.currentPrice.currencyFormatted(symbol: "$")
            percentageLabel.text = "\($0.marketCapChangePercentage24H)%"
            percentageLabel.textColor = $0.marketCapChangePercentage24H > 0 ? .green : .red
        }
    }

}
