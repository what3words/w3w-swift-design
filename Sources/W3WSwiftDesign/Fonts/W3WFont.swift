//
//  File.swift
//
//
//  Created by Dave Duprey on 07/04/2022.
//

import CoreGraphics
import UIKit


struct W3WDesignFontSize: Equatable, ExpressibleByFloatLiteral {
  let value: CGFloat
  
  init(value: CGFloat) { self.value = value }
  init(floatLiteral value: Float) { self.value = CGFloat(value) }
  
  static let appDefaultTitle  = W3WDesignFontSize(value: 22.0)
  static let appXxxLargeTitle   = W3WDesignFontSize(value: 28.0)
  static let appDefaultHeadline   = W3WDesignFontSize(value: 17.0)
  static let appXxxLargeHeadline    = W3WDesignFontSize(value: 23.0)
  static let systemFontSizeForWatchOS = W3WDesignFontSize(value: 12.0)
}


public enum W3WFontWeight {
  case bold
  case semiBold
  case regular
}


public struct W3WFont {
  let name: String
  let size: CGFloat
  let weight: W3WFontWeight
  let lineHeight: CGFloat
  
  public init(name: String = "San Source", size: CGFloat, weight: W3WFontWeight, lineHeight: CGFloat) {
    self.name       = name
    self.size       = size
    self.weight     = weight
    self.lineHeight = lineHeight
  }
  
  

  static public func pickaFont(size: CGFloat? = nil, weight: W3WFontWeight) -> UIFont {
    var font: UIFont
    
    if let s = size {
      if let f = UIFont(name: "SourceSansPro-Regular", size: s) {
        font = f
      } else {
        if weight == .semiBold {
          font = UIFont.systemFont(ofSize: s, weight: .semibold)
        } else {
          font = UIFont.systemFont(ofSize: s, weight: .regular)
        }
      }
    } else {
      if weight == .semiBold {
#if os(watchOS)
        font = UIFont.systemFont(ofSize: W3WDesignFontSize.systemFontSizeForWatchOS.value, weight: .semibold)
#else
        font = UIFont.systemFont(ofSize: UIFont.systemFontSize, weight: .semibold)
#endif
      } else {
#if os(watchOS)
        font = UIFont.systemFont(ofSize: W3WDesignFontSize.systemFontSizeForWatchOS.value, weight: .regular)
#else
        font = UIFont.systemFont(ofSize: UIFont.systemFontSize, weight: .regular)
#endif
      }
    }
    
    return font
  }

  
  static public let appDefaultTitle = W3WFont(size: 22.0, weight: .semiBold, lineHeight: 1.3)
  static public let appDefaultBody  = W3WFont(size: 17.0, weight: .semiBold, lineHeight: 1.3)
}
