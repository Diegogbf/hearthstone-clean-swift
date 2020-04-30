//
//  CardsInteractor.swift
//  HearthStone
//
//  Created by Diego Gomes on 29/04/20.
//  Copyright (c) 2020 Diego Gomes. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CardsBusinessLogic {
    func fetchCards(request: Cards.FetchCards.Request)
}

class CardsInteractor: CardsBusinessLogic {
    var presenter: (CardsPresentationLogic & WorkerPresentationFeedback)?
    var worker = CardsWorker()
    
    // MARK: Fetch Cards
    func fetchCards(request: Cards.FetchCards.Request) {
        presenter?.load(showLoader: true)
        worker.fetchCards(request: request, success: { [weak self] response in
            guard let self = self else { return }
            self.presenter?.load(showLoader: false)
            self.presenter?.displayCards(response: response)
        }, error: { [weak self] msg in
            guard let self = self else { return }
            self.presenter?.load(showLoader: false)
            self.presenter?.showError(message: msg)
        })
    }
}