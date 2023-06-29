//
//  File.swift
//  
//
//  Created by Dave Duprey on 17/03/2023.
//

import UIKit


public protocol W3WViewProtocol: UIView {
  var design: W3WDesign? { get set }
  var position: W3WViewPosition? { get set }
}


public extension W3WViewProtocol {
  
  
  func set(design: W3WDesign?, position: W3WViewPosition?) {
    set(design: design)
    set(position: position)
  }
  
  
  
  func set(design: W3WDesign?) {
    if let d = design {
      self.design = d
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
  func set(width: CGFloat, height: CGFloat? = nil) -> W3WViewProtocol {
    self.position = W3WViewPosition(width: width, height: height)
    return self
  }
  
  
  @discardableResult
  func set(height: CGFloat) -> W3WViewProtocol {
    self.position = W3WViewPosition(height: height)
    return self
  }
  
  
  @discardableResult
  func set(position: @escaping W3WPositionClosure) -> W3WViewProtocol {
    self.position = W3WViewPosition(position: position)
    return self
  }

  
  func updateView() {
    position?.position(superview, self)
    design?.update(view: self)
  }

  
  
  
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

