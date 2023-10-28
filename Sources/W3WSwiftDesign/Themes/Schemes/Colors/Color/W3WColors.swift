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
public struct W3WColors {
  
  // MARK: Vars
  
  
  // autosuggest
  public var foreground: W3WColor?
  public var background: W3WColor?
  public var tint: W3WColor?
  public var secondary: W3WColor?
  public var brand: W3WColor?
  public var highlight: W3WBasicColors?
  public var border: W3WColor?
  public var separator: W3WColor?
  public var shadow: W3WColor?
  public var placeholder: W3WColor?
  public var success: W3WBasicColors?
  public var error: W3WBasicColors?
  public var header: W3WBasicColors?
  public var line: W3WColor?
  
  
  // MARK: Init
  
  
  /// initialise with a foreground, background, highlight and secondary colour
  public init(foreground: W3WColor? = nil, background: W3WColor? = nil, tint: W3WColor? = nil, secondary: W3WColor? = nil, brand: W3WColor? = nil, highlight: W3WBasicColors? = nil, border: W3WColor? = nil, separator: W3WColor? = nil, shadow: W3WColor? = nil, placeholder: W3WColor? = nil, success: W3WBasicColors? = nil, error: W3WBasicColors? = nil, header: W3WBasicColors? = nil, line: W3WColor? = nil) {
    self.foreground   = foreground
    self.background  = background
    self.tint       = tint
    self.secondary = secondary
    self.brand     = brand
    self.highlight = highlight
    self.border    = border
    self.separator = separator
    self.shadow     = shadow
    self.placeholder = placeholder
    self.success     = success
    self.error      = error
    self.header    = header
    self.line     = line
  }
  
  
  /// initialise with nothing
  public init() {
  }
  
  
  /// initialise with a foreground, background, highlight and secondary colour
  public init(colors: W3WBasicColors?) {
    self.foreground = colors?.foreground
    self.background = colors?.background
  }
  
  
  /// initialise with a foreground, background, highlight and secondary colour
  public init(colors: W3WColors?) {
    self.foreground   = colors?.foreground
    self.background  = colors?.background
    self.tint        = colors?.tint
    self.secondary   = colors?.secondary
    self.brand       = colors?.brand
    self.highlight   = colors?.highlight
    self.border      = colors?.border
    self.separator   = colors?.separator
    self.shadow      = colors?.shadow
    self.placeholder = colors?.placeholder
    self.success     = colors?.success
    self.error      = colors?.error
    self.header    = colors?.header
    self.line     = colors?.line
  }
  
  
  //  /// initialise with a foreground, background, highlight and secondary colour
  //  public init(base: W3WColorSet, brand: W3WColor, highlight: W3WBaseColors, border: W3WColor, separator: W3WColor, shadow: W3WColor, placeholder: W3WColor, error: W3WBaseColors) {
  //    self.foreground = foreground
  //    self.background = background
  //    self.brand = brand
  //    self.highlight = highlight
  //    self.border = border
  //    self.separator = separator
  //    self.shadow = shadow
  //    self.placeholder = placeholder
  //    self.error = error
  //
  //    super.init(foreground: base.foreground, background: base.background)
  //  }
  
  
  //#if os(macOS)
  //  /// initialise with NSColor for foreground, background, highlight and secondary colour
  //  public init(foreground: NSColor? = nil, background: NSColor? = nil, tint: NSColor? = nil, secondary: NSColor? = nil, nsBrand: NSColor? = nil, highlight: W3WBaseColors? = nil, nsSecondary: NSColor? = nil, nsShadow: NSColor? = nil, nsBorder: NSColor? = nil, nsSeparator: NSColor? = nil, nsPlaceholder: NSColor? = nil, nsError: W3WBaseColors? = nil, header: W3WBasicColors? = nil, line: NSColor? = nil) {
  //    self.foreground   = foreground
  //    self.background  = background
  //    self.tint       = tint
  //    self.secondary = secondary
  //    self.brand     = brand
  //    self.highlight = highlight
  //    self.border    = border
  //    self.separator = separator
  //    self.shadow     = shadow
  //    self.placeholder = placeholder
  //    self.error        = error
  //    self.header        = header
  //    self.line           = line
  //  }
  //
  //
  //  /// initialise with NSColor for foreground, background, highlight and secondary colour
  //  @available(*, deprecated, message: "main is deprecated, replace with: foreground, background, tint, secondary directly instead")
  //  public init(nsForeground: NSColor, nsBackground: NSColor, nsTint: NSColor, nsBrand: NSColor, highlight: W3WBaseColors, nsSecondary: NSColor, nsShadow: NSColor, nsBorder: NSColor, nsSeparator: NSColor, nsPlaceholder: NSColor, error: W3WBaseColors, header: W3WBasicColors? = nil) {
  //    self.foreground   = nsForeground
  //    self.background  = nsBackground
  //    self.tint       = nsTint
  //    self.secondary = nsSecondary
  //    self.brand     = nsBrand
  //    self.highlight = highlight
  //    self.border    = nsBorder
  //    self.separator = nsSeparator
  //    self.shadow     = nsShadow
  //    self.placeholder = nsPlaceholder
  //    self.error        = nsError
  //    self.header        = header
  //  }
  //#endif
  
  
#if canImport(UIKit)
  
  /// initialise with a foreground, background, highlight and secondary colour
  public init(uiForeground: UIColor? = nil, uiBackground: UIColor? = nil, uiTint: UIColor? = nil, uiSecondary: UIColor? = nil, uiBrand: UIColor? = nil, highlight: W3WBasicColors? = nil, uiBorder: UIColor? = nil, uiSeparator: UIColor? = nil, uiShadow: UIColor? = nil, uiPlaceholder: UIColor? = nil, success: W3WBasicColors? = nil, error: W3WBasicColors? = nil, header: W3WBasicColors? = nil, uiLine: UIColor? = nil) {
    self.foreground   = (uiForeground != nil)   ? W3WColor(uiColor: uiForeground!)  : nil
    self.background   = (uiBackground != nil)   ? W3WColor(uiColor: uiBackground!)  : nil
    self.tint         = (uiTint != nil)         ? W3WColor(uiColor: uiTint!)        : nil
    self.secondary    = (uiSecondary != nil)    ? W3WColor(uiColor: uiSecondary!)   : nil
    self.brand        = (uiBrand != nil)        ? W3WColor(uiColor: uiBrand!)       : nil
    self.highlight    = highlight
    self.border       = (uiBorder != nil)       ? W3WColor(uiColor: uiBorder!)      : nil
    self.separator    = (uiSeparator != nil)    ? W3WColor(uiColor: uiSeparator!)   : nil
    self.shadow       = (uiShadow != nil)       ? W3WColor(uiColor: uiShadow!)      : nil
    self.placeholder  = (uiPlaceholder != nil)  ? W3WColor(uiColor: uiPlaceholder!) : nil
    self.success      = success
    self.error        = error
    self.header       = header
    self.line         = (uiLine != nil)         ? W3WColor(uiColor: uiLine!) : nil
  }
  
  
  //  /// initialise with UIColor for foreground, background, highlight and secondary colour
  //  public init(foreground: UIColor? = nil, background: UIColor? = nil, tint: UIColor? = nil, secondary: UIColor? = nil, uiBrand: UIColor? = nil, highlight: W3WBaseColors? = nil, uiSecondary: UIColor? = nil, uiShadow: UIColor? = nil, uiBorder: UIColor? = nil, uiSeparator: UIColor? = nil, uiPlaceholder: UIColor? = nil, error: W3WBaseColors? = nil) {
  //    self.brand        = (uiBrand != nil) ? W3WColor(uiColor: uiBrand!) : nil
  //    self.highlight    = highlight
  //    self.border       = (uiBorder != nil) ? W3WColor(uiColor: uiBorder!) : nil
  //    self.separator    = (uiSeparator != nil) ? W3WColor(uiColor: uiSeparator!) : nil
  //    self.shadow       = (uiShadow != nil) ? W3WColor(uiColor: uiShadow!) : nil
  //    self.placeholder  = (uiPlaceholder != nil) ? W3WColor(uiColor: uiPlaceholder!) : nil
  //    self.error        = error
  //
  //    //super.init(uiForeground: foreground, uiBackground: background)
  //  }
  //
  //
  //  /// initialise with UIColor for foreground, background, highlight and secondary colour
  //  public init(main: W3WColorSet, uiBrand: UIColor, highlight: W3WBaseColors, uiSecondary: UIColor, uiShadow: UIColor, uiBorder: UIColor, uiSeparator: UIColor, uiPlaceholder: UIColor, error: W3WBaseColors) {
  //    self.brand        = W3WColor(uiColor: uiBrand)
  //    self.highlight    = highlight
  //    self.border       = W3WColor(uiColor: uiBorder)
  //    self.separator    = W3WColor(uiColor: uiSeparator)
  //    self.shadow       = W3WColor(uiColor: uiShadow)
  //    self.placeholder  = W3WColor(uiColor: uiPlaceholder)
  //    self.error        = error
  //
  //    super.init(foreground: main.foreground, background: main.background)
  //  }
#endif
  
  
  // MARK: Accessors
  
  
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
  
  
  /// return the same colorset the foreground color changed
  public func with(foreground: W3WColor? = nil) -> W3WColors {
    return W3WColors(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, success: success, error: error, header: header, line: line)
  }
  
  
  /// return the same colorset the background color changed
  public func with(background: W3WColor? = nil) -> W3WColors {
    return W3WColors(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, success: success, error: error, header: header, line: line)
  }
  
  
  /// return the same colorset the secondary color changed
  public func with(tint: W3WColor? = nil) -> W3WColors {
    return W3WColors(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, success: success, error: error, header: header, line: line)
  }
  
  
  /// return the same colorset the secondary color changed
  public func with(secondary: W3WColor? = nil) -> W3WColors {
    return W3WColors(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, success: success, error: error, header: header, line: line)
  }
  
  
  /// return the same colorset the secondary color changed
  public func with(brand: W3WColor? = nil) -> W3WColors {
    return W3WColors(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, success: success, error: error, header: header, line: line)
  }
  
  
  /// return the same colorset the highlight color changed
  public func with(highlight: W3WBasicColors? = nil) -> W3WColors {
    return W3WColors(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, success: success, error: error, header: header, line: line)
  }
  
  
  /// return the same colorset the positive color changed
  public func with(border: W3WColor? = nil) -> W3WColors {
    return W3WColors(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, success: success, error: error, header: header, line: line)
  }
  
  
  /// return the same colorset the positive color changed
  public func with(separator: W3WColor? = nil) -> W3WColors {
    return W3WColors(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, success: success, error: error, header: header, line: line)
  }
  
  
  /// return the same colorset the secondary color changed
  public func with(shadow: W3WColor? = nil) -> W3WColors {
    return W3WColors(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, success: success, error: error, header: header, line: line)
  }
  
  
  /// return the same colorset the positive color changed
  public func with(placeholder: W3WColor? = nil) -> W3WColors {
    return W3WColors(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, success: success, error: error, header: header, line: line)
  }
  
  
  /// return the same colorset the positive color changed
  public func with(success: W3WBasicColors? = nil) -> W3WColors {
    return W3WColors(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, success: success, error: error, header: header, line: line)
  }
  
  
  /// return the same colorset the positive color changed
  public func with(error: W3WBasicColors? = nil) -> W3WColors {
    return W3WColors(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, success: success, error: error, header: header, line: line)
  }
  
  
  /// return the same colorset the positive color changed
  public func with(header: W3WBasicColors? = nil) -> W3WColors {
    return W3WColors(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, success: success, error: error, header: header, line: line)
  }
  
  
  /// return the same colorset the positive color changed
  public func with(line: W3WColor? = nil) -> W3WColors {
    return W3WColors(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, success: success, error: error, header: header, line: line)
  }
  
  
  @available(*, deprecated, renamed: "tint")
  public func findTint() -> W3WColor? {
    return tint ?? foreground
  }
  
}

  
//  // MARK: Colorisers
//
//
//  func update(basics view: UIView?) {
//    if let c = background {
//      view?.backgroundColor = c.current.uiColor
//    }
//
//    if let t = tint {
//      view?.tintColor = t.current.uiColor
//    }
//
//    if let b = border {
//      view?.layer.borderColor = b.current.cgColor
//    }
//
//    if let s = shadow {
//      view?.layer.shadowColor = s.current.cgColor
//    }
//  }
//
//
//  func update(label: UILabel) {
//    if let text = foreground {
//      if label.attributedText == nil {
//        label.textColor = text.current.uiColor
//      }
//    }
//    if let back = background {
//      label.backgroundColor = back.current.uiColor
//    }
//  }
//
//
//  func update(textField: UITextField) {
//    if let text = foreground {
//      textField.textColor = text.current.uiColor
//    }
//    if let background = background {
//      textField.backgroundColor = background.current.uiColor
//    }
//  }
//
//
//  func update(searchBar: UISearchBar) {
//    if let background = background {
//      if #available(iOS 13.0, *) {
//        searchBar.searchTextField.backgroundColor = background.current.uiColor
//      } else {
//        searchBar.backgroundColor = background.current.uiColor
//      }
//    }
//  }
//
//
//  func update(cell: UITableViewCell) {
//    if let text = foreground {
//      cell.textLabel?.textColor = text.current.uiColor
//    }
//
//    if let subtext = secondary {
//      cell.detailTextLabel?.textColor = subtext.current.uiColor
//    }
//
//    if let h = highlight?.foreground {
//      cell.textLabel?.highlightedTextColor = h.current.uiColor
//      cell.detailTextLabel?.highlightedTextColor = h.current.uiColor
//    }
//
//    if let hb = highlight?.background {
//      let selectedBackground = UIView(frame: cell.bounds)
//      selectedBackground.backgroundColor = hb.current.uiColor
//      cell.selectedBackgroundView = selectedBackground
//    }
//  }
//
//
//  // TODO: Implement update(icon)
//  func update(icon: W3WIconView) {
//    icon.updateImage()
//  }
//
//
//  func update(button: UIButton) {
//    if let text = foreground {
//      button.setTitleColor(text.current.uiColor, for: .normal)
//
//      if let b = button as? W3WButton {
//        //b.setIconColor(text.current.uiColor)
//        if let i = b.imageView as? W3WIconView {
//          update(icon: i)
//        } else {
//          button.imageView?.tintColor = text.current.uiColor
//        }
//      }
//    }
//
//    if let s = secondary {
//      button.setTitleColor(s.current.uiColor, for: .highlighted)
//    }
//
//    if let f = background {
//      button.backgroundColor = f.current.uiColor
//    }
//  }
//

  
  // MARK: Conversions
  
  
//  public func asColorSet() -> W3WColorSet {
//    if let colorSet = self as? W3WColorSet {
//      return colorSet
//    } else {
//      return W3WColorSet(colors: self)
//    }
//  }
  
//
//  public func asColorCollection() -> W3WColorCollection {
//    if let colorCollection = self as? W3WColorCollection {
//      return colorCollection
//    } else {
//      return W3WColorCollection(base: self)
//    }
//  }
//
//
//

