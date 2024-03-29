//
//  File.swift
//
//
//  Created by Dave Duprey on 26/06/2023.
//

import UIKit
import W3WSwiftThemes


/// This class is derived from UICollectionView and adds W3WScheme for colours and styles
public class W3WCollectionView: UICollectionView, W3WViewProtocol {
  public var scheme: W3WScheme?
  public var position: W3WViewPosition?
  

  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    updateView()
  }
  
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    updateView()
  }

  
  public func update(scheme: W3WScheme?) {
    apply(scheme: scheme)
  }

}
