//
//  ViewController.swift
//  MultiProjectStrings
//
//  Created by Colin Reisterer on 3/3/19.
//  Copyright © 2019 FullyTyped. All rights reserved.
//

import UIKit

private let name = "FullyTyped"

class ViewController: UITableViewController {
  
  private let strings: [String] = [
    NSLocalizedString("hello_world", comment: ""),
    String(format: NSLocalizedString("greet_user", comment: ""), name),
    String(format: NSLocalizedString("count_of_strings", comment: ""), 2)
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.registerNibForCellReuse(TextTableViewCell.self)
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return strings.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(TextTableViewCell.self, for: indexPath)
    cell.label.text = strings[indexPath.row]
    return cell
  }
}
