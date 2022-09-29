//
//  File.swift
//  
//
//  Created by Dave Duprey on 07/04/2022.
//
#if canImport(UIKit)
import UIKit
#endif

#if canImport(AppKit)
import AppKit
#endif


/// stores a color for each colour mode, such as "light mode" and "dark mode"
public struct W3WColor {
  
  /// the collection of related colours
  let colors: [W3WColorMode: W3WCoreColor]  
  
  
  /// initialize with a dictionary of colour mode and related color
  public init(colors: [W3WColorMode: W3WCoreColor]) {
    self.colors = colors
  }
  
  
  /// set the light and ddark mode colours for this color
  public init(light: W3WCoreColor, dark: W3WCoreColor) {
    self.colors = [.light:light, .dark: dark]
  }
  
  
  /// use the same value for all colour modes
  public init(all: W3WCoreColor) {
    self.colors = [.light:all, .dark: all]
  }

  
#if os(macOS)
  /// init using an NSColor
  public init(nsColor: NSColor) {
    colors = [.light:W3WCoreColor(nsColor: nsColor), .dark: W3WCoreColor(nsColor: nsColor)]
  }
  
  
  /// init using NSColors
  public init(nsColor: NSColor, dark: NSColor) {
    colors = [.light:W3WCoreColor(nsColor: nsColor), .dark: W3WCoreColor(nsColor: dark)]
  }
#endif

#if canImport(UIKit)
  /// init using a UIColor
  public init(uiColor: UIColor) {
    colors = [.light:W3WCoreColor(uiColor: uiColor), .dark: W3WCoreColor(uiColor: uiColor)]
  }
  
  
  /// init using UIColors
  public init(uiColor: UIColor, dark: UIColor) {
    colors = [.light:W3WCoreColor(uiColor: uiColor), .dark: W3WCoreColor(uiColor: dark)]
  }
#endif
  
  
  /// init using a CGColor
  public init(cgColor: CGColor) {
    colors = [.light:W3WCoreColor(cgColor: cgColor), .dark: W3WCoreColor(cgColor: cgColor)]
  }

  
  /// init using CGColors
  public init(cgColor: CGColor, dark: CGColor) {
    colors = [.light:W3WCoreColor(cgColor: cgColor), .dark: W3WCoreColor(cgColor: dark)]
  }

  
  /// sets an alpha value for a W3WCoreColor
  public func with(alpha a: CGFloat) -> W3WColor {
    var modes = [W3WColorMode: W3WCoreColor]()
    for (mode, color) in colors {
      modes[mode] = color.with(alpha: a)
    }
    return W3WColor(colors: modes)
  }

  
  
  /// returns the color for the current color mode automatically
  public var current: W3WCoreColor {
    get {
      return self[W3WColor.theme]
    }
  }
  
  
  /// return the colour for the requested mode, failing
  /// that then return for light mode, then dark mode
  /// then try anything available, then if nothing found
  /// yet, return black or white
  public subscript(theme: W3WColorMode) -> W3WCoreColor {
    if let colour = colors[theme] {
      return colour
    } else if let colour = colors[.light] {
      return colour
    } else if let colour = colors[.dark] {
      return colour
    } else if let colour = colors.values.first {
      return colour
    } else {
      if theme == .light {
        return .white
      } else {
        return .black
      }
    }
  }
  
  
  /// stores the override for the system dark/light mode setting
  static var colorModeOverride: W3WColorMode? = nil
  
  
  /// override the system dark/light mode setting
  static public func set(mode: W3WColorMode?) {
    colorModeOverride = mode
  }
  
  
  /// automatically detect the current colour mode
  static var theme: W3WColorMode {
    if let colorOverride = colorModeOverride {
      return colorOverride
    } else {
#if os(iOS)
    if #available(iOS 12, *) {
      return UIScreen.main.traitCollection.userInterfaceStyle == .light ? W3WColorMode.light : W3WColorMode.dark
    } else {
      return W3WColorMode.light
    }
#elseif os(watchOS)
    return  W3WColorMode.dark
#else
    return W3WColorMode.light
#endif
    }
  }

  
  /// indicates of the color is "light" or "dark"
  /// mainly used to hlep fnid a contrasting color
  public func isLight(threshold: Float = 0.5) -> Bool {
    return current.isLight()
  }
  
}

