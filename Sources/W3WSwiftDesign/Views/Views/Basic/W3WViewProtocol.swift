//
//  File.swift
//  
//
//  Created by Dave Duprey on 17/03/2023.
//

import UIKit


public protocol W3WViewProtocol: UIView {
  var theme: W3WTheme? { get set }
  var position: W3WViewPosition? { get set }
}


public extension W3WViewProtocol {
  
  
  func set(theme: W3WTheme?, position: W3WViewPosition?) {
    set(theme: theme)
    set(position: position)
  }
  
  
  
  func set(theme: W3WTheme?) {
    if let t = theme {
      self.theme = t
    }

    updateView()
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

  
  func updateView() {
    position?.position(superview, self)
    theme?.update(view: self)
  }

  
  
  var asStackView:  W3WStackView? { return self as? W3WStackView }
  var asLabel:      W3WLabel?     { return self as? W3WLabel }
  var asTextField:  W3WTextField? { return self as? W3WTextField }
  
  
  //move this back...;
  /// convert this view into a UIImage
//  func asImage(size: CGSize? = nil) -> UIImage? {
//    let s = size ?? self.bounds.size
//    let b = CGRect(origin: .zero, size: s)
//    UIGraphicsBeginImageContextWithOptions(s, false, 0.0)
//    self.drawHierarchy(in: b, afterScreenUpdates: true)
//    self.draw(b)
//    let image = UIGraphicsGetImageFromCurrentImageContext()
//    UIGraphicsEndImageContext()
//    return image
//  }

  
}

