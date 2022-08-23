//
//  FlowerRestStore.swift
//  flower-list
//
//  Created by v.chimpalee on 23/8/2565 BE.
//

import Foundation

struct Endpoint {
  static let base = "https://us-central1-acndemoandroid.cloudfunctions.net/widgets"
  static let flowers = "\(Endpoint.base)/flowers"
}

class FlowerRestStore {
  static func getAllFlowers(completion: @escaping (Result<GetAllFlowers.Response, Error>) -> Void) {

    // Create URL
    guard let url = URL(string: Endpoint.flowers) else {
      return
    }

    // Create URL session data task
    URLSession.shared.dataTask(with: url) { data, _, error in
      if let error = error {
        completion(.failure(error))
        return
      }

      guard let data = data else {
        return
      }

      do {
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(GetAllFlowers.Response.self, from: data)
        completion(.success(decodedData))
      } catch {
        completion(.failure(error))
      }

    }.resume()
  }
}
