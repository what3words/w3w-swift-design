//
//  File.swift
//  
//
//  Created by Dave Duprey on 19/06/2023.
//

import UIKit



open class W3WStackView: UIStackView, W3WViewProtocol  {
  
  public var theme: W3WTheme?
  public var position: W3WViewPosition?
  
  
  public init(views: [W3WViewProtocol] = [], theme: W3WTheme? = nil) {
    super.init(frame: .w3wWhatever)
    //frame = position?.position(superview, self) ?? .w3wWhatever
    position?.position(superview, self)

    //isLayoutMarginsRelativeArrangement = false
    //distribution = .equalCentering
    spacing = W3WMargin.light.value

    for view in views {
      add(view: view)
    }
    
    set(theme: theme, position: position)
  }
  
  
  public required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  public func add(view: W3WViewProtocol, animated: Double? = nil) { //}, completion: @escaping (Bool) -> () = {_ in }) {
    if let animated = animated {
      view.isHidden = true
      addArrangedSubview(view)
      UIView.animate(withDuration: animated, animations: {
        view.isHidden = false
      }) //, completion: completion)
      
    } else {
      addArrangedSubview(view)
      //completion(true)
    }
  }
  
  
  public func remove(view: W3WViewProtocol, animated: Double? = nil) {
    if let animated = animated {
      let previousHiddenValue = view.isHidden
      
      UIView.animate(
        
        withDuration: animated,
        
        animations: {
          view.isHidden = true
        },
        
        completion: { _ in
          view.removeFromSuperview()
          view.isHidden = previousHiddenValue
        }
      )

    } else {
      view.removeFromSuperview()
    }
  }
  
  
  // MARK: Utility
  
  
  public func getWidth() -> CGFloat {
    var width:CGFloat = 0
    for view in subviews {
      width += view.frame.width
    }
    return width
  }

  
  // Attribute overrides
  
  
  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    updateView()

//    for view in subviews {
//      if let v = view as? W3WViewProtocol {
//        v.updateView()
//      }
//    }
  }
  
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    updateView()
  }
  
  
}

