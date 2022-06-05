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

public struct W3WTwoColor {
  public var foreground: W3WColor
  public var background: W3WColor
  
  public init(foreground: W3WColor, background: W3WColor) {
    self.foreground = foreground
    self.background = background
  }
  

  public init(cgForeground: CGColor, cgBackground: CGColor) {
    self.foreground = W3WColor(cgColor: cgForeground)
    self.background = W3WColor(cgColor: cgBackground)
  }

  
#if canImport(UIKit)
  public init(uiForeground: UIColor, uiBackground: UIColor) {
    self.foreground = W3WColor(uiColor: uiForeground)
    self.background = W3WColor(uiColor: uiBackground)
  }
#endif

#if os(macOS)
  public init(nsForeground: NSColor, nsBackground: NSColor) {
    self.foreground = W3WColor(nsColor: nsForeground)
    self.background = W3WColor(nsColor: nsBackground)
  }
#endif
  
}

