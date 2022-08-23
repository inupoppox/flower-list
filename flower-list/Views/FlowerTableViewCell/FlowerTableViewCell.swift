//
//  FlowerTableViewCell.swift
//  flower-list
//
//  Created by v.chimpalee on 22/8/2565 BE.
//

import UIKit

struct FlowerTableViewCellViewModel {
  let title: String
  let subtitle: String
  let thumbnail: String
}

class FlowerTableViewCell: UITableViewCell {

  static let cellIdentifier = "FlowerTableViewCell"
  @IBOutlet private weak var thumbnail: UIImageView!
  @IBOutlet private weak var title: UILabel!
  @IBOutlet private weak var subtitle: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
    thumbnail.layer.cornerRadius = 7
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    // Configure the view for the selected state
  }

  func configure(with viewModel: FlowerTableViewCellViewModel) {
    title.text = viewModel.title
    subtitle.text = viewModel.subtitle
    thumbnail.loadImageWithUrl(urlString: viewModel.thumbnail)
  }
}
