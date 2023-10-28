//
//  File.swift
//  
//
//  Created by Dave Duprey on 26/06/2023.
//

import UIKit


public class W3WTableView: UITableView, W3WViewProtocol {
  public var theme: W3WTheme?
  public var position: W3WViewPosition?
  
  
  init(theme: W3WTheme? = nil, position: W3WViewPosition? = nil, frame: CGRect = .w3wWhatever) {
    super.init(frame: frame, style: .plain)
    self.theme = theme
    self.position = position
  }

  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  
//  // MARK: Overrides
//
  //  Attempt to calculate content size to determine prefeeredHeight for table
//
//  override public var intrinsicContentSize: CGSize {
//    self.layoutIfNeeded()
//    return self.contentSize
//  }
//
//
//  override public  var contentSize: CGSize {
//    didSet {
//      self.invalidateIntrinsicContentSize()
//    }
//  }
//
//
//  override public func reloadData() {
//    super.reloadData()
//    self.invalidateIntrinsicContentSize()
//  }
  
  
  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    updateView()
  }

  
  open override func layoutSubviews() {
    if superview != nil {
      super.layoutSubviews()
      updateView()
    }
  }
  

  public func update(theme: W3WTheme?) {
    apply(theme: theme)
  }
  
}
