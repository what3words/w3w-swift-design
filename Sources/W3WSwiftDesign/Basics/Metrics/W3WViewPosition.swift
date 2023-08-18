//
//  File.swift
//  
//
//  Created by Dave Duprey on 18/12/2022.
//

import UIKit


public typealias W3WPositionClosure = (UIView?, W3WViewProtocol) -> (CGRect)


public class W3WViewPosition {
  
  var closure: W3WPositionClosure? // = { _,_ in return .w3wWhatever }
  
  var animate: Double? = nil
  
  var heightConstraint: CGFloat?
  var widthConstraint: CGFloat?
  var expandConstraint: Bool = false
  
  var constraintsActive: Bool {
    return (heightConstraint != nil) || (widthConstraint != nil)
  }

  
  public init(animate: Double? = nil, position: @escaping W3WPositionClosure = { _,_ in return .w3wWhatever }) {
    self.animate = animate
    self.closure = position
  }
  
  
  public init(width: CGFloat, height: CGFloat? = nil, expand: Bool = false) {
    widthConstraint  = width
    heightConstraint = height
    expandConstraint = expand
  }
  
  
  public init(height: CGFloat, expand: Bool = false) {
    heightConstraint = height
  }
  
  
  public init(expand: Bool) {
    expandConstraint = expand
  }
  
  
  func setConstraints(view: W3WViewProtocol) {
    // first remove all constraints
    //DispatchQueue.main.async {
    //  view.removeConstraints(view.constraints)
    //}
    
    if let height = heightConstraint {
      if let constraint = getHeightConstraint(view: view) {
        constraint.constant = height
      } else {
        let constraint = view.heightAnchor.constraint(equalToConstant: height)
        constraint.isActive = true
      }
    }
    
    if let width = widthConstraint {
      if let constraint = getWidthConstraint(view: view) {
        constraint.constant = width
      } else {
        let constraint = view.widthAnchor.constraint(equalToConstant: width)
        constraint.isActive = true
      }
    }
    
    if expandConstraint {
      view.setContentHuggingPriority(.fittingSizeLevel, for: .horizontal)
      view.setContentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)
      
      view.setContentHuggingPriority(.fittingSizeLevel, for: .vertical)
      view.setContentCompressionResistancePriority(.fittingSizeLevel, for: .vertical)
    }
  
    if view.constraints.count > 2 {
      print("Multiple constrints!", type(of: view), view.constraints.count, view.constraints.map({ c in return c.firstAttribute.rawValue }))
    }
    
//    if let height = heightConstraint {
//      view.removeConstraints(view.constraints)
////      if let existingConstraint = getHeightConstraint(view: view) {
////        existingConstraint.constant = height
////
////      } else {
//        let constraint = view.heightAnchor.constraint(equalToConstant: height)
//        constraint.isActive = true
//        UIView.animate(withDuration: 0.3) {
//          view.layoutIfNeeded()
//        }
////      }
//    }
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
    // use constraints
    if constraintsActive {
      setConstraints(view: this)
      
      // use the positioning closure
    } else {
      if let p = closure {
        this.frame = p(parent, this)
      }
    }
  }
  
  
  // MARK: Constraints

  
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
