//
//  File.swift
//
//
//  Created by Dave Duprey on 26/06/2023.
//

import UIKit


public class W3WCollectionView: UICollectionView, W3WViewProtocol {
  public var theme: W3WTheme?
  public var position: W3WViewPosition?
  

  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    updateView()
  }
  
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    updateView()
  }
}
