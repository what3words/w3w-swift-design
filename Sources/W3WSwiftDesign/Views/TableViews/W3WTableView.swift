//
//  File.swift
//  
//
//  Created by Dave Duprey on 26/06/2023.
//

import UIKit
import W3WSwiftThemes


public class W3WTableView: UITableView, W3WViewProtocol {
  public var scheme: W3WScheme?
  public var position: W3WViewPosition?
  
  
  init(scheme: W3WScheme? = nil, position: W3WViewPosition? = nil, frame: CGRect = .w3wWhatever) {
    super.init(frame: frame, style: .plain)
    self.scheme = scheme
    self.position = position
  }

  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  
  // MARK: Overrides

  
  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    updateView()
  }

  
  open override func layoutSubviews() {
    if superview != nil {
      super.layoutSubviews()
      updateView()
    }
  }
  

  public func update(scheme: W3WScheme?) {
    apply(scheme: scheme)
  }
  
}
