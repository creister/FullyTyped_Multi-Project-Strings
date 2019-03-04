//
//  UITableView+Extensions.swift
//  MultiProjectStrings
//
//  Created by Colin Reisterer on 3/3/19.
//  Copyright © 2019 FullyTyped. All rights reserved.
//

import UIKit

protocol ReuseIdentifable: class {
  static var reuseID: String { get }
}

protocol NibView: class {
  static func loadNib() -> UINib
}

extension NibView {
  
  /// Default implementation assumes in main bundle and class name matches nib name
  static func loadNib() -> UINib {
    return UINib(nibName: String(describing: self), bundle: nil)
  }
}

extension UITableView {
  
  typealias ReusableTableViewCell = UITableViewCell & ReuseIdentifable
  typealias ReusableTableViewCellFromNib = ReusableTableViewCell & NibView
  
  /// Register cell for reuse with table view
  /// - Assumes no nib file to load
  func registerClassForCellReuse<T: ReusableTableViewCell>(_ cellClass: T.Type) {
    register(cellClass, forCellReuseIdentifier: cellClass.reuseID)
  }
  
  /// Register a cell with nib file for reuse with table view
  func registerNibForCellReuse<T: ReusableTableViewCellFromNib>(_ cellClass: T.Type) {
    register(cellClass.loadNib(), forCellReuseIdentifier: cellClass.reuseID)
  }
  
  /// Guarantees a cell is returned and resized properly, assuming identifier is registered for correct cell class
  func dequeueReusableCell<T: ReusableTableViewCell>(_ cellClass: T.Type, for indexPath: IndexPath) -> T {
    return dequeueReusableCell(withIdentifier: T.reuseID, for: indexPath) as! T
  }
}
