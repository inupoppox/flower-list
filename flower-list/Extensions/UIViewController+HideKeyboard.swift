//
//  UIViewController+HideKeyboard.swift
//  flower-list
//
//  Created by v.chimpalee on 21/8/2565 BE.
//

import UIKit

extension UIViewController {

  @objc func hideKeyboardWhenTappedAround() {
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(
      target: self, action: #selector(UIViewController.dismissKeyboard))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
  }

  @objc func dismissKeyboard() {
    view.endEditing(true)
  }
}
