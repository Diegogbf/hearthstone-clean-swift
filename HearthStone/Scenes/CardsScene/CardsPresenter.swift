//
//  CardsPresenter.swift
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

protocol CardsPresentationLogic {
    func displayCards(response: Cards.FetchCards.Response)
}

class CardsPresenter: CardsPresentationLogic, WorkerPresentationFeedback {
    weak var viewController: (CardsDisplayLogic & WorkerPresentationFeedback)?
    
    // MARK: Display Cards
    func displayCards(response: Cards.FetchCards.Response) {
        let cardUrls = response.basic?.filter{ $0.img != nil }.compactMap { $0.img } ?? []
        let viewModel = Cards.FetchCards.ViewModel(cardImages: cardUrls)
        viewController?.displayCards(viewModel: viewModel)
    }
    
    func load(showLoader: Bool) {
        viewController?.load(showLoader: showLoader)
    }
    
    func showError(message: String) {
        viewController?.showError(message: message)
    }
}