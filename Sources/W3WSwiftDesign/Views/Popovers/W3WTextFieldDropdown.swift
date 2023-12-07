//
//  File.swift
//
//
//  Created by Dave Duprey on 29/09/2022.
//

import UIKit
import W3WSwiftThemes


open class W3WTextFieldDropdown: W3WTextField {
  //public weak var parentView: UIView? { get { self } set { } }
  
  var dropdownManager: W3WDropdownViewsManager?

//  public var dropdownView: W3WViewProtocol?

  public var managedViews = [W3WViewProtocol]()

  public init(theme: W3WTheme? = nil, dropdownView: W3WViewProtocol, dropdownSuperView: UIView) {
    super.init(scheme: theme?[.base])
    configure()
    
    dropdownManager = W3WDropdownViewsManager(dropdownFromView: self, dropdownSuperView: dropdownSuperView)
  }


  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    configure()
  }

  
  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    updateView()
  }

  
  public override func layoutSubviews() {
    super.layoutSubviews()
    dropdownManager?.update()
  }
  
}

