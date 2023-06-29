//
//  File.swift
//  
//
//  Created by Dave Duprey on 23/03/2023.
//

import UIKit


open class W3WViewDropdown: W3WView, W3WDropDownViewProtocol {
  public weak var parentView: UIView? { get { self } set {  } }
  
  public var managedViews = [W3WViewProtocol]()
  
  public var dropdownView: W3WViewProtocol?
  

  public init(design: W3WDesign? = nil, dropdownView: W3WViewProtocol? = nil) {
    super.init(design: design)
    set(dropdownView: dropdownView)
  }
  
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  

  open override func layoutSubviews() {
    super.layoutSubviews()
    dropdownView?.frame = dropdownFrame
  }
  
}


