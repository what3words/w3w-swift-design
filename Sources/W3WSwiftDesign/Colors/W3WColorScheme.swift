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
public struct W3WColorScheme {
  
  // MARK: Vars
  
  public var main: W3WColorSet
  public var brand: W3WColor
  public var highlight: W3WTwoColor
  public var border: W3WColor
  public var separator: W3WColor
  public var shadow: W3WColor
  public var placeholder: W3WColor
  public var positive: W3WTwoColor
  public var negative: W3WTwoColor
  
  
  // MARK: Init

  /// initialise with a foreground, background, highlight and secondary colour
  public init(main: W3WColorSet, brand: W3WColor, highlight: W3WTwoColor, border: W3WColor, separator: W3WColor, shadow: W3WColor, placeholder: W3WColor, positive: W3WTwoColor, negative: W3WTwoColor) {
    self.main = main
    self.brand = brand
    self.highlight = highlight
    self.border = border
    self.separator = separator
    self.shadow = shadow
    self.placeholder = placeholder
    self.positive = positive
    self.negative = negative
  }
   
  
#if os(macOS)
  /// initialise with NSColor for foreground, background, highlight and secondary colour
  public init(main: W3WColorSet, nsBrand: NSColor, highlight: W3WTwoColor, nsSecondary: NSColor, nsShadow: NSColor, nsBorder: NSColor, nsSeparator: NSColor, nsPlaceholder: NSColor, positive: W3WTwoColor, negative: W3WTwoColor) {
    self.main         = main
    self.brand        = brand
    self.highlight    = highlight
    self.border       = W3WColor(nsColor: nsBorder)
    self.separator    = W3WColor(nsColor: nsSeparator)
    self.shadow       = W3WColor(nsColor: nsShadow)
    self.placeholder  = W3WColor(nsColor: nsPlaceholder)
    self.positive     = positive
    self.negative     = negative
  }
#endif
  
  
#if canImport(UIKit)
  /// initialise with UIColor for foreground, background, highlight and secondary colour
  public init(main: W3WColorSet, uiBrand: UIColor, highlight: W3WTwoColor, uiSecondary: UIColor, uiShadow: UIColor, uiBorder: UIColor, uiSeparator: UIColor, uiPlaceholder: UIColor, positive: W3WTwoColor, negative: W3WTwoColor) {
    self.main         = main
    self.brand        = W3WColor(uiColor: uiBrand)
    self.highlight    = highlight
    self.border       = W3WColor(uiColor: uiBorder)
    self.separator    = W3WColor(uiColor: uiSeparator)
    self.shadow       = W3WColor(uiColor: uiShadow)
    self.placeholder  = W3WColor(uiColor: uiPlaceholder)
    self.positive     = positive
    self.negative     = negative
  }
#endif
  
  // MARK: Accessors
  
  /// return the same colorset the foreground color changed
  public func with(main: W3WColorSet) -> W3WColorScheme {
    return W3WColorScheme(main: main, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, positive: positive, negative: negative)
  }
  
  
  /// return the same colorset the secondary color changed
  public func with(brand: W3WColor) -> W3WColorScheme {
    return W3WColorScheme(main: main, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, positive: positive, negative: negative)
  }

  
  /// return the same colorset the highlight color changed
  public func with(highlight: W3WTwoColor) -> W3WColorScheme {
    return W3WColorScheme(main: main, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, positive: positive, negative: negative)
  }
  

  /// return the same colorset the secondary color changed
  public func with(secondary: W3WColor) -> W3WColorScheme {
    return W3WColorScheme(main: main, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, positive: positive, negative: negative)
  }
  
  
  /// return the same colorset the secondary color changed
  public func with(shadow: W3WColor) -> W3WColorScheme {
    return W3WColorScheme(main: main, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, positive: positive, negative: negative)
  }
  
  
  /// return the same colorset the positive color changed
  public func with(border: W3WColor) -> W3WColorScheme {
    return W3WColorScheme(main: main, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, positive: positive, negative: negative)
  }
  
  
  /// return the same colorset the positive color changed
  public func with(separator: W3WColor) -> W3WColorScheme {
    return W3WColorScheme(main: main, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, positive: positive, negative: negative)
  }
  
  
  /// return the same colorset the positive color changed
  public func with(placeholder: W3WColor) -> W3WColorScheme {
    return W3WColorScheme(main: main, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, positive: positive, negative: negative)
  }
  

  /// return the same colorset the positive color changed
  public func with(positive: W3WTwoColor) -> W3WColorScheme {
    return W3WColorScheme(main: main, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, positive: positive, negative: negative)
  }
  
  
  /// return the same colorset the positive color changed
  public func with(negative: W3WTwoColor) -> W3WColorScheme {
    return W3WColorScheme(main: main, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, positive: positive, negative: negative)
  }
  

}

