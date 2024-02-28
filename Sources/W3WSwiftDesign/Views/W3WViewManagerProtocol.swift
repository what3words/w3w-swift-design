//
//  File.swift
//  
//
//  Created by Dave Duprey on 24/03/2023.
//

import UIKit


/// Empowers a UIViewController (or in rare cases a UIView) to manage subviews in this system
public protocol W3WViewManagerProtocol: AnyObject {

  /// must return a reference to the parent view
  var parentView: UIView? { get set }
  
  /// returns an array of the protocol aware views it manages
  var managedViews: [W3WViewProtocol] { get set }
  
}


public extension W3WViewManagerProtocol {
  
  /// adds a view as a subview with optional positioning info
  ///  - Parameters:
  ///    - view: the view to add
  ///    - position: the position for the view as described by a W3WViewPosition
  func add(view: W3WViewProtocol, position: W3WViewPosition? = nil) {
    if let p = position {
      view.position = p
    }
    managedViews.append(view)
    parentView?.addSubview(view)
  }
  
  
  /// adds a view as a subview with an optional positioning closure
  ///  - Parameters:
  ///    - view: the view to add
  ///    - position: the position for the view as described by a closure
  func add(view: W3WViewProtocol, position: @escaping W3WPositionClosure) {
    view.position = W3WViewPosition(position: position)
    managedViews.append(view)
    parentView?.addSubview(view)
    updateViews()
  }
  
  
  // removes a subview
  func remove(view: W3WViewProtocol) {
    view.removeFromSuperview()
    managedViews.removeAll(where: { v in
      return v == view
    })
  }
  
  
  /// This must be called when this view updates it's position, size, shape
  /// or colours.  It loops through managable views and updates them
  func updateViews() {
    for view in managedViews {
      view.updateView()
    }
  }

  
}
