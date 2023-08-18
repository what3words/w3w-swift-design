//
//  File.swift
//  
//
//  Created by Dave Duprey on 17/03/2023.
//

import UIKit



public class W3WTheme: CustomDebugStringConvertible, CustomStringConvertible {
    
  /// weakly head reference to the view to apply design to
  //public weak var owner: UIView?

  /// colours to use
  public var colors: W3WColors?

  /// styles to apply
  public var style: W3WStyles?

  
  /// Init

  
  public init(colors: W3WColors? = nil, style: W3WStyles? = nil) {
    self.colors = colors
    self.style = style
  }
  
  
  public init(theme: W3WTheme?) {
    self.colors = theme?.colors
    self.style = theme?.style
  }
  
  
  public func refactored(from: W3WSetTypes) -> W3WTheme {
    return W3WTheme(colors: colors?.refactored(from: from), style: style?.refactored(from: from))
  }

  
  public func update(view: UIView) {
    style?.update(view: view)
    colors?.update(view: view)
  }

  
  // MARK: Accessors
  
  
  public subscript(set: W3WSetTypes) -> W3WTheme {
    let c = (colors == nil) ? nil : W3WColors(base: colors![set])
    let s = (style == nil)  ? nil : W3WStyles(base: style![set])
    
    return W3WTheme(colors: c, style: s)
  }
  
  
  public subscript(set: String) -> W3WTheme {
    let c = (colors == nil) ? nil : W3WColors(base: colors![.custom(set)])
    let s = (style == nil)  ? nil : W3WStyles(base: style![.custom(set)])
    
    return W3WTheme(colors: c, style: s)
  }
  
  
  // MARK: Withs (builders)

  public func with(colors: W3WColors?) -> W3WTheme { return W3WTheme(colors: colors, style: style) }
  public func with(colors: W3WColorSet) -> W3WTheme { return W3WTheme(colors: W3WColors(base: colors), style: style) }
  public func with(style: W3WStyles?) -> W3WTheme   { return W3WTheme(colors: colors, style: style) }
  
  public func with(foreground: W3WColor) -> W3WTheme { return self.with(colors: colors?.with(foreground: foreground)) }
  public func with(background: W3WColor) -> W3WTheme { return self.with(colors: colors?.with(background: background)) }
  public func with(tint: W3WColor)        -> W3WTheme { return self.with(colors: colors?.with(tint: tint)) }
  public func with(secondary: W3WColor)     -> W3WTheme { return self.with(colors: colors?.with(secondary: secondary)) }
  public func with(brand: W3WColor)          -> W3WTheme { return self.with(colors: colors?.with(brand: brand)) }
  public func with(highlight: W3WBasicColors) -> W3WTheme { return self.with(colors: colors?.with(highlight: highlight)) }
  public func with(border: W3WColor)          -> W3WTheme { return self.with(colors: colors?.with(border: border)) }
  public func with(separator: W3WColor)       -> W3WTheme { return self.with(colors: colors?.with(separator: separator)) }
  public func with(shadow: W3WColor)         -> W3WTheme { return self.with(colors: colors?.with(shadow: shadow)) }
  public func with(placeholder: W3WColor)   -> W3WTheme { return self.with(colors: colors?.with(placeholder: placeholder)) }
  public func with(error: W3WBasicColors)   -> W3WTheme { return self.with(colors: colors?.with(error: error)) }

  public func with(buttons: W3WColorSet?)     -> W3WTheme { return self.with(colors: colors?.with(buttons: buttons)) }
  public func with(icons: W3WColorSet?)        -> W3WTheme { return self.with(colors: colors?.with(icons: icons)) }

  public func with(border: W3WLineThickness)  -> W3WTheme { return self.with(style: style?.with(border: border)) }
  public func with(shadow: W3WShadow)          -> W3WTheme { return self.with(style: style?.with(shadow: shadow)) }
  public func with(fonts: W3WFonts)             -> W3WTheme { return self.with(style: style?.with(fonts: fonts)) }
  public func with(padding: W3WPadding)          -> W3WTheme { return self.with(style: style?.with(padding: padding)) }
  public func with(cornerRadius: W3WCornerRadius) -> W3WTheme { return self.with(style: style?.with(cornerRadius: cornerRadius)) }
  public func with(rowHeight: W3WRowHeight)       -> W3WTheme { return self.with(style: style?.with(rowHeight: rowHeight)) }

  
  public var description: String {
    return debugDescription
  }
  
  
  public var debugDescription: String {
    var retvals = [String]()
    
    if let d = style?.description {
      retvals.append(d)
    }
    
    if let c = colors?.description {
      retvals.append(c)
    }
    
    return retvals.joined(separator: "\n")
  }

  
}




//textField.adjustsFontForContentSizeCategory = true
//textField.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
//      if let font = style?.font {
//        label.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font)
//        //label.adjustsFontForContentSizeCategory = true
//      }
////      label.font = .preferredFont(forTextStyle: .body)
//
//    if let margin = style?.margin?.value {
//      owner?.edgeInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
//    }

//    if let padding = style?.padding?.value {
//      owner?.bounds = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
//    }



//  updateStyle(view: view)
//  updateColors(view: view)
//
//
//  func updateStyle(view: UIView) {
//    style?.update(view: view)
//  }
//
//
//  func updateColors(view: UIView) {
//    colors?.update(view: view)
//  }


/// if the colors are a W3WColorSet, then return it as that otherwise nil
//  public var colorSet: W3WColorSet? {
//    return colors as? W3WColorSet
//  }

/// if the colors are a W3WColorScheme, then return it as that otherwise nil
//  public var colorScheme: W3WColorScheme? {
//    return colors as? W3WColorScheme
//  }


