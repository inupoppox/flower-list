//
//  LandingViewController.swift
//  flower-list
//
//  Created by v.chimpalee on 21/8/2565 BE.
//

import UIKit

class LandingViewController: UIViewController, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!

  var mockData: [DisplayedFlower] = [
    DisplayedFlower(
      id: "1", title: "Rose 1", description: "Example of Rose 1",
      imagePath: "https://www.flowersngarden.com/imagens/bd/rosa0040.jpg"),
    DisplayedFlower(
      id: "2", title: "Rose 2", description: "Example of Rose 2",
      imagePath: "https://www.flowersngarden.com/imagens/bd/rosa0041.jpg"),
    DisplayedFlower(
      id: "3", title: "Rose 3", description: "Example of Rose 3",
      imagePath: "https://www.flowersngarden.com/imagens/bd/rosa0042.jpg"),
  ]

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.register(
      UINib(nibName: FlowerTableViewCell.cellIdentifier, bundle: nil),
      forCellReuseIdentifier: FlowerTableViewCell.cellIdentifier)
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return mockData.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let index = indexPath.row
    let cell =
      tableView.dequeueReusableCell(withIdentifier: FlowerTableViewCell.cellIdentifier, for: indexPath)
      as! FlowerTableViewCell
    cell.configure(
      with: FlowerTableViewCellViewModel(
        title: mockData[index].title, subtitle: mockData[index].description, thumbnail: mockData[index].imagePath))
    return cell
  }
}
