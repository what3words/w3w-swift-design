//
//  W3WScrollView.swift
//
//
//  Created by Dave Duprey on 17/03/2023.
//

import UIKit


open class W3WScrollView: UIScrollView, W3WViewProtocol, UIScrollViewDelegate  {
  
  public var design: W3WDesign?
  public var position: W3WViewPosition?
  
  // this view can optionally wrap another UIView to allow regular UIViews to interact with this w3w design library
  var wrappedView: UIView?
  
  
  public init(design: W3WDesign? = nil) { //, position: W3WViewPosition? = nil) {
    super.init(frame: .w3wWhatever)
    //frame = position?.position(superview, self) ?? .w3wWhatever
    position?.position(superview, self)
    set(design: design, position: position)
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
    
    var extents = CGSize.zero
    for view in subviews {
      if view.frame.maxX > extents.width
        { extents.width = view.frame.maxX }
      if view.frame.maxY > extents.height
        { extents.height = view.frame.maxY }
    }
    
    contentSize = extents
  }
  
  
}

