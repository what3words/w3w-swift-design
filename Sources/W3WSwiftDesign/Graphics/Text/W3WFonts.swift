//
//  File.swift
//
//
//  Created by Dave Duprey on 07/04/2022.
//

import CoreGraphics
import UIKit


struct W3WFontSizes {
  var largeTitle: CGFloat
  var title1:    CGFloat
  var title2:   CGFloat
  var title3:   CGFloat
  var headline: CGFloat
  var body:      CGFloat
  var callout:    CGFloat
  var subheadline: CGFloat
  var footnote:    CGFloat
  var caption1:   CGFloat
  var caption2:  CGFloat
}


public struct W3WFonts {
  public var applyDynamicTypeScaling = true
  
  lazy var sizes = self.getFontSizes()
  
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

  public init(font: UIFont?) {
    if let font = font {
      self.largeTitle = font.withSize(sizes.largeTitle)
      self.title1    = font.withSize(sizes.title1)
      self.title2   = font.withSize(sizes.title2)
      self.title3   = font.withSize(sizes.title3)
      self.headline  = font.withSize(sizes.headline)
      self.body       = font.withSize(sizes.body)
      self.callout     = font.withSize(sizes.callout)
      self.subheadline = font.withSize(sizes.subheadline)
      self.footnote   = font.withSize(sizes.footnote)
      self.caption1  = font.withSize(sizes.caption1)
      self.caption2 = font.withSize(sizes.caption2)
    }
  }
  
  public init(body: UIFont, largeTitle: UIFont? = nil, title1: UIFont? = nil, title2: UIFont? = nil, title3: UIFont? = nil, headline: UIFont? = nil, callout: UIFont? = nil, subheadline: UIFont? = nil, footnote: UIFont? = nil, caption1: UIFont? = nil, caption2: UIFont? = nil) {
    self.body       = body

    self.largeTitle = largeTitle ?? body
    self.title1    = title1 ?? body
    self.title2    = title2 ?? body
    self.title3     = title3 ?? body
    self.headline    = headline ?? body
    self.callout     = callout ?? body
    self.subheadline = subheadline ?? body
    self.footnote   = footnote ?? body
    self.caption1  = caption1 ?? body
    self.caption2 = caption2 ?? body
  }

  
  // MARK: withs (builder modifiers)
  
  
  public func with(body: UIFont)      -> W3WFonts { return W3WFonts(body: body, largeTitle: largeTitle, title1: title1, title2: title2, title3: title3, headline: headline, callout: callout, subheadline: subheadline, footnote: footnote, caption1: caption1, caption2: caption2) }
  public func with(largeTitle: UIFont) -> W3WFonts { return W3WFonts(body: body, largeTitle: largeTitle, title1: title1, title2: title2, title3: title3, headline: headline, callout: callout, subheadline: subheadline, footnote: footnote, caption1: caption1, caption2: caption2) }
  public func with(title1: UIFont)     -> W3WFonts { return W3WFonts(body: body, largeTitle: largeTitle, title1: title1, title2: title2, title3: title3, headline: headline, callout: callout, subheadline: subheadline, footnote: footnote, caption1: caption1, caption2: caption2) }
  public func with(title2: UIFont)    -> W3WFonts { return W3WFonts(body: body, largeTitle: largeTitle, title1: title1, title2: title2, title3: title3, headline: headline, callout: callout, subheadline: subheadline, footnote: footnote, caption1: caption1, caption2: caption2) }
  public func with(title3: UIFont)    -> W3WFonts { return W3WFonts(body: body, largeTitle: largeTitle, title1: title1, title2: title2, title3: title3, headline: headline, callout: callout, subheadline: subheadline, footnote: footnote, caption1: caption1, caption2: caption2) }
  public func with(headline: UIFont)  -> W3WFonts { return W3WFonts(body: body, largeTitle: largeTitle, title1: title1, title2: title2, title3: title3, headline: headline, callout: callout, subheadline: subheadline, footnote: footnote, caption1: caption1, caption2: caption2) }
  public func with(callout: UIFont)    -> W3WFonts { return W3WFonts(body: body, largeTitle: largeTitle, title1: title1, title2: title2, title3: title3, headline: headline, callout: callout, subheadline: subheadline, footnote: footnote, caption1: caption1, caption2: caption2) }
  public func with(subheadline: UIFont) -> W3WFonts { return W3WFonts(body: body, largeTitle: largeTitle, title1: title1, title2: title2, title3: title3, headline: headline, callout: callout, subheadline: subheadline, footnote: footnote, caption1: caption1, caption2: caption2) }
  public func with(footnote: UIFont)    -> W3WFonts { return W3WFonts(body: body, largeTitle: largeTitle, title1: title1, title2: title2, title3: title3, headline: headline, callout: callout, subheadline: subheadline, footnote: footnote, caption1: caption1, caption2: caption2) }
  public func with(caption1: UIFont)   -> W3WFonts { return W3WFonts(body: body, largeTitle: largeTitle, title1: title1, title2: title2, title3: title3, headline: headline, callout: callout, subheadline: subheadline, footnote: footnote, caption1: caption1, caption2: caption2) }
  public func with(caption2: UIFont)  -> W3WFonts { return W3WFonts(body: body, largeTitle: largeTitle, title1: title1, title2: title2, title3: title3, headline: headline, callout: callout, subheadline: subheadline, footnote: footnote, caption1: caption1, caption2: caption2) }

  
  func getFontSizes() -> W3WFontSizes {
    return W3WFontSizes(largeTitle: largeTitle.pointSize, title1: title1.pointSize, title2: title2.pointSize, title3: title3.pointSize, headline: headline.pointSize, body: body.pointSize, callout: callout.pointSize, subheadline: subheadline.pointSize, footnote: footnote.pointSize, caption1: caption1.pointSize, caption2: caption2.pointSize)
  }
  
  
  public subscript(style: W3WFontStyle) -> UIFont? {
    switch style {
      case .largeTitle:  return largeTitle
      case .title1:      return title1
      case .title2:      return title2
      case .title3:      return title3
      case .headline:    return headline
      case .body:        return body
      case .callout:     return callout
      case .subheadline: return subheadline
      case .footnote:    return footnote
      case .caption1:    return caption1
      case .caption2:    return caption2
      default:           return body
    }
  }
  
  
  
  func scale(font f:UIFont) -> UIFont {
    let fontScaleFactor = UIFontMetrics(forTextStyle: .body).scaledValue(for: 100.0) / 100.0
    return UIFont(descriptor: f.fontDescriptor, size: f.pointSize * fontScaleFactor)
  }
  
}
