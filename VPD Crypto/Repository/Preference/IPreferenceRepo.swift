//
//  IPreferenceRepo.swift
//  Food GIG
//
//  Created by Isaac Iniongun on 10/11/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation

protocol IPreferenceRepo {
    
    var hasSeenOnboarding: Bool { get set }
    
    var user: User? { get set }
    
    var token: Token? { get set }
    
    var isLoggedIn: Bool { get }
    
}
