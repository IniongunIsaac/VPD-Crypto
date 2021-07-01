//
//  ValidationMessage.swift
//  Spottr
//
//  Created by Isaac Iniongun on 16/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation

struct ValidationMessage {
    var isValid: Bool = false
    let message: ValidationMessageConstants
    let validationType: ValidationType
}
