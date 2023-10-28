//
//  File.swift
//  
//
//  Created by Dave Duprey on 17/03/2023.
//

import UIKit



public class W3WTheme: CustomDebugStringConvertible, CustomStringConvertible {
    
  // this holds a dictionary of schemes.  schemes contain colours and styles for a particular type of element such as textFeilds, or buttons, etc
  public var schemes = [W3WSetTypes : W3WScheme]()

  
  /// Init

  
  /// initialise with a foreground, background, highlight and secondary colour
  public init(base: W3WScheme, buttons: W3WScheme? = nil, textFields: W3WScheme? = nil, labels: W3WScheme? = nil, maps: W3WScheme? = nil, cells: W3WScheme? = nil, icons: W3WScheme? = nil, voice: W3WScheme? = nil, ocr: W3WScheme? = nil) {
    schemes[.base] = base
    add(type: .buttons,    scheme: buttons)
    add(type: .textFields, scheme: textFields)
    add(type: .labels,    scheme: labels)
    add(type: .maps,     scheme: maps)
    add(type: .cells,   scheme: cells)
    add(type: .icons,  scheme: icons)
    add(type: .voice, scheme: voice)
    add(type: .ocr,  scheme: ocr)
  }

  
  public init() {
    schemes[.base] = W3WScheme()
  }
  
  
  public init(theme: W3WTheme?) {
    if let s = theme?.schemes {
      self.schemes = s
    }
    //self.colors = theme?.colors
    //self.styles = theme?.styles
  }
  

  /// copy a color set from one set to another
  public func copy(from: W3WSetTypes, to: W3WSetTypes) -> W3WTheme {
    let newTheme = W3WTheme(theme: self)
    newTheme.schemes[to] = schemes[from]
    return newTheme
  }

  
  func add(type: W3WSetTypes, scheme: W3WScheme?) {
    if let s = scheme {
      schemes[type] = s
    }
  }
  
  
  @available(*, deprecated, message: "Call updateView() instead?")
  public func update(view: W3WViewProtocol) {
    view.update(theme: self)
  }
  
  
  // MARK: Accessors
  
  // testing this, see 'schemes' above...
  public subscript(set: W3WSetTypes) -> W3WScheme? {
    get {
      schemes[set]
    }
    set {
      schemes[set] = newValue
    }
  }
  
  
  // MARK: Withs (builders)

  
  public func with(styles: W3WStyles?, into: W3WSetTypes = .base) -> W3WTheme {
    let newTheme = W3WTheme(theme: self)
    
    newTheme[into]?.colors = W3WColors(colors: newTheme[into]?.colors)
    newTheme[into]?.styles = styles
    
    return newTheme
  }
  
  
  public func with(colors: W3WColors?, into: W3WSetTypes = .base) -> W3WTheme {
    let newTheme = W3WTheme(theme: self)
    
    newTheme[into]?.colors = colors
    newTheme[into]?.styles = W3WStyles(style: newTheme[into]?.styles)
    
    return newTheme
  }
  
  
  public func with(background: W3WColor?, into: W3WSetTypes = .base) -> W3WTheme {
    let newTheme = W3WTheme(theme: self)

    newTheme[into]?.colors = W3WColors(colors: newTheme[into]?.colors)
    newTheme[into]?.colors?.background = background
    
    return newTheme
  }
  
  public func with(foreground: W3WColor?, into: W3WSetTypes = .base) -> W3WTheme {
    let newTheme = W3WTheme(theme: self)
    
    newTheme[into]?.colors = W3WColors(colors: newTheme[into]?.colors)
    newTheme[into]?.colors?.foreground = foreground
    
    return newTheme
  }
  
  
  public func with(secondary: W3WColor?, into: W3WSetTypes = .base) -> W3WTheme {
    let newTheme = W3WTheme(theme: self)
    
    newTheme[into]?.colors = W3WColors(colors: newTheme[into]?.colors)
    newTheme[into]?.colors?.secondary = secondary
    
    return newTheme
  }
  
  
  public func with(tint: W3WColor?, into: W3WSetTypes = .base) -> W3WTheme {
    let newTheme = W3WTheme(theme: self)
    
    newTheme[into]?.colors = W3WColors(colors: newTheme[into]?.colors)
    newTheme[into]?.colors?.tint = tint
    
    return newTheme
  }

  
  public func with(line: W3WColor?, into: W3WSetTypes = .base) -> W3WTheme {
    let newTheme = W3WTheme(theme: self)
    
    newTheme[into]?.colors = W3WColors(colors: newTheme[into]?.colors)
    newTheme[into]?.colors?.line = line
    
    return newTheme
  }

  
  public func with(border: W3WColor?, into: W3WSetTypes = .base) -> W3WTheme {
    let newTheme = W3WTheme(theme: self)
    
    newTheme[into]?.colors = W3WColors(colors: newTheme[into]?.colors)
    newTheme[into]?.colors?.border = border
    
    return newTheme
  }

  
  public func with(padding: W3WPadding?, into: W3WSetTypes = .base) -> W3WTheme {
    let newTheme = W3WTheme(theme: self)
    newTheme[into]?.styles = W3WStyles(style: newTheme[into]?.styles).with(padding: padding)
    return newTheme
  }
  
  
  public func with(cornerRadius: W3WCornerRadius?, into: W3WSetTypes = .base) -> W3WTheme {
    let newTheme = W3WTheme(theme: self)
    newTheme[into]?.styles = W3WStyles(style: newTheme[into]?.styles).with(cornerRadius: cornerRadius)
    return newTheme
  }
  
  
  public func with(border: W3WLineThickness?, into: W3WSetTypes = .base) -> W3WTheme {
    let newTheme = W3WTheme(theme: self)
    newTheme[into]?.styles = W3WStyles(style: newTheme[into]?.styles).with(border: border)
    return newTheme
  }
  
  
  public func with(rowHeight: W3WRowHeight?, into: W3WSetTypes = .base) -> W3WTheme {
    let newTheme = W3WTheme(theme: self)
    newTheme[into]?.styles = W3WStyles(style: newTheme[into]?.styles).with(rowHeight: rowHeight )
    return newTheme
  }
  
  
  public var description: String {
    return debugDescription
  }
  
  
  public var debugDescription: String {
    var retvals = [String]()

    for (key, scheme) in schemes {
      retvals.append("\(key): \(scheme.description) ")
    }
    
    return retvals.joined(separator: "\n")
  }

  
}






//  public func with(style: W3WStyle?) -> W3WTheme    { return W3WTheme(colors: colors, style: self.styles?.with(base: style)) }
//
//  //public func with(foreground: W3WColor) -> W3WTheme { return self.with(colors: colors?.with(foreground: foreground)) }
//  //public func with(background: W3WColor) -> W3WTheme { return self.with(colors: colors?.with(background: background)) }
//  public func with(tint: W3WColor)        -> W3WTheme { return self.with(colors: colors?.with(tint: tint)) }
//  public func with(secondary: W3WColor)     -> W3WTheme { return self.with(colors: colors?.with(secondary: secondary)) }
//  public func with(brand: W3WColor)          -> W3WTheme { return self.with(colors: colors?.with(brand: brand)) }
//  public func with(highlight: W3WBasicColors) -> W3WTheme { return self.with(colors: colors?.with(highlight: highlight)) }
//  public func with(border: W3WColor)          -> W3WTheme { return self.with(colors: colors?.with(border: border)) }
//  public func with(separator: W3WColor)       -> W3WTheme { return self.with(colors: colors?.with(separator: separator)) }
//  public func with(shadow: W3WColor)         -> W3WTheme { return self.with(colors: colors?.with(shadow: shadow)) }
//  public func with(placeholder: W3WColor)   -> W3WTheme { return self.with(colors: colors?.with(placeholder: placeholder)) }
//  public func with(error: W3WBasicColors)   -> W3WTheme { return self.with(colors: colors?.with(error: error)) }
//
//  public func with(buttons: W3WColorSet?)     -> W3WTheme { return self.with(colors: colors?.with(buttons: buttons)) }
//  public func with(icons: W3WColorSet?)        -> W3WTheme { return self.with(colors: colors?.with(icons: icons)) }
//
//  public func with(border: W3WLineThickness)  -> W3WTheme { return self.with(style: styles?.base.with(border: border)) }
//  public func with(shadow: W3WShadow)          -> W3WTheme { return self.with(style: styles?.base.with(shadow: shadow)) }
//  public func with(fonts: W3WFonts)             -> W3WTheme { return self.with(style: styles?.base.with(fonts: fonts)) }
//  public func with(padding: W3WPadding)          -> W3WTheme { return self.with(style: styles?.base.with(padding: padding)) }
//  public func with(cornerRadius: W3WCornerRadius) -> W3WTheme { return self.with(style: styles?.base.with(cornerRadius: cornerRadius)) }
//  public func with(rowHeight: W3WRowHeight)       -> W3WTheme { return self.with(style: styles?.base.with(rowHeight: rowHeight)) }



//  public func with(foreground: W3WColor?, into: W3WSetTypes = .base) -> W3WTheme { return self.with(colors: (colors?[into].with(foreground: foreground)) ?? W3WColorSet(foreground: foreground)) }

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


