//
//  File.swift
//  
//
//  Created by Dave Duprey on 24/06/2023.
//

import UIKit


public protocol W3WTableCellProviderProtocol {
  func onNewData(closure: @escaping () -> ())
  func getCellIdentifier() -> String
  func getItem(row: Int) -> Any?
  func getCellCount() -> Int
  func getCellType() -> AnyClass
  func update(text: String)
  func update(cell: UITableViewCell, row: Int) -> UITableViewCell
  func update(selected: Any?)
}
