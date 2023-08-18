//
//  File.swift
//  
//
//  Created by Dave Duprey on 15/08/2023.
//

import UIKit


open class W3WScrollViewController: W3WViewController {

  public var w3wScrollView: W3WScrollView? {
    return self.view as? W3WScrollView
  }

  override open func loadView() {
    self.view = W3WScrollView(theme: theme)
  }
  
}
