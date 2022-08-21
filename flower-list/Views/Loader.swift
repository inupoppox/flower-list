//
//  Loader.swift
//  flower-list
//
//  Created by v.chimpalee on 21/8/2565 BE.
//

import UIKit

class Loader {

  static let shared = Loader()
  var bgView = UIView()
  var activityIndicator = UIActivityIndicatorView()

  public func show() {
    guard let superView = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first else {
      return
    }

    bgView.frame = superView.frame
    bgView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.45)

    activityIndicator.style = .large
    activityIndicator.color = .white
    activityIndicator.center = bgView.center

    bgView.addSubview(activityIndicator)
    superView.addSubview(bgView)

    UIView.transition(
      with: superView, duration: 0.25, options: [.transitionCrossDissolve],
      animations: {
        superView.addSubview(self.bgView)
      }, completion: nil)

    self.activityIndicator.startAnimating()

  }

  public func hide() {
    guard let superView = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first else {
      return
    }

    activityIndicator.stopAnimating()

    UIView.transition(
      with: superView, duration: 0.1, options: [.transitionCrossDissolve],
      animations: {
        self.bgView.removeFromSuperview()
      }, completion: nil)
  }
}
