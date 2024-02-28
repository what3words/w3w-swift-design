//
//  File.swift
//  
//
//  Created by Dave Duprey on 18/12/2022.
//

import UIKit
import W3WSwiftThemes


/// the definition of a positoining closure
public typealias W3WPositionClosure = (UIView?, W3WViewProtocol) -> (CGRect)


/// holds a closure that can be used to define a view's position
public class W3WViewPosition {
  
  /// the closure that defines a view's position
  var closure: W3WPositionClosure?
  
  /// whether changes should be animated and if so for how long.  Leave nil for no animations
  var animate: Double? = nil
    
  
  public init(animate: Double? = nil, position: @escaping W3WPositionClosure = { _,_ in return .w3wWhatever }) {
    self.animate = animate
    self.closure = position
  }
  
  
  /// this will position the view to where it needs to be via `frame` or using constraints as requested
  public func position(_ parent: UIView?, _ this: W3WViewProtocol) {
    if let duration = animate {
      UIView.animate(withDuration: duration) { [weak self] in
        self?.applyPosition(parent, this)
      }
    } else {
      applyPosition(parent, this)
    }
  }
  
  
  func applyPosition(_ parent: UIView?, _ this: W3WViewProtocol) {
    if let p = closure {
      this.frame = p(parent, this)
    }
  }
  
  
  // MARK: Constraints - experimental

  
  func getHeightConstraint(view: UIView) -> NSLayoutConstraint? {
    return view.constraints.first(where: {
      $0.firstAttribute == .height && $0.relation == .equal
    })
  }
  
  
  func getWidthConstraint(view: UIView) -> NSLayoutConstraint? {
    return view.constraints.first(where: {
      $0.firstAttribute == .width && $0.relation == .equal
    })
  }
  
}
