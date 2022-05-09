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

  
#if canImport(AppKit)
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
  
  
  static var colorModeOverride: W3WColorMode? = nil
  
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

  
  // MARK: what3words colours
  
  // basic
  static public let text                      = W3WColor(light: .black, dark: .white)
  static public let clear                     = W3WColor(all: .clear)
  
  // brand
  static public let red                       = W3WColor(all: .red)
  static public let white                     = W3WColor(all: .white)
  
  static public let offDarkGrey               = W3WColor(all: .offDarkGrey)
  
  // custom
  
  static public let secondaryGray             = W3WColor(all: .offLightGrey)

  // cta = Call To Action
  static public let ctaText                   = W3WColor(light: .white,      dark: .white)
  
  static public let ctaBackgroundPrimary      = W3WColor(light: .red,        dark: .red)
  static public let ctaBackgroundSecondary    = W3WColor(light: .darkBlue,   dark: .royalBlue)
  static public let ctaBackgroundTertiary     = W3WColor(light: .royalBlue,  dark: .darkBlue)
  
  static public let ctaBodyText1              = W3WColor(light: .darkBlue,   dark: .white)
  static public let ctaBodyText2              = W3WColor(light: .grey32,     dark: .grey92)
  static public let ctaBodyText3              = W3WColor(light: .grey38,     dark: .grey84)
  
  static public let ctaBodyBackground1        = W3WColor(light: .offGrey,    dark: .darkDarkBlue)
  static public let ctaBodyBackground2        = W3WColor(light: .white,      dark: .black)
  static public let ctaBodyBackground3        = W3WColor(light: .powderBlue, dark: .offDarkGrey)
  static public let ctaBodyBackground4        = W3WColor(light: .lightCyan,  dark: .offMidGrey)
  
  // tov = Tone of Voice
  static public let tovConfirmationText       = W3WColor(light: .green,      dark: .darkGreen)
  static public let tovInformaitonText        = W3WColor(light: .darkerCyan, dark: .darkCyan)
  static public let tovWarningText            = W3WColor(light: .brown,      dark: .darkBrown)
  static public let tovErrorText              = W3WColor(light: .dullRed,    dark: .darkerBrown)
  
  static public let tovConfirmationBackground = W3WColor(light: .white,      dark: .brightGreen)
  static public let tovInformaitonBackground  = W3WColor(light: .white,      dark: .lightBlue)
  static public let tovWarningBackground      = W3WColor(light: .white,      dark: .yellow)
  static public let tovErrorBackground        = W3WColor(light: .white,      dark: .coral)
  
  // overlays
  public static let overlaylight              = W3WColor(light: .white.with(alpha: 0.3),      dark: .white.with(alpha: 0.3))
  public static let overlayNormal             = W3WColor(light: .darkBlue.with(alpha: 0.6),   dark: .darkBlue.with(alpha: 0.6))
  public static let overlayDark               = W3WColor(light: .darkBlue.with(alpha: 0.9),   dark: .darkBlue.with(alpha: 0.9))
  
  public static let overlayLightBlur          = W3WColor(light: .white.with(alpha: 0.3),      dark: .white.with(alpha: 0.3))
  public static let overlayNormalBlur         = W3WColor(light: .grey77.with(alpha: 0.01),    dark: .grey77.with(alpha: 0.01))
  public static let overlayDarkBlur           = W3WColor(light: .darkBlue.with(alpha: 0.6),   dark: .darkBlue.with(alpha: 0.6))
  
  public static let overlayHover              = W3WColor(light: .royalBlue.with(alpha: 0.08), dark: .white.with(alpha: 0.12))
  public static let overlayPressed            = W3WColor(light: .royalBlue.with(alpha: 0.16), dark: .black.with(alpha: 0.16))
  public static let overlayDisabled           = W3WColor(light: .grey50.with(alpha: 7),       dark: .grey50.with(alpha: 0.6))

}

