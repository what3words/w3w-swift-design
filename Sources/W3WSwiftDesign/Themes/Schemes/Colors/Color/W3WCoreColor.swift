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

    let _ = find(color: self.uiColor)
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

  
  /// indicates of the color is "light" or "dark"
  /// mainly used to hlep fnid a contrasting color
  public func isLight(threshold: Float = 0.5) -> Bool {
    let originalCGColor = self.cgColor

    // Now we need to convert it to the RGB colorspace. UIColor.white / UIColor.black are greyscale and not RGB.
    // If you don't do this then you will crash when accessing components index 2 below when evaluating greyscale colors.
    let rgbCgColor = originalCGColor.converted(to: CGColorSpaceCreateDeviceRGB(), intent: .defaultIntent, options: nil)
    guard let components = rgbCgColor?.components else {
      return false
    }
    guard components.count >= 3 else {
      return false
    }

    let brightness = Float(((components[0] * 299) + (components[1] * 587) + (components[2] * 114)) / 1000)
    return (brightness > threshold)
  }

  
  public func complimentaryTextColor() -> W3WCoreColor {
    return isLight() ? .black : .white
  }
  
}

