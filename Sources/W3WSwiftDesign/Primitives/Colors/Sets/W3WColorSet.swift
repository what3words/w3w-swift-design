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


/// holds a foreground, background, highlight and secondary colour, sufficient for most interface items' colour needs
public class W3WColorSet: W3WBaseColors {
  public var tint: W3WColor?
  public var secondary: W3WColor?
  

  /// initialise with a foreground, background, highlight and secondary colour
  public init(foreground: W3WColor? = nil, background: W3WColor? = nil, tint: W3WColor? = nil, secondary: W3WColor? = nil) {
    self.tint = tint
    self.secondary = secondary
    super.init(foreground: foreground, background: background)
  }
  

  /// initialise with a foreground, background, highlight and secondary colour
  public init(colors: W3WBaseColors?) {
    super.init(foreground: colors?.foreground, background: colors?.background)
//    super.init(foreground: colors?.foreground ?? .text, background: colors?.background ?? .background)
//
    if let c = colors as? W3WColorSet {
      self.tint = c.tint
      self.secondary = c.secondary
//    } else {
//      self.tint = .slash
//      self.secondary = foreground
    }
  }
  

  /// get a color using a subsctipt: eg: darkSet[.background]
  public subscript(index: W3WColorSetNames) -> W3WColor {
    switch index {
      case .foreground:
        return foreground ?? .foreground
      case .secondary:
        return secondary ?? .secondary
      case .background:
        return background ?? .background
      case .tint:
        return tint ?? .tint
    }
  }
  
  
#if os(macOS)
  /// initialise with NSColor for foreground, background, highlight and secondary colour
  public init(nsForeground: NSColor? = nil, nsBackground: NSColor? = nil, nsHighlight: NSColor? = nil, nsSecondary: NSColor? = nil) {
    self.highlight  = W3WColor(nsColor: nsHighlight)
    self.secondary  = W3WColor(nsColor: nsSecondary)
    super.init(nsForeground: nsForeground, nsBackground: nsForeground)
  }
#endif
  
  
#if canImport(UIKit)
  /// initialise with UIColor for foreground, background, highlight and secondary colour
  public init(uiForeground: UIColor? = nil, uiBackground: UIColor? = nil, uiTint: UIColor? = nil, uiSecondary: UIColor? = nil) {
    self.tint       = (tint != nil) ? W3WColor(uiColor: uiTint!) : nil
    self.secondary  = (uiSecondary != nil) ? W3WColor(uiColor: uiSecondary!) : nil
    super.init(uiForeground: uiForeground, uiBackground: uiForeground)
  }
#endif
  
  /// return the same colorset the highlight color changed
  public func with(tint: W3WColor? = nil) -> W3WColorSet {
    return W3WColorSet(foreground: foreground, background: background, tint: tint, secondary: secondary)
  }
  
  
  /// return the same colorset the secondary color changed
  public func with(secondary: W3WColor? = nil) -> W3WColorSet {
    return W3WColorSet(foreground: foreground, background: background, tint: tint, secondary: secondary)
  }
  
  
}

