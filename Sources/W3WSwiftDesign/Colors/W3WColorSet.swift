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


/// used to indicate colors in a W3WColorSet as a parameter
public enum W3WColorSetNames {
  case foreground
  case secondary
  case background
  case highlight
}


/// holds a foreground, background, highlight and secondary colour, sufficient for most interface items' colour needs
public struct W3WColorSet {
  public var foreground: W3WColor
  public var background: W3WColor
  public var highlight: W3WColor
  public var secondary: W3WColor
  

  /// initialise with a foreground, background, highlight and secondary colour
  public init(foreground: W3WColor, background: W3WColor, highlight: W3WColor, secondary: W3WColor) {
    self.foreground = foreground
    self.background = background
    self.highlight = highlight
    self.secondary = secondary
  }
  

  /// get a color using a subsctipt: eg: darkSet[.background]
  public subscript(index: W3WColorSetNames) -> W3WColor {
    switch index {
      case .foreground:
        return foreground
      case .secondary:
        return secondary
      case .background:
        return background
      case .highlight:
        return highlight
    }
  }
  
  
#if os(macOS)
  /// initialise with NSColor for foreground, background, highlight and secondary colour
  public init(nsForeground: NSColor, nsBackground: NSColor, nsHighlight: NSColor, nsSecondary: NSColor) {
    self.foreground = W3WColor(nsColor: nsForeground)
    self.background = W3WColor(nsColor: nsBackground)
    self.highlight  = W3WColor(nsColor: nsHighlight)
    self.secondary  = W3WColor(nsColor: nsSecondary)
  }
#endif
  
  
#if canImport(UIKit)
  /// initialise with UIColor for foreground, background, highlight and secondary colour
  public init(uiForeground: UIColor, uiBackground: UIColor, uiHighlight: UIColor, uiSecondary: UIColor) {
    self.foreground = W3WColor(uiColor: uiForeground)
    self.background = W3WColor(uiColor: uiBackground)
    self.highlight  = W3WColor(uiColor: uiHighlight)
    self.secondary  = W3WColor(uiColor: uiSecondary)
  }
#endif
  
  /// return the same colorset the foreground color changed
  public func with(foreground: W3WColor) -> W3WColorSet {
    return W3WColorSet(foreground: foreground, background: background, highlight: highlight, secondary: secondary)
  }
  
  
  /// return the same colorset the background color changed
  public func with(background: W3WColor) -> W3WColorSet {
    return W3WColorSet(foreground: foreground, background: background, highlight: highlight, secondary: secondary)
  }
  
  
  /// return the same colorset the highlight color changed
  public func with(highlight: W3WColor) -> W3WColorSet {
    return W3WColorSet(foreground: foreground, background: background, highlight: highlight, secondary: secondary)
  }
  
  
  /// return the same colorset the secondary color changed
  public func with(secondary: W3WColor) -> W3WColorSet {
    return W3WColorSet(foreground: foreground, background: background, highlight: highlight, secondary: secondary)
  }
  
  
  // MARK: Preset colour sets
  

  static public let blackGrayRed     = W3WColorSet(foreground: .black,    background: .white,        highlight: .red,     secondary: .secondaryDarkGray)
  static public let darkBlueGrayRed  = W3WColorSet(foreground: .darkBlue, background: .white,          highlight: .red,     secondary: .secondaryDarkGray)
  static public let lightDarkMode    = W3WColorSet(foreground: .text,     background: .background,       highlight: .red,     secondary: .secondaryDarkGray)
  static public let blackWhitePowder = W3WColorSet(foreground: .black,    background: .powderBlue,         highlight: .black,   secondary: .secondaryGray)
  static public let whiteGrayRed     = W3WColorSet(foreground: .white,    background: .offDarkGrey,          highlight: .red,     secondary: .secondaryGray)
  static public let blackWhiteBlue   = W3WColorSet(foreground: .black,    background: .secondarySystemBackground, highlight: .systemBlue, secondary: .secondaryGray)
  static public let blackWhite       = W3WColorSet(foreground: .black,    background: .white,                      highlight: .black,       secondary: .black)
  static public let halo             = W3WColorSet(foreground: .red.with(alpha: 0.15), background: .red.with(alpha: 0.1), highlight: .red.with(alpha: 0.3), secondary: .red.with(alpha: 0.15))

}

