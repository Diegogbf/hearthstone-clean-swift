//
//  EndPoint.swift
//  base-ios
//
//  Created by Diego Gomes on 19/03/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//

import Foundation

let apiURL = "https://omgvamp-hearthstone-v1.p.rapidapi.com/"

enum EndPoint: String {
    case getInfo = "info"
    case getCards = "cards/"
}
