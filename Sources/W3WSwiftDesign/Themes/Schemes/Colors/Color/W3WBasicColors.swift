//
//  File.swift
//  
//
//  Created by Dave Duprey on 05/05/2022.
//

import CoreGraphics

#if canImport(UIKit)
  import UIKit
#endif

#if canImport(AppKit)
import AppKit
#endif


@available(*, deprecated, renamed: "W3WBaseColors")
typealias W3WTwoColor = W3WBaseColors

@available(*, deprecated, renamed: "W3WBasicColors")
public typealias W3WBaseColors = W3WBasicColors


/// Holds a foreground and a background
public class W3WBasicColors {
  
  public var foreground: W3WColor?
  public var background: W3WColor?
  
  
  /// initialise with a foreground and background color
  public init(foreground: W3WColor? = nil, background: W3WColor? = nil) {
    self.foreground = foreground
    self.background = background
  }
  

  /// initialise with a foreground and background CGColor
  public init(cgForeground: CGColor? = nil, cgBackground: CGColor? = nil) {
    self.foreground = (cgForeground != nil) ? W3WColor(cgColor: cgForeground!) : nil
    self.background = (cgBackground != nil) ? W3WColor(cgColor: cgBackground!) : nil
  }

  
#if canImport(UIKit)
  public init(uiForeground: UIColor? = nil, uiBackground: UIColor? = nil) {
    self.foreground = (uiForeground != nil) ? W3WColor(uiColor: uiForeground!) : nil
    self.background = (uiBackground != nil) ? W3WColor(uiColor: uiBackground!) : nil
  }
#endif

#if os(macOS)
  public init(nsForeground: NSColor? = nil, nsBackground: NSColor? = nil) {
    self.foreground = (nsForeground != nil) ? W3WColor(nsColor: nsForeground!) : nil
    self.background = (nsBackground != nil) ? W3WColor(nsColor: nsBackground!) : nil
  }
#endif
  
  /// return the same colorset the foreground color changed
  public func with(foreground: W3WColor? = nil) -> W3WColors {
    return W3WColors(foreground: foreground, background: background)
  }
  
  
  /// return the same colorset the background color changed
  public func with(background: W3WColor? = nil) -> W3WColors {
    return W3WColors(foreground: foreground, background: background)
  }

}

