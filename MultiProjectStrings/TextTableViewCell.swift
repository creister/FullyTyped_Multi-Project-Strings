//
//  TextTableViewCell.swift
//  MultiProjectStrings
//
//  Created by Colin Reisterer on 3/3/19.
//  Copyright © 2019 FullyTyped. All rights reserved.
//

import UIKit

class TextTableViewCell: UITableViewCell, ReuseIdentifable, NibView {
  @IBOutlet var label: UILabel!
  
  // ReuseIdentifable conformance
  static var reuseID = String(describing: self)
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
}
