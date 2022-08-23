//
//  LandingModel.swift
//  flower-list
//
//  Created by v.chimpalee on 22/8/2565 BE.
//

import Foundation

struct DisplayedFlower {
  var id: String
  var title: String
  var description: String
  var imagePath: String
}

struct Landing {
  struct FetchAllFlowers {
    /// Data struct sent to Interactor
    struct Request {}

    /// Data struct sent to Present
    struct Response {
      var flowers: GetAllFlowers.Response
    }

    /// Data struct sent to View Controller
    struct ViewModel {
      var flowers: [DisplayedFlower]
    }
  }
}
