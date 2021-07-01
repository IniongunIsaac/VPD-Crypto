//
//  PreferenceImpl.swift
//  Spottr
//
//  Created by Isaac Iniongun on 05/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation

struct PreferenceImpl: IPreference {
    
    fileprivate let userDefs = UserDefaults.standard
    fileprivate let encoder = JSONEncoder()
    fileprivate let decoder = JSONDecoder()
    
    
    
}
