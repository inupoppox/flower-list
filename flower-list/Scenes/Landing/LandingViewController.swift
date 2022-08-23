//
//  LandingViewController.swift
//  flower-list
//
//  Created by v.chimpalee on 21/8/2565 BE.
//

import UIKit

protocol LandingViewControllerInterface: AnyObject {
  func displayAllFlowers(viewModel: Landing.FetchAllFlowers.ViewModel)
}

class LandingViewController: UIViewController, UITableViewDataSource, LandingViewControllerInterface {

  private var flowerList: [DisplayedFlower] = []

  var interactor: LandingInteractorInterface!

  @IBOutlet weak var tableView: UITableView!

  override func awakeFromNib() {
    super.awakeFromNib()
    configure()
  }

  // MARK: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.register(
      UINib(nibName: FlowerTableViewCell.cellIdentifier, bundle: nil),
      forCellReuseIdentifier: FlowerTableViewCell.cellIdentifier)
    interactor.fetchAllFlower()
  }

  // MARK: - VIP Configuration
  private func configure() {
    let presenter = LandingPresenter()
    let interactor = LandingInteractor()

    presenter.viewController = self
    interactor.presenter = presenter
    self.interactor = interactor
  }

  // MARK: - Table View Data Source
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return flowerList.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let index = indexPath.row
    let cell =
      tableView.dequeueReusableCell(withIdentifier: FlowerTableViewCell.cellIdentifier, for: indexPath)
      as! FlowerTableViewCell
    cell.configure(
      with: FlowerTableViewCellViewModel(
        title: flowerList[index].title, subtitle: flowerList[index].description, thumbnail: flowerList[index].imagePath)
    )
    return cell
  }

  func displayAllFlowers(viewModel: Landing.FetchAllFlowers.ViewModel) {
    flowerList = viewModel.flowers
    DispatchQueue.main.async {
      self.tableView.reloadData()
    }
  }
}
