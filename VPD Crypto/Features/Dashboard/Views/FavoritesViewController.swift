//
//  FavoritesViewController.swift
//  VPD Crypto
//
//  Created by Isaac Iniongun on 01/07/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import UIKit

class FavoritesViewController: BaseViewController {
    
    var dashboardViewModel: IDashboardViewModel!
    override func getViewModel() -> BaseViewModel { dashboardViewModel as! BaseViewModel }

    override func configureViews() {
        super.configureViews()
        hideNavBar()
    }

}
