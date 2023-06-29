//
//  File.swift
//  
//
//  Created by Dave Duprey on 10/10/2022.
//

import UIKit



open class W3WGenericTableCellProvider<RowDataType, CellType: UITableViewCell>: W3WTableCellProvider<CellType> {
  
  
  public var onSelected: (RowDataType) -> () = { _ in }

  
  /// the store of data for each row
  public var items = [RowDataType]()
  
  public var onNewCell: (CellType?, RowDataType) -> CellType? = { _,_ in return nil }
  
  
  // MARK: Accessors
  
  
  public func getItems() -> [RowDataType] {
    return items
  }
  
  
  public func set(items: [RowDataType]) {
    self.items = items
    //updateNoResultMessage()

    //onNewData()
    closure()
    
    //refreshViews()
//    DispatchQueue.main.async {
//      self.tableViewController?.tableView.reloadData()
//      self.tableViewController?.updateFrame()
//    }
    
    //updateFrame()
  }

  
  // MARK: Overrides
  
  override public func getCellIdentifier() -> String {
    return String(describing: getCellType().self)
  }
  
  
  override open func getCellType() -> AnyClass {
    return CellType.self
  }
  
  
  override open func getCellCount() -> Int {
    return items.count
  }
  
  
  override open func getItem(row: Int) -> Any? {
    return "Nothing"
  }
  
  
  override open func update(cell: UITableViewCell, row: Int) -> UITableViewCell {
    if let cell = cell as? CellType, let item = getItem(row: row) as? RowDataType {
      if let cell = onNewCell(cell, item) {
        return cell
      }
    }
    
    return CellType()
  }
  
  
  override open func update(selected: Any?) {
    if let item = selected as? RowDataType {
      onSelected(item)
    }
  }
  
  

  
  
}
