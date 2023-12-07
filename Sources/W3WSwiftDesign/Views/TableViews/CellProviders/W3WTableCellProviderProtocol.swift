//
//  File.swift
//  
//
//  Created by Dave Duprey on 24/06/2023.
//

import UIKit
import W3WSwiftCore


public protocol W3WTableCellProviderProtocol {
  func onError(closure: @escaping W3WErrorResponse)
  func onNewData(closure: @escaping () -> ())
  func getCellIdentifier() -> String
  func getSectionHeaderView() -> UIView?
  func getItem(row: Int) -> Any?
  func getCellCount() -> Int
  func getCellType() -> AnyClass
  func update(text: String)
  func update(cell: UITableViewCell, row: Int) -> UITableViewCell
  func update(selected: Any?)
}
