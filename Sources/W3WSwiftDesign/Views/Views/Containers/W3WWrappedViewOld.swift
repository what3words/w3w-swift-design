//
//  File.swift
//  
//
//  Created by Dave Duprey on 15/05/2023.
//

import UIKit


open class W3WWrappedViewOld<ViewType: UIView>: W3WView {
  
  // this view can optionally wrap another UIView to allow regular UIViews to interact with this w3w design library
  public var wrappedView: ViewType?
  
  public init(view: ViewType? = nil, theme: W3WTheme? = nil) {
    super.init(theme: theme)
    set(theme: theme, position: position)
    set(view: view)
  }

  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  
  public func set(view: ViewType?) {
    if let newView = view {
      if let v = wrappedView {
        v.removeFromSuperview()
      }
      
      addSubview(newView)
      wrappedView = newView
      wrappedView?.frame = bounds
    }
  }
  
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    updateView()
    
    wrappedView?.frame = bounds
  }

  
}
