//
//  File.swift
//  
//
//  Created by Dave Duprey on 04/05/2022.
//

import Foundation

#if canImport(UIKit)
import UIKit
#endif

#if canImport(AppKit)
import AppKit
#endif


public struct W3WColorSet {
  public var foreground: W3WColor
  public var background: W3WColor
  public var highlight: W3WColor
  public var secondary: W3WColor
  
  public init(foreground: W3WColor, background: W3WColor, highlight: W3WColor, secondary: W3WColor) {
    self.foreground = foreground
    self.background = background
    self.highlight = highlight
    self.secondary = secondary
  }
  
#if canImport(AppKit)
  public init(nsForeground: NSColor, nsBackground: NSColor, nsHighlight: NSColor, nsSecondary: NSColor) {
    self.foreground = W3WColor(nsColor: nsForeground)
    self.background = W3WColor(nsColor: nsBackground)
    self.highlight  = W3WColor(nsColor: nsHighlight)
    self.secondary  = W3WColor(nsColor: nsSecondary)
  }
#endif
  
#if canImport(UIKit)
  public init(uiForeground: UIColor, uiBackground: UIColor, uiHighlight: UIColor, uiSecondary: UIColor) {
    self.foreground = W3WColor(uiColor: uiForeground)
    self.background = W3WColor(uiColor: uiBackground)
    self.highlight  = W3WColor(uiColor: uiHighlight)
    self.secondary  = W3WColor(uiColor: uiSecondary)
  }
#endif
  
  public func with(foreground: W3WColor) -> W3WColorSet {
    return W3WColorSet(foreground: foreground, background: background, highlight: highlight, secondary: secondary)
  }
  
  public func with(background: W3WColor) -> W3WColorSet {
    return W3WColorSet(foreground: foreground, background: background, highlight: highlight, secondary: secondary)
  }
  
  public func with(highlight: W3WColor) -> W3WColorSet {
    return W3WColorSet(foreground: foreground, background: background, highlight: highlight, secondary: secondary)
  }
  
  public func with(secondary: W3WColor) -> W3WColorSet {
    return W3WColorSet(foreground: foreground, background: background, highlight: highlight, secondary: secondary)
  }
  

  static public let whiteGrayRed = W3WColorSet(foreground: .white, background: .offDarkGrey, highlight: .red, secondary: .secondaryGray)

}

