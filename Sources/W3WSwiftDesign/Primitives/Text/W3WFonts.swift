//
//  File.swift
//
//
//  Created by Dave Duprey on 07/04/2022.
//

import CoreGraphics
import UIKit


public struct W3WFonts {
  public var applyDynamicTypeScaling = true
  
  var largeTitle: UIFont  = .preferredFont(forTextStyle: .largeTitle)
  var title1:    UIFont  = .preferredFont(forTextStyle: .title1)
  var title2:   UIFont   = .preferredFont(forTextStyle: .title2)
  var title3:   UIFont   = .preferredFont(forTextStyle: .title3)
  var headline: UIFont   = .preferredFont(forTextStyle: .headline)
  var body:      UIFont   = .preferredFont(forTextStyle: .body)
  var callout:    UIFont   = .preferredFont(forTextStyle: .callout)
  var subheadline: UIFont  = .preferredFont(forTextStyle: .subheadline)
  var footnote:    UIFont  = .preferredFont(forTextStyle: .footnote)
  var caption1:   UIFont  = .preferredFont(forTextStyle: .caption1)
  var caption2:  UIFont  = .preferredFont(forTextStyle: .caption2)

  
  public init() { }

  public init(font: UIFont) {
    self.largeTitle = UIFontMetrics(forTextStyle: .largeTitle).scaledFont(for: font)
    self.title1    = UIFontMetrics(forTextStyle: .title1).scaledFont(for: font)
    self.title2   = UIFontMetrics(forTextStyle: .title2).scaledFont(for: font)
    self.title3   = UIFontMetrics(forTextStyle: .title3).scaledFont(for: font)
    self.headline  = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font)
    self.body       = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
    self.callout     = UIFontMetrics(forTextStyle: .callout).scaledFont(for: font)
    self.subheadline = UIFontMetrics(forTextStyle: .subheadline).scaledFont(for: font)
    self.footnote   = UIFontMetrics(forTextStyle: .footnote).scaledFont(for: font)
    self.caption1  = UIFontMetrics(forTextStyle: .caption1).scaledFont(for: font)
    self.caption2 = UIFontMetrics(forTextStyle: .caption2).scaledFont(for: font)
  }
  
  public init(body: UIFont, largeTitle: UIFont? = nil, title1: UIFont? = nil, title2: UIFont? = nil, title3: UIFont? = nil, headline: UIFont? = nil, callout: UIFont? = nil, subheadline: UIFont? = nil, footnote: UIFont? = nil, caption1: UIFont? = nil, caption2: UIFont? = nil) {
    self.body       = body

    self.largeTitle = largeTitle ?? body
    self.title1    = title1 ?? body
    self.title2   = title2 ?? body
    self.title3   = title3 ?? body
    self.headline  = headline ?? body
    self.callout     = callout ?? body
    self.subheadline = subheadline ?? body
    self.footnote   = footnote ?? body
    self.caption1  = caption1 ?? body
    self.caption2 = caption2 ?? body
  }
  

  
  func scale(font f:UIFont) -> UIFont {
//    var retval: UIFont

    let fontScaleFactor = UIFontMetrics(forTextStyle: .body).scaledValue(for: 100.0) / 100.0
    return UIFont(descriptor: f.fontDescriptor, size: f.pointSize * fontScaleFactor)
    
//    if let font = font {
//      retval = UIFont(descriptor: font.fontDescriptor, size: font.pointSize * fontScaleFactor)
//    }
//    else {
//      retval = .preferredFont(forTextStyle: .body)
//    }
//
//    return retval
  }

  
}





//public struct W3WFont {
//  
//  static public let main = UIFont(name: "SourceSansPro-Regular", size: 16.0) ?? UIFont.systemFont(ofSize: 16)
//  
//  
//  static public func pickaFont(size: CGFloat? = nil, weight: UIFont.Weight = .regular) -> UIFont {
//    var font: UIFont
//
//    if let s = size {
//      if let f = UIFont(name: "SourceSansPro-Regular", size: s) {
//        font = f
//      } else {
//        font = UIFont.systemFont(ofSize: s, weight: weight)
//      }
//      
//    } else {
//      
//      //#if os(watchOS)
//      //  font = UIFont.systemFont(ofSize: W3WDesignFontSize.systemFontSizeForWatchOS.value, weight: weight)
//      //#else
//        font = UIFont.systemFont(ofSize: UIFont.systemFontSize, weight: weight)
//      //#endif
//    }
//
//    return font
//  }
//  
//  
//}


//struct W3WDesignFontSize: Equatable, ExpressibleByFloatLiteral {
//  let value: CGFloat
//
//  init(value: CGFloat) { self.value = value }
//  init(floatLiteral value: Float) { self.value = CGFloat(value) }
//
//  static let appDefaultTitle  = W3WDesignFontSize(value: 22.0)
//  static let appXxxLargeTitle   = W3WDesignFontSize(value: 28.0)
//  static let appDefaultHeadline   = W3WDesignFontSize(value: 17.0)
//  static let appXxxLargeHeadline    = W3WDesignFontSize(value: 23.0)
//  static let systemFontSizeForWatchOS = W3WDesignFontSize(value: 12.0)
//}


//public enum W3WFontWeight {
//  case bold
//  case semiBold
//  case regular
//}


//public struct W3WFont {
//  let name: String
//  let size: CGFloat
//  let weight: W3WFontWeight
//  let lineHeight: CGFloat
//
//  public init(name: String = "San Source", size: CGFloat, weight: W3WFontWeight, lineHeight: CGFloat) {
//    self.name       = name
//    self.size       = size
//    self.weight     = weight
//    self.lineHeight = lineHeight
//  }
//
//
//
//  static public func pickaFont(size: CGFloat? = nil, weight: W3WFontWeight) -> UIFont {
//    var font: UIFont
//
//    if let s = size {
//      if let f = UIFont(name: "SourceSansPro-Regular", size: s) {
//        font = f
//      } else {
//        if weight == .semiBold {
//          font = UIFont.systemFont(ofSize: s, weight: .semibold)
//        } else {
//          font = UIFont.systemFont(ofSize: s, weight: .regular)
//        }
//      }
//    } else {
//      if weight == .semiBold {
//#if os(watchOS)
//        font = UIFont.systemFont(ofSize: W3WDesignFontSize.systemFontSizeForWatchOS.value, weight: .semibold)
//#else
//        font = UIFont.systemFont(ofSize: UIFont.systemFontSize, weight: .semibold)
//#endif
//      } else {
//#if os(watchOS)
//        font = UIFont.systemFont(ofSize: W3WDesignFontSize.systemFontSizeForWatchOS.value, weight: .regular)
//#else
//        font = UIFont.systemFont(ofSize: UIFont.systemFontSize, weight: .regular)
//#endif
//      }
//    }
//
//    return font
//  }
//
//
//  static public let appDefaultTitle = W3WFont(size: 22.0, weight: .semiBold, lineHeight: 1.3)
//  static public let appDefaultBody  = W3WFont(size: 17.0, weight: .semiBold, lineHeight: 1.3)
//}
