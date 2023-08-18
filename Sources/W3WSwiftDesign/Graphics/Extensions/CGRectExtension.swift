//
//  File.swift
//  
//
//  Created by Dave Duprey on 26/04/2022.
//

import Foundation

#if canImport(UIKit)
import UIKit

extension CGRect {
  
  /// an arbitrary value to give as a CGRect parameter when it's not important
  /// for example, if instantiating a UIView frame but its size is not yet determined
  public static let w3wWhatever  = CGRect(x: 0.0, y: 0.0, width: 64.0, height: 64.0)
  public static let w3wVerySmall = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)

}

#endif
