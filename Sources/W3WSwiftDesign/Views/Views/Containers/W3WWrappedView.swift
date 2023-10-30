//
//  File.swift
//
//
//  Created by Dave Duprey on 15/05/2023.
//

import UIKit


open class W3WWrappedView: W3WView {
  
  // this view can optionally wrap another UIView to allow regular UIViews to interact with this w3w design library
  public var wrappedView: UIView?
  
  public init<ViewType: UIView>(view: ViewType? = nil, scheme: W3WScheme? = nil) {
    super.init(scheme: scheme)
    set(scheme: scheme, position: position)
    set(view: view)
  }
  
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  
  public func set<ViewType: UIView>(view: ViewType?) {
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
