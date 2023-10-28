//
//  W3WScrollView.swift
//
//
//  Created by Dave Duprey on 17/03/2023.
//

import UIKit
import W3WSwiftCore


open class W3WScrollView: UIScrollView, W3WViewProtocol, UIScrollViewDelegate  {
  
  public var theme: W3WTheme?
  public var position: W3WViewPosition?
  
  // this view can optionally wrap another UIView to allow regular UIViews to interact with this w3w design library
  var wrappedView: UIView?
  
  
  public init(theme: W3WTheme? = nil) { //, position: W3WViewPosition? = nil) {
    super.init(frame: .w3wWhatever)

    position?.position(superview, self)
    set(theme: theme, position: position)

    delegate = self
  }
  
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    delegate = self
  }
  
  
  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    updateView()
  }
  
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    updateView()

    // we have to turn off the scroll indicators so that the loop below doesn't enumerate them
    let showsVerticalScrollIndicator    = self.showsVerticalScrollIndicator
    let showsHorizontalScrollIndicator  = self.showsHorizontalScrollIndicator
    self.showsVerticalScrollIndicator   = false
    self.showsHorizontalScrollIndicator = false
        
    // figure out the extents of the subviews
    var extents = CGSize.zero
    for view in subviews {
      
      if view.frame.maxX > extents.width {
        extents.width = view.frame.maxX
      }
      
      if view.frame.maxY > extents.height {
        extents.height = view.frame.maxY
      }
    }
    
    // pad the extents a bit
    extents.height += theme?[.base]?.styles?.padding?.value ?? 0.0
    extents.width  += theme?[.base]?.styles?.padding?.value ?? 0.0

    // we can turn the scroll indicators back on, now that we've enumerated the subviews
    self.showsVerticalScrollIndicator = showsVerticalScrollIndicator;
    self.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator;

    // apply the extents to the content view
    UIView.animate(withDuration: W3WDuration.defaultAnimationSpeed.seconds) { [weak self] in
      self?.contentSize = extents
    }
  }
  

  public func update(theme: W3WTheme?) {
    apply(theme: theme)
  }
  

}

