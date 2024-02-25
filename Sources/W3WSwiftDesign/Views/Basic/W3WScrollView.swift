//
//  W3WScrollView.swift
//
//
//  Created by Dave Duprey on 17/03/2023.
//

import UIKit
import W3WSwiftCore
import W3WSwiftThemes


/// A subclass of UIScrollView that adds W3WThemes and automatically manages the size of the
/// scroll area based on the subviews placed in it
open class W3WScrollView: UIScrollView, W3WViewProtocol, UIScrollViewDelegate  {
  
  public var scheme: W3WScheme?
  public var position: W3WViewPosition?
  
  // this view can optionally wrap another UIView to allow regular UIViews to interact with this w3w design library
  var wrappedView: UIView?
  
  
  public init(scheme: W3WScheme? = nil) {
    super.init(frame: .w3wWhatever)

    position?.position(superview, self)
    set(scheme: scheme, position: position)

    delegate = self
  }
  
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    delegate = self
  }
  
  
  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    updateView()
  }
  
  
  ///  manages the size of the scroll area based on the subviews placed in it
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
    extents.height += scheme?.styles?.padding?.value ?? 0.0
    extents.width  += scheme?.styles?.padding?.value ?? 0.0

    // we can turn the scroll indicators back on, now that we've enumerated the subviews
    self.showsVerticalScrollIndicator = showsVerticalScrollIndicator;
    self.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator;

    // apply the extents to the content view
    UIView.animate(withDuration: W3WDuration.defaultAnimationSpeed.seconds) { [weak self] in
      self?.contentSize = extents
    }
  }
  

  public func update(scheme: W3WScheme?) {
    apply(scheme: scheme)
  }
  

}

