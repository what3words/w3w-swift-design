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

  
  // MARK: what3words colours
  
  // basic
  static public let clear                     = W3WColor(all: .clear)
  static public let white                     = W3WColor(all: .white)
  static public let black                     = W3WColor(all: .black)

  // semantic
  static public let text                      = W3WColor(light: .black, dark: .white)
  static public let background                = W3WColor(light: .white, dark: .black)
  
  // brand
  static public let red                       = W3WColor(all: .red)
  static public let powderBlue                = W3WColor(all: .powderBlue)
  static public let offDarkGrey               = W3WColor(all: .offDarkGrey)
  static public let green                     = W3WColor(all: .green)
  
  // custom
  
  static public let secondaryGray             = W3WColor(all: .offLightGrey)
  static public let secondaryDarkGray         = W3WColor(all: .grey32)
  
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

  // Label Colours
  public static let labelColourLight          = W3WColor(all: W3WCoreColor(hex: 0x3C3C43, alpha: 0.6))
  
  // iOS System Colours, taken from https://sarunw.com/posts/dark-color-cheat-sheet/
  
  static public let systemBackground           = W3WColor(light: .systemBackgroundLight,               dark: .systemBackgroundDark)
  static public let secondarySystemBackground    = W3WColor(light: .secondarySystemBackgroundLight,      dark: .secondarySystemBackgroundDark)
  static public let tertiarySystemBackground       = W3WColor(light: .tertiarySystemBackgroundLight,       dark: .tertiarySystemBackgroundDark)
  static public let systemGroupedBackground         = W3WColor(light: .systemGroupedBackgroundLight,         dark: .systemGroupedBackgroundDark)
  static public let secondarySystemGroupedBackground = W3WColor(light: .secondarySystemGroupedBackgroundLight, dark: .secondarySystemBackgroundDark)
  static public let tertiarySystemGroupedBackground   = W3WColor(light: .tertiarySystemGroupedBackgroundLight,   dark: .tertiarySystemGroupedBackgroundDark)

  static public let label           = W3WColor(light: .labelLight,           dark: .labelDark)
  static public let secondaryLabel  = W3WColor(light: .secondaryLabelLight,  dark: .secondaryLabelDark)
  static public let tertiaryLabel   = W3WColor(light: .tertiaryLabelLight,   dark: .tertiaryLabelDark)
  static public let quaternaryLabel = W3WColor(light: .quaternaryLabelLight, dark: .quaternaryLabelDark)
  static public let placeholderText = W3WColor(light: .placeholderTextLight, dark: .placeholderTextDark)
  static public let separator       = W3WColor(light: .separatorLight,       dark: .separatorDark)
  static public let opaqueSeparator = W3WColor(light: .opaqueSeparatorLight, dark: .opaqueSeparatorDark)
  static public let systemBlue      = W3WColor(light: .systemBlueLight,     dark: .systemBlueDark)
  static public let systemGreen     = W3WColor(light: .systemGreenLight,   dark: .systemGreenDark)
  static public let systemIndigo    = W3WColor(light: .systemIndigoLight, dark: .systemIndigoDark)
  static public let systemOrange    = W3WColor(light: .systemOrangeLight, dark: .systemOrangeDark)
  static public let systemPink      = W3WColor(light: .systemPinkLight,   dark: .systemPinkDark)
  static public let systemPurple    = W3WColor(light: .systemPurpleLight, dark: .systemPurpleDark)
  static public let systemRed       = W3WColor(light: .systemRedLight,    dark: .systemRedDark)
  static public let systemTeal      = W3WColor(light: .systemTealLight,   dark: .systemTealDark)
  static public let systemYellow    = W3WColor(light: .systemYellowLight, dark: .systemYellowDark)
  static public let systemGray      = W3WColor(light: .systemGrayLight,   dark: .systemGrayDark)
  static public let systemGray2     = W3WColor(light: .systemGray2Light,  dark: .systemGray2Dark)
  static public let systemGray3     = W3WColor(light: .systemGray3Light,  dark: .systemGray3Dark)
  static public let systemGray4     = W3WColor(light: .systemGray4Light,  dark: .systemGray4Dark)
  static public let systemGray5     = W3WColor(light: .systemGray5Light,  dark: .systemGray5Dark)
  static public let systemGray6     = W3WColor(light: .systemGray6Light,  dark: .systemGray6Dark)
  
}

