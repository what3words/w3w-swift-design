//
//  File.swift
//  
//
//  Created by Dave Duprey on 07/04/2022.
//
//  This is core of the colour system of W3W Swift colours for the
//  components libraries.  A programatic approach was chosen instead
//  of using .xcassets color settings as most of the code is
//  delivered as Swift Packages, and as of this writing there isn't
//  a way for a developer to change an .xcasset file in a downloaded
//  and installed Swift Package. Further referencing .xcasset files
//  in developers' code would require strict naming conventions, and
//  might not be too intuitive.
//

import CoreGraphics

#if canImport(SwiftUI)
import SwiftUI
#endif

#if canImport(UIKit)
import UIKit
#endif

#if canImport(AppKit)
import AppKit
#endif


/// A basic colour struct, this is used as opposed to the built in
/// operating system provided colours because this is a multi-operating
/// system design library.  Apple's various UI systems use NScolor,
/// UIColor, CGColor, and Color.  Not all of these color types are
/// available in a particular OS/UI system.  A neutral color definition
/// was therefore required for interoperability.
/// There are constructors that take NScolor, UIColor, CGColor, and
/// Color, and these objects can produce them as well with the cgColor,
/// suColor, uiColor, and nsColor members.
/// A bug in Xcode 13 meant the `suColor: Color` functions had to move
/// to an extension in the w3w SwiftUI Interface Elements package
public struct W3WCoreColor {
  
  /// red component of the colour
  public let red:   CGFloat
  
  /// green component of the colour
  public let green: CGFloat
  
  /// blue component of the colour
  public let blue:  CGFloat
  
  /// alpha of the colour
  public let alpha: CGFloat
  
  
  /// init using red,green,blue, and optionaly alpha (values: zero -> one)
  public init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1.0) {
    self.red = red
    self.green = green
    self.blue = blue
    self.alpha = alpha
  }
  
  
  /// init using a hex Int value, something like: W3WCoreColor(hex: 0xE7AA42)
  public init(hex: Int, alpha: CGFloat = 1.0) {
    red   = CGFloat((hex >> 16) & 0xFF) / 255.0
    green = CGFloat((hex >> 8) & 0xFF) / 255.0
    blue  = CGFloat(hex & 0xFF) / 255.0
    self.alpha = alpha
  }
  
  
  /// make a greyscale value
  public init(grey: CGFloat, alpha: CGFloat = 1.0) {
    self.red   = grey
    self.green = grey
    self.blue  = grey
    self.alpha = alpha
  }
  
  
#if os(macOS)
  /// init from an NSColor
  public init(nsColor: NSColor) {
    if let (red, green, blue, alpha) = W3WCoreColor.toRGB(cgColor: nsColor.cgColor) {
      self.red   = red
      self.green = green
      self.blue  = blue
      self.alpha = alpha
    } else {
      self = .black
    }
  }
#endif

  
#if canImport(UIKit)
  /// init from a UIColor
  public init(uiColor: UIColor) {
    if let (red, green, blue, alpha) = W3WCoreColor.toRGB(uiColor: uiColor) {
      self.red   = red
      self.green = green
      self.blue  = blue
      self.alpha = alpha
    } else {
      self = .black
    }
  }
#endif


  /// init from a CGColor
  public init(cgColor: CGColor) {
    if let (red, green, blue, alpha) = W3WCoreColor.toRGB(cgColor: cgColor) {
      self.red   = red
      self.green = green
      self.blue  = blue
      self.alpha = alpha
    } else {
      self = .black
    }
  }

  
  /// sets an alpha value for a W3WCoreColor
  public func with(alpha a: CGFloat) -> W3WCoreColor {
    return W3WCoreColor(red: red, green: green, blue: blue, alpha: a)
  }
  

#if canImport(UIKit)
  /// get the colour components from a UIColor
  static func toRGB(uiColor: UIColor) -> (CGFloat, CGFloat, CGFloat, CGFloat)? {
    return toRGB(cgColor: uiColor.cgColor)
  }
#endif
  
  
  /// get the colour components from a CGColor
  static public func toRGB(cgColor: CGColor) -> (CGFloat, CGFloat, CGFloat, CGFloat)? {
    guard let model = cgColor.colorSpace?.model else {
      return nil
    }

    let components = cgColor.components
    
    switch model {
    case .rgb:
      return (components?[0] ?? 0.0, green: components?[1] ?? 0.0, blue: components?[2] ?? 0.0, alpha: components?[3] ?? 0.0)
    case .monochrome:
      return (red: components?[0] ?? 0.0, green: components?[0] ?? 0.0, blue: components?[0] ?? 0.0, alpha: components?[1] ?? 0.0)
    default:
      return nil
    }
  }
  
  
#if !os(macOS)
  /// returns a CGColor colour
  public var cgColor: CGColor { get { return uiColor.cgColor } }

  /// returns a UIColor colour
  public var uiColor: UIColor { get { return UIColor(red: red, green: green, blue: blue, alpha: alpha) } }

  /// This returns NSColor on mac and UIColor on iOS
  public var color:   UIColor { get { return uiColor } }
#else
  /// returns a CGColor colour
  public var cgColor: CGColor { get { return nsColor.cgColor } }

  /// returns a NSColor colour
  public var nsColor: NSColor { get { return NSColor(red: red, green: green, blue: blue, alpha: alpha) } }

  /// This returns UIColor on iOS and NSColor on mac
  public var color:   NSColor { get { return nsColor } }
#endif
  
  
  // MARK: what3words colours
  
  
  // black / white / transparent
  static public let black         = W3WCoreColor(hex: 0x000000)
  static public let white         = W3WCoreColor(hex: 0xffffff)
  static public let clear         = W3WCoreColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)

  // what3words brand colours
  static public let aqua          = W3WCoreColor(hex: 0x87e1d1)
  static public let blue          = W3WCoreColor(hex: 0x2e71b8)
  static public let charcoal      = W3WCoreColor(hex: 0x363636)
  static public let coral         = W3WCoreColor(hex: 0xf26c50)
  static public let darkBlue      = W3WCoreColor(hex: 0x0a3049)
  static public let green         = W3WCoreColor(hex: 0x53c18a)
  static public let lightBlue     = W3WCoreColor(hex: 0x98d5e5)
  static public let lightGrey     = W3WCoreColor(hex: 0xe0e0e0)
  static public let mediumGrey    = W3WCoreColor(hex: 0xa7a7a7)
  static public let mustard       = W3WCoreColor(hex: 0xc5b000)
  static public let orange        = W3WCoreColor(hex: 0xf4a344)
  static public let red           = W3WCoreColor(hex: 0xE11F26)
  static public let yellow        = W3WCoreColor(hex: 0xf6d31f)

  // extended colours
  static public let royalBlue     = W3WCoreColor(hex: 0x005379)
  static public let cranberry     = W3WCoreColor(hex: 0xcd3b72)
  static public let purple        = W3WCoreColor(hex: 0x8b4ca1)
  static public let powderBlue    = W3WCoreColor(hex: 0xdbeffa)
  static public let brightGreen   = W3WCoreColor(hex: 0x65D698)
  static public let darkGreen     = W3WCoreColor(hex: 0x265239)
  static public let darkCyan      = W3WCoreColor(hex: 0x1D4752)
  static public let darkerCyan    = W3WCoreColor(hex: 0x2B6A7A)
  static public let darkBrown     = W3WCoreColor(hex: 0x52460A)
  static public let brown         = W3WCoreColor(hex: 0x7A690F)
  static public let darkerBrown   = W3WCoreColor(hex: 0x52170B)
  static public let dullRed       = W3WCoreColor(hex: 0xB24000)
  static public let darkDarkBlue  = W3WCoreColor(hex: 0x001626)
  static public let lightCyan     = W3WCoreColor(hex: 0xC2E1EB)
  
  // greys
  static public let grey92        = W3WCoreColor(grey: 0.92)     //W3WCoreColor(hex: 0xEBEBEB)
  static public let grey84        = W3WCoreColor(grey: 0.84)     //W3WCoreColor(hex: 0xD6D6D6)
  static public let grey77        = W3WCoreColor(grey: 0.77)     //W3WCoreColor(hex: 0xC4C4C4)
  static public let grey50        = W3WCoreColor(grey: 0.5)      //W3WCoreColor(hex: 0x808080)
  static public let grey38        = W3WCoreColor(grey: 0.38)     //W3WCoreColor(hex: 0x616161)
  static public let grey32        = W3WCoreColor(grey: 0.32)     //W3WCoreColor(hex: 0x525252)
  
  // off greys
  static public let offGrey       = W3WCoreColor(hex: 0xF2F4F5)
  static public let offLightGrey  = W3WCoreColor(hex: 0xB5B5B5)
  static public let offMidGrey    = W3WCoreColor(hex: 0x525E66)
  static public let offDarkGrey   = W3WCoreColor(hex: 0x31383D)

  // iOS System Colours, taken from https://sarunw.com/posts/dark-color-cheat-sheet/
  static public let systemBackgroundLight         = W3WCoreColor(hex: 0xFFFFFF)
  static public let systemBackgroundDark           = W3WCoreColor(hex: 0x000000)
  static public let secondarySystemBackgroundLight  = W3WCoreColor(hex: 0xF2F2F7)
  static public let secondarySystemBackgroundDark    = W3WCoreColor(hex: 0x1C1C1E)
  static public let tertiarySystemBackgroundLight     = W3WCoreColor(hex: 0xFFFFFF)
  static public let tertiarySystemBackgroundDark       = W3WCoreColor(hex: 0x2C2C2E)
  static public let systemGroupedBackgroundLight        = W3WCoreColor(hex: 0xF2F2F7)
  static public let systemGroupedBackgroundDark          = W3WCoreColor(hex: 0x000000)
  static public let secondarySystemGroupedBackgroundLight = W3WCoreColor(hex: 0xFFFFFF)
  static public let secondarySystemGroupedBackgroundDark  = W3WCoreColor(hex: 0x1C1C1E)
  static public let tertiarySystemGroupedBackgroundLight  = W3WCoreColor(hex: 0xF2F2F7)
  static public let tertiarySystemGroupedBackgroundDark  = W3WCoreColor(hex: 0x2C2C2E)
  
  static public let labelLight           = W3WCoreColor(hex: 0x000000)
  static public let labelDark            = W3WCoreColor(hex: 0xFFFFFF)
  static public let secondaryLabelLight  = W3WCoreColor(hex: 0x3C3C43, alpha: 0.6)
  static public let secondaryLabelDark   = W3WCoreColor(hex: 0xEBEBF5, alpha: 0.6)
  static public let tertiaryLabelLight   = W3WCoreColor(hex: 0x3C3C43, alpha: 0.3)
  static public let tertiaryLabelDark    = W3WCoreColor(hex: 0xEBEBF5, alpha: 0.3)
  static public let quaternaryLabelLight = W3WCoreColor(hex: 0x3C3C43, alpha: 0.2)
  static public let quaternaryLabelDark  = W3WCoreColor(hex: 0xEBEBF5, alpha: 0.2)

  static public let placeholderTextLight = W3WCoreColor(hex: 0x3C3C43, alpha: 0.3)
  static public let placeholderTextDark  = W3WCoreColor(hex: 0xEBEBF5, alpha: 0.3)

  static public let separatorLight       = W3WCoreColor(hex: 0x3C3C43, alpha: 0.3)
  static public let separatorDark        = W3WCoreColor(hex: 0x545458, alpha: 0.6)
  static public let opaqueSeparatorLight = W3WCoreColor(hex: 0xC6C6C8)
  static public let opaqueSeparatorDark  = W3WCoreColor(hex: 0x38383A)

  static public let systemBlueLight      = W3WCoreColor(hex: 0x007AFF)
  static public let systemBlueDark      = W3WCoreColor(hex: 0x0A84FF)
  static public let systemGreenLight   = W3WCoreColor(hex: 0x34C759)
  static public let systemGreenDark   = W3WCoreColor(hex: 0x30D158)
  static public let systemIndigoLight = W3WCoreColor(hex: 0x5856D6)
  static public let systemIndigoDark  = W3WCoreColor(hex: 0x5E5CE6)
  static public let systemOrangeLight = W3WCoreColor(hex: 0xFF9500)
  static public let systemOrangeDark  = W3WCoreColor(hex: 0xFF9F0A)
  static public let systemPinkLight   = W3WCoreColor(hex: 0xFF2D55)
  static public let systemPinkDark    = W3WCoreColor(hex: 0xFF375F)
  static public let systemPurpleLight = W3WCoreColor(hex: 0xAF52DE)
  static public let systemPurpleDark  = W3WCoreColor(hex: 0xBF5AF2)
  static public let systemRedLight    = W3WCoreColor(hex: 0xFF3B30)
  static public let systemRedDark     = W3WCoreColor(hex: 0xFF453A)
  static public let systemTealLight   = W3WCoreColor(hex: 0x5AC8FA)
  static public let systemTealDark    = W3WCoreColor(hex: 0x64D2FF)
  static public let systemYellowLight = W3WCoreColor(hex: 0xFFCC00)
  static public let systemYellowDark  = W3WCoreColor(hex: 0xFFD60A)

  static public let systemGrayLight   = W3WCoreColor(hex: 0x8E8E93)
  static public let systemGrayDark    = W3WCoreColor(hex: 0x8E8E93)
  static public let systemGray2Light  = W3WCoreColor(hex: 0xAEAEB2)
  static public let systemGray2Dark   = W3WCoreColor(hex: 0x636366)
  static public let systemGray3Light  = W3WCoreColor(hex: 0xC7C7CC)
  static public let systemGray3Dark   = W3WCoreColor(hex: 0x48484A)
  static public let systemGray4Light  = W3WCoreColor(hex: 0xD1D1D6)
  static public let systemGray4Dark   = W3WCoreColor(hex: 0x3A3A3C)
  static public let systemGray5Light  = W3WCoreColor(hex: 0xE5E5EA)
  static public let systemGray5Dark   = W3WCoreColor(hex: 0x2C2C2E)
  static public let systemGray6Light  = W3WCoreColor(hex: 0xF2F2F7)
  static public let systemGray6Dark   = W3WCoreColor(hex: 0x1C1C1E)
  
}

