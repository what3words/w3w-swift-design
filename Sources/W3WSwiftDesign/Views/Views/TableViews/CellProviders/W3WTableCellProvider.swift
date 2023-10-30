//
//  File.swift
//  
//
//  Created by Dave Duprey on 07/10/2022.
//

import UIKit
import W3WSwiftCore




open class W3WTableCellProvider<CellType: UITableViewCell>: W3WTableCellProviderProtocol {

  public var scheme: W3WScheme? = nil

  public var closure: () -> () = { }
  
  public var onError: W3WErrorResponse = { _ in }
  
  public var sectionHeaderView: UIView?

  
  public init(scheme: W3WScheme? = nil) {
    self.scheme = scheme
  }
  
  
  public func onNewData(closure: @escaping () -> ()) {
    self.closure = closure
  }

  
  public func onError(closure: @escaping W3WErrorResponse) {
    self.onError = closure
  }

  
  public func getCellIdentifier() -> String {
    return String(describing: getCellType().self)
  }
  
  
  open func getCellType() -> AnyClass {
    return CellType.self
  }

  
  open func getSectionHeaderView() -> UIView? {
    return sectionHeaderView
  }


  open func getCellCount() -> Int {
    return 0
  }
  
  
  open func getItem(row: Int) -> Any? {
    return nil
  }
  
  
  open func update(cell: UITableViewCell, row: Int) -> UITableViewCell {
    var retval: CellType!
    
    if let c = cell as? CellType  {
      retval = c
    } else {
      retval = CellType()
    }
    
    if let c = retval as? W3WViewProtocol {
      c.updateView()
    }
    
    return retval
  }
  
  
  open func update(selected: Any?) {
  }
  
  
  open func update(text: String) {
  }
  
}
