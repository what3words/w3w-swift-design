//
//  File.swift
//  
//
//  Created by Dave Duprey on 23/03/2023.
//

import UIKit


open class W3WViewDropdown: W3WView {
  
  public var managedViews = [W3WViewProtocol]()
    
  var dropdownManager: W3WDropdownViewsManager?

  
  public init(scheme: W3WScheme? = nil, dropdownSuperView: UIView) {
    super.init(scheme: scheme)
    dropdownManager = W3WDropdownViewsManager(dropdownFromView: self, dropdownSuperView: dropdownSuperView)
  }

  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  
  public func isShowing() -> Bool {
    return dropdownManager?.isShowing() ?? false
  }

  
  public func show(dropdown: W3WViewProtocol?) {
    dropdownManager?.show(dropdownView: dropdown)
  }
  
  
  public func hide() {
    dropdownManager?.show(dropdownView: nil)
  }
  

  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    updateView()
  }


  open override func layoutSubviews() {
    super.layoutSubviews()
    dropdownManager?.update()
  }
  
}


