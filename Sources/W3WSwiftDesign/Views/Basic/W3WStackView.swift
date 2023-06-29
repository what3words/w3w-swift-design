//
//  File.swift
//  
//
//  Created by Dave Duprey on 19/06/2023.
//

import UIKit



open class W3WStackView: UIStackView, W3WViewProtocol  {
  
  public var design: W3WDesign?
  public var position: W3WViewPosition?
  
  
  public init(views: [W3WViewProtocol] = [], design: W3WDesign? = nil) {
    super.init(frame: .w3wWhatever)
    //frame = position?.position(superview, self) ?? .w3wWhatever
    position?.position(superview, self)

    //isLayoutMarginsRelativeArrangement = false
    //distribution = .equalCentering
    spacing = W3WMargin.light.value

    for view in views {
      add(view: view)
    }
    
    set(design: design, position: position)
  }
  
  
  public required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  public func add(view: W3WViewProtocol, animated: Bool = false) {
    if animated {
      view.isHidden = true
      addArrangedSubview(view)
      UIView.animate(withDuration: 0.3) {
        view.isHidden = false
      }
      
    } else {
      addArrangedSubview(view)
    }
  }
  
  
  public func remove(view: W3WViewProtocol, animated: Bool = false) {
    if animated {
      let previousHiddenValue = view.isHidden
      
      UIView.animate(
        
        withDuration: 0.3,
        
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
    return systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).width
  }

  
  // Attribute overrides
  
  
  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    updateView()
  }
  
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    updateView()
  }
  
  
}

