//
//  File.swift
//  
//
//  Created by Dave Duprey on 24/03/2023.
//

import UIKit



public protocol W3WViewManagerProtocol: AnyObject {

  var parentView: UIView? { get set }
  
  var managedViews: [W3WViewProtocol] { get set }
  
}


public extension W3WViewManagerProtocol {
  
//  func add(view: UIView, position: @escaping () -> (CGRect)) {
//    add(view: view, position: W3WViewPosition(position: position))
//  }
  
  
//  func add(view: UIView, position: W3WViewPosition) {
//    let managedView = W3WManagedView(view: view, position: position)
//    managedViews.append(managedView)
//
//    parentView.addSubview(view)
//  }
  
  
//  func add(view: UIView, theme: W3WDesign, position: W3WViewPosition) {
//    let managedView = W3WManagedView(view: view, theme: theme, position: position)
//    managedViews.append(managedView)
//
//    parentView.addSubview(view)
//  }
  
  
  func add(view: W3WViewProtocol, position: W3WViewPosition? = nil) {
    if let p = position {
      view.position = p
    }
    managedViews.append(view)
    parentView?.addSubview(view)
  }
  
  
  func add(view: W3WViewProtocol, position: @escaping W3WPositionClosure) {
    view.position = W3WViewPosition(position: position)
    managedViews.append(view)
    parentView?.addSubview(view)
    updateViews()
  }
  
  
  func updateViews() {
    for view in managedViews {
      view.updateView()
    }
  }

  
}
