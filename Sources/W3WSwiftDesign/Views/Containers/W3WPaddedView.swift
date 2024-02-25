//
//  File.swift
//  
//
//  Created by Dave Duprey on 15/08/2023.
//

import UIKit
import W3WSwiftThemes


/// This wraps a view inside another view to provide padding around the wrappedView
public class W3WPaddedView: W3WView {

  // this view can optionally wrap another UIView to allow regular UIViews to interact with this w3w design library
  public var wrappedView: W3WViewProtocol?
  
  public init<ViewType: W3WViewProtocol>(view: ViewType? = nil, scheme: W3WScheme? = nil) {
    super.init(scheme: scheme)
    set(scheme: scheme, position: position)
    set(view: view)
  }
  
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  
  public func set<ViewType: W3WViewProtocol>(view: ViewType?) {
    if let v = wrappedView {
      v.removeFromSuperview()
    }
    
    if let newView = view {
      wrappedView = newView
      addSubview(newView)

      let margin = scheme?.styles?.padding?.value ?? W3WPadding.thin.value
      let insets = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
      wrappedView?.position = .center(inset: insets)
    }
  }
  
}



