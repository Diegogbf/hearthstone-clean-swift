////
////  Router.swift
////  base-ios
////
////  Created by Diego Gomes on 20/01/20.
////  Copyright © 2020 Diego Gomes. All rights reserved.
////
//
import Foundation

enum Router {
    case getFilters
    case getCards(request: Cards.FetchCards.Request)
}

extension Router: EndPointType {
    var baseURL: URL {
        return URL(string: apiURL)!
    }
    
    var path: String {
        switch self {
        case .getFilters:
            return EndPoint.getInfo.rawValue
        case .getCards:
            return EndPoint.getCards.rawValue
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getFilters, .getCards:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .getFilters:
            return .request
        case .getCards(let request):
            return .requestParameters(bodyParameters: nil, urlParameters: [request.category: request.subCategory])
        }
    }
    
    var headers: HTTPHeaders? {
        return ["x-rapidapi-key": "16f41ce38fmshf2687748a16c1efp1b35cejsnb9877df6123a", "x-rapidapi-host": "omgvamp-hearthstone-v1.p.rapidapi.com"]
    }
}

