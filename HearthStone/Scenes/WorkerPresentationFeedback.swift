//
//  WorkerFeedbackPresenter.swift
//  HearthStone
//
//  Created by Diego Gomes on 30/04/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//

import Foundation

protocol WorkerPresentationFeedback: class {
    func load(showLoader: Bool)
    func showError(message: String)
}

