//
//  FlowerApiModel.swift
//  flower-list
//
//  Created by v.chimpalee on 23/8/2565 BE.
//

import Foundation

struct Flower: Codable {
  let size: Int
  let color: String
  let id: String
  let url: String
  let title: String
  let description: String
}

// MARK: - GET /widgets/flowers
struct GetAllFlowers: Codable {
  typealias Response = [Flower]
}
