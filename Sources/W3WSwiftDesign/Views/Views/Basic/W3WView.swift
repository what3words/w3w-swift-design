//
//  File.swift
//  
//
//  Created by Dave Duprey on 17/03/2023.
//

import UIKit


open class W3WView: UIView, W3WViewProtocol  {

  public var theme: W3WTheme?
  
  public var position: W3WViewPosition? {
    didSet {
      self.updateView()
    }
  }
  

  public init(theme: W3WTheme? = nil) { //, position: W3WViewPosition? = nil) {
    super.init(frame: .w3wWhatever)
    //frame = position?.position(superview, self) ?? .w3wWhatever
    position?.position(superview, self)
    set(theme: theme, position: position)
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

    
  
  // MARK: resultBuilder functions
  
  
//  static public func with(@W3WView _ content: () -> W3WViewProtocol) -> W3WViewProtocol {
//    content()
//  }
//  
////  public func with(@W3WView _ content: () -> W3WViewProtocol) -> W3WViewProtocol {
////    content()
////  }
//  
//  static public func buildBlock() -> W3WViewProtocol {
//    W3WView()
//  }
//  
//  
//  static public func buildBlock(_ views: W3WViewProtocol...) -> W3WViewProtocol {
//    let stack = W3WStackView(views: views)
//    stack.distribution = .fillEqually
//    //stack.axis = .horizontal
//    return stack
//  }
  
  
}

