//
//  File.swift
//  
//
//  Created by Dave Duprey on 17/03/2023.
//

import UIKit
import W3WSwiftCore
import W3WSwiftThemes


/// adds basic functions to a UIView derived class such as
/// colors, styles, and positioning
public protocol W3WViewProtocol: UIView {
  var scheme: W3WScheme? { get set }
  var position: W3WViewPosition? { get set }
  
  func set(scheme: W3WScheme?)
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
  
  
  func set(position: @escaping W3WPositionClosure) {
    self.position = W3WViewPosition(position: position)
  }


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
  
 
  // convenience accessor to get the view if it's a W3WStackView
  var asStackView:  W3WStackView? { return self as? W3WStackView }

  // convenience accessor to get the view if it's a W3WLabel
  var asLabel:      W3WLabel?     { return self as? W3WLabel }

  // convenience accessor to get the view if it's a W3WTextField
  var asTextField:  W3WTextField? { return self as? W3WTextField }
 
}

