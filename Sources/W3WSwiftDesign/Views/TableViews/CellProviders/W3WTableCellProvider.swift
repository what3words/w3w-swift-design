//
//  File.swift
//  
//
//  Created by Dave Duprey on 07/10/2022.
//

import UIKit
import W3WSwiftCore




open class W3WTableCellProvider<CellType: UITableViewCell>: W3WTableCellProviderProtocol {

//  public var onNewData: () -> () = { }
  public var closure: () -> () = { }
  
  public var onError: (W3WError) -> () = { _ in }
  
  //public weak var tableViewController: W3WMultiSourceTableViewController?
  
  
  public init() {
    //self.tableViewController = tableViewController
  }
  
  
  public func onNewData(closure: @escaping () -> ()) {
    self.closure = closure
  }
  
  
  public func getCellIdentifier() -> String {
    return String(describing: getCellType().self)
  }
  
  
  open func getCellType() -> AnyClass {
    return CellType.self
  }

  
  open func getCellCount() -> Int {
    return 0
  }
  
  
  open func getItem(row: Int) -> Any? {
    return "Nothing"
  }
  
  
  open func update(cell: UITableViewCell, row: Int) -> UITableViewCell {
    if let cell = cell as? CellType  {
      return cell
    }
    return CellType()
  }
  
  
  open func update(selected: Any?) {
  }
  
  
  open func update(text: String) {
  }


//  func refreshViews() {
//    DispatchQueue.main.async {
//      //self.tableViewController?.tableView.reloadData()
//      //self.tableViewController?.updateFrame()
//    }
//  }

  
}
