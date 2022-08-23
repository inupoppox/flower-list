//
//  LandingPresenter.swift
//  flower-list
//
//  Created by v.chimpalee on 23/8/2565 BE.
//

import Foundation

protocol LandingPresenterInterface {
  func presentAllFlower(response: Landing.FetchAllFlowers.Response)
}

class LandingPresenter: LandingPresenterInterface {
  weak var viewController: LandingViewControllerInterface!

  func presentAllFlower(response: Landing.FetchAllFlowers.Response) {
    let displayedFlowers = response.flowers.map { (flower: Flower) in
      return DisplayedFlower(id: flower.id, title: flower.title, description: flower.description, imagePath: flower.url)
    }
    viewController.displayAllFlowers(viewModel: Landing.FetchAllFlowers.ViewModel(flowers: displayedFlowers))
  }
}
