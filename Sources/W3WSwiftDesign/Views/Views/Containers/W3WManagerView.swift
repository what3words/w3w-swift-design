//
//  File.swift
//  
//
//  Created by Dave Duprey on 22/06/2023.
//

import UIKit


open class W3WManagerView: W3WView, W3WViewManagerProtocol {
  
  public weak var parentView: UIView? { get { self } set {  } }
  public var managedViews = [W3WViewProtocol]()

  
  public override init(theme: W3WTheme? = nil) { //, position: W3WViewPosition? = nil) {
    super.init(theme: theme)
  }
  
  
  public required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    updateViews()
  }

  
}
