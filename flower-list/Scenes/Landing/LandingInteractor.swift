//
//  LandingInteractor.swift
//  flower-list
//
//  Created by v.chimpalee on 23/8/2565 BE.
//

import Foundation

protocol LandingInteractorInterface {
  func fetchAllFlower()
}

class LandingInteractor: LandingInteractorInterface {

  var presenter: LandingPresenterInterface!

  func fetchAllFlower() {
    FlowerRestStore.getAllFlowers { response in
      switch response {
      case .success(let data):
        self.presenter.presentAllFlower(response: Landing.FetchAllFlowers.Response(flowers: data))
      case .failure(_): break
      // Todo:
      }
    }
  }
}
