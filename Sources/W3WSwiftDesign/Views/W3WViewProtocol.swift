//
//  File.swift
//  
//
//  Created by Dave Duprey on 17/03/2023.
//

import UIKit
import W3WSwiftCore
import W3WSwiftThemes


public protocol W3WViewProtocol: UIView {
  var scheme: W3WScheme? { get set }
  var position: W3WViewPosition? { get set }
  
  func update(scheme: W3WScheme?)
}


public extension W3WViewProtocol {
  
  func set(scheme: W3WScheme?, position: W3WViewPosition?) {
    set(scheme: scheme)
    set(position: position)
  }
  
  
  func set(scheme: W3WScheme?) {
    if let t = scheme {
      self.scheme = t
    }

    updateView()
  }
  
  
  func set(position: W3WViewPosition?, animate: W3WDuration) {
    UIView.animate(withDuration: animate.seconds) { [weak self] in
      self?.set(position: position)
    }
  }
  
  
  func set(position: W3WViewPosition?) {
    if let p = position {
      self.position = p
    }
    
    updateView()
  }
  
  
  @discardableResult
  func with(width: CGFloat, height: CGFloat? = nil) -> W3WViewProtocol {
    self.position = W3WViewPosition(width: width, height: height)
    return self
  }
  
  
  @discardableResult
  func with(height: CGFloat) -> W3WViewProtocol {
    self.position = W3WViewPosition(height: height)
    return self
  }
  
  
  @discardableResult
  func with(position: @escaping W3WPositionClosure) -> W3WViewProtocol {
    self.position = W3WViewPosition(position: position)
    return self
  }

  
  func set(width: CGFloat, height: CGFloat? = nil) {
    self.position = W3WViewPosition(width: width, height: height)
  }
  
  
  func set(height: CGFloat) {
    self.position = W3WViewPosition(height: height)
  }
  
  
  func set(expand: Bool) {
    self.position = W3WViewPosition(expand: expand)
  }
  
  
  func set(position: @escaping W3WPositionClosure) {
    self.position = W3WViewPosition(position: position)
  }


  //@available(*, deprecated, message: "Just marking where this is called from")
  func updateView() {
    W3WThread.runOnMain { [weak self] in
      if let this = self {
        this.position?.position(this.superview, this)
      }
    }
    W3WThread.queueOnMain { [weak self] in
      self?.update(scheme: self?.scheme)
    }
  }
  
 
  var asStackView:  W3WStackView? { return self as? W3WStackView }
  var asLabel:      W3WLabel?     { return self as? W3WLabel }
  var asTextField:  W3WTextField? { return self as? W3WTextField }
 
}

