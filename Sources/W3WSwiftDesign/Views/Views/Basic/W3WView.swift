//
//  File.swift
//  
//
//  Created by Dave Duprey on 17/03/2023.
//

import UIKit


open class W3WView: UIView, W3WViewProtocol  {

  public var scheme: W3WScheme?
  
  public var position: W3WViewPosition? {
    didSet {
      self.updateView()
    }
  }
  

  public init(scheme: W3WScheme? = nil) { //, position: W3WViewPosition? = nil) {
    super.init(frame: .w3wWhatever)

    position?.position(superview, self)
    set(scheme: scheme, position: position)
  }
  
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  
  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    updateView()
  }

  
  open override func layoutSubviews() {
    super.layoutSubviews()
    updateView()
  }


  open func update(scheme: W3WScheme?) {
    apply(scheme: scheme)
  }
  
}

