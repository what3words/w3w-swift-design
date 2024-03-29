//
//  File.swift
//  
//
//  Created by Dave Duprey on 22/06/2023.
//

import UIKit
import W3WSwiftThemes


/// This adds the ability for a view to manage it's subviews positions
///  using W3WViewProtocol and it's W3WViewPosition objects
open class W3WManagerView: W3WView, W3WViewManagerProtocol {
  
  public weak var parentView: UIView? { get { self } set {  } }
  public var managedViews = [W3WViewProtocol]()

  
  public override init(scheme: W3WScheme? = nil) {
    super.init(scheme: scheme)
  }
  
  
  public required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    updateViews()
  }

  
}
