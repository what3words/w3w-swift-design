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


/// holds a foreground, background (in main), highlight and secondary colour, and a positive/negitive meant for okay/cancel buttons etc, sufficient for most interface items' colour needs
public class W3WColorScheme: W3WColorSet {
  
  // MARK: Vars
  
  public var brand: W3WColor?
  public var highlight: W3WBaseColors?
  public var border: W3WColor?
  public var separator: W3WColor?
  public var shadow: W3WColor?
  public var placeholder: W3WColor?
  public var error: W3WBaseColors?

  
  @available(*, deprecated, message: "main is deprecated, use foreground, background, tint, secondary directly instead")
  var main: W3WColorSet {
    get {
      return self as W3WColorSet
    }
    set {
      self.foreground = newValue.foreground
      self.background = newValue.background
      self.tint       = newValue.tint
      self.secondary  = newValue.secondary
    }
  }
  
  
  // MARK: Init
  
  
  /// initialise with a foreground, background, highlight and secondary colour
  public init(foreground: W3WColor? = nil, background: W3WColor? = nil, tint: W3WColor? = nil, secondary: W3WColor? = nil, brand: W3WColor? = nil, highlight: W3WBaseColors? = nil, border: W3WColor? = nil, separator: W3WColor? = nil, shadow: W3WColor? = nil, placeholder: W3WColor? = nil, error: W3WBaseColors? = nil) {
    self.brand = brand
    self.highlight = highlight
    self.border = border
    self.separator = separator
    self.shadow = shadow
    self.placeholder = placeholder
    self.error = error
    //self.positive = positive
    //self.negative = negative
    
    super.init(foreground: foreground, background: background, tint: tint, secondary: secondary)
  }

  
  /// initialise with a foreground, background, highlight and secondary colour
  public init(colors: W3WColorSet?) {
    //super.init(foreground: colors?.foreground ?? .text, background: colors?.background ?? .background, tint: colors?.tint, secondary: colors?.secondary)
    super.init(foreground: colors?.foreground, background: colors?.background, tint: colors?.tint, secondary: colors?.secondary)
  }

  
  /// initialise with a foreground, background, highlight and secondary colour
  public init(base: W3WColorSet, brand: W3WColor, highlight: W3WBaseColors, border: W3WColor, separator: W3WColor, shadow: W3WColor, placeholder: W3WColor, error: W3WBaseColors) {
    self.brand = brand
    self.highlight = highlight
    self.border = border
    self.separator = separator
    self.shadow = shadow
    self.placeholder = placeholder
    self.error = error
    //self.positive = positive
    //self.negative = negative

    super.init(foreground: base.foreground, background: base.background, tint: base.tint, secondary: base.secondary)
  }
   
  
#if os(macOS)
  /// initialise with NSColor for foreground, background, highlight and secondary colour
  public init(foreground: NSColor? = nil, background: NSColor? = nil, tint: NSColor? = nil, secondary: NSColor? = nil, nsBrand: NSColor? = nil, highlight: W3WBaseColors? = nil, nsSecondary: NSColor? = nil, nsShadow: NSColor? = nil, nsBorder: NSColor? = nil, nsSeparator: NSColor? = nil, nsPlaceholder: NSColor? = nil, nsError: W3WBaseColors? = nil) {
    self.brand        = brand
    self.highlight    = highlight
    self.border       = W3WColor(nsColor: nsBorder)
    self.separator    = W3WColor(nsColor: nsSeparator)
    self.shadow       = W3WColor(nsColor: nsShadow)
    self.placeholder  = W3WColor(nsColor: nsPlaceholder)
    self.error        = error
    //self.positive     = positive
    //self.negative     = negative
    
    super.init(nsForeground: foreground, nsBackground: background, nsTint: tint, nsSecondary: secondary)
  }

  
  /// initialise with NSColor for foreground, background, highlight and secondary colour
  @available(*, deprecated, message: "main is deprecated, replace with: foreground, background, tint, secondary directly instead")
  public init(main: W3WColorSet, nsBrand: NSColor, highlight: W3WBaseColors, nsSecondary: NSColor, nsShadow: NSColor, nsBorder: NSColor, nsSeparator: NSColor, nsPlaceholder: NSColor, error: W3WBaseColors) {
    self.brand        = brand
    self.highlight    = highlight
    self.border       = W3WColor(nsColor: nsBorder)
    self.separator    = W3WColor(nsColor: nsSeparator)
    self.shadow       = W3WColor(nsColor: nsShadow)
    self.placeholder  = W3WColor(nsColor: nsPlaceholder)
    self.error        = error
    //self.positive     = positive
    //self.negative     = negative

    super.init(foreground: main.foreground, background: main.background, tint: main.tint, secondary: main.secondary)
  }
#endif
  
  
#if canImport(UIKit)
  /// initialise with UIColor for foreground, background, highlight and secondary colour
  public init(foreground: UIColor? = nil, background: UIColor? = nil, tint: UIColor? = nil, secondary: UIColor? = nil, uiBrand: UIColor? = nil, highlight: W3WBaseColors? = nil, uiSecondary: UIColor? = nil, uiShadow: UIColor? = nil, uiBorder: UIColor? = nil, uiSeparator: UIColor? = nil, uiPlaceholder: UIColor? = nil, error: W3WBaseColors? = nil) {
    self.brand        = (uiBrand != nil) ? W3WColor(uiColor: uiBrand!) : nil
    self.highlight    = highlight
    self.border       = (uiBorder != nil) ? W3WColor(uiColor: uiBorder!) : nil
    self.separator    = (uiSeparator != nil) ? W3WColor(uiColor: uiSeparator!) : nil
    self.shadow       = (uiShadow != nil) ? W3WColor(uiColor: uiShadow!) : nil
    self.placeholder  = (uiPlaceholder != nil) ? W3WColor(uiColor: uiPlaceholder!) : nil
    self.error        = error
    //self.positive     = positive
    //self.negative     = negative
    
    super.init(uiForeground: foreground, uiBackground: background, uiTint: tint, uiSecondary: secondary)
  }

  
  /// initialise with UIColor for foreground, background, highlight and secondary colour
  public init(main: W3WColorSet, uiBrand: UIColor, highlight: W3WBaseColors, uiSecondary: UIColor, uiShadow: UIColor, uiBorder: UIColor, uiSeparator: UIColor, uiPlaceholder: UIColor, error: W3WBaseColors) {
    self.brand        = W3WColor(uiColor: uiBrand)
    self.highlight    = highlight
    self.border       = W3WColor(uiColor: uiBorder)
    self.separator    = W3WColor(uiColor: uiSeparator)
    self.shadow       = W3WColor(uiColor: uiShadow)
    self.placeholder  = W3WColor(uiColor: uiPlaceholder)
    self.error        = error
    //self.positive     = positive
    //self.negative     = negative

    super.init(foreground: main.foreground, background: main.background, tint: main.tint, secondary: main.secondary)
  }
#endif
  
  // MARK: Accessors
  
  /// return the same colorset the foreground color changed
  public func with(main: W3WColorSet? = nil) -> W3WColorScheme {
    return W3WColorScheme(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, error: error)
  }
  
  
  /// return the same colorset the secondary color changed
  public func with(brand: W3WColor? = nil) -> W3WColorScheme {
    return W3WColorScheme(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, error: error)
  }

  
  /// return the same colorset the highlight color changed
  public func with(highlight: W3WBaseColors? = nil) -> W3WColorScheme {
    return W3WColorScheme(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, error: error)
  }
  

  /// return the same colorset the secondary color changed
//  public func with(secondary: W3WColor) -> W3WColorScheme {
//    return W3WColorScheme(main: main, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder)
//  }
  
  
  /// return the same colorset the secondary color changed
  public func with(shadow: W3WColor? = nil) -> W3WColorScheme {
    return W3WColorScheme(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, error: error)
  }
  
  
  /// return the same colorset the positive color changed
  public func with(border: W3WColor? = nil) -> W3WColorScheme {
    return W3WColorScheme(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, error: error)
  }
  
  
  /// return the same colorset the positive color changed
  public func with(separator: W3WColor? = nil) -> W3WColorScheme {
    return W3WColorScheme(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, error: error)
  }
  
  
  /// return the same colorset the positive color changed
  public func with(placeholder: W3WColor? = nil) -> W3WColorScheme {
    return W3WColorScheme(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, error: error)
  }
  

  /// return the same colorset the positive color changed
  public func with(error: W3WBaseColors? = nil) -> W3WColorScheme {
    return W3WColorScheme(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, error: error)
  }
  
  
//  /// return the same colorset the positive color changed
//  public func with(negative: W3WBaseColors) -> W3WColorScheme {
//    return W3WColorScheme(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, error: error)
//  }
  

}

