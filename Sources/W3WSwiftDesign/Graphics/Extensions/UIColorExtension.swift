//
//  File.swift
//  
//
//  Created by Dave Duprey on 26/04/2022.
//

import Foundation

#if canImport(UIKit)
import UIKit

extension UIColor {
  
  /// what3words extension to get a W3WColor object from a UIColor, defined in the W3WSwiftDesign module
  public var w3wColor: W3WColor {
    get {
      return W3WColor(uiColor: self)
    }
  }

  
  /// what3words extension to get a W3WCoreColor object from a UIColor, defined in the W3WSwiftDesign module
  public var w3wCoreColor: W3WCoreColor {
    get {
      return W3WCoreColor(uiColor: self)
    }
  }
  
}

#endif
