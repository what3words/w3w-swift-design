//
//  File.swift
//  
//
//  Created by Dave Duprey on 04/05/2022.
//

import Foundation



public struct W3WColorSet {
  public var foreground: W3WColor
  public var background: W3WColor
  public var highlight: W3WColor
  public var secondary: W3WColor
  
  public init(foreground: W3WColor, background: W3WColor, highlight: W3WColor, secondary: W3WColor) {
    self.foreground = foreground
    self.background = background
    self.highlight = highlight
    self.secondary = secondary
  }
  
  
  public func with(foreground: W3WColor) -> W3WColorSet {
    return W3WColorSet(foreground: foreground, background: background, highlight: highlight, secondary: secondary)
  }
  
  public func with(background: W3WColor) -> W3WColorSet {
    return W3WColorSet(foreground: foreground, background: background, highlight: highlight, secondary: secondary)
  }
  
  public func with(highlight: W3WColor) -> W3WColorSet {
    return W3WColorSet(foreground: foreground, background: background, highlight: highlight, secondary: secondary)
  }
  
  public func with(secondary: W3WColor) -> W3WColorSet {
    return W3WColorSet(foreground: foreground, background: background, highlight: highlight, secondary: secondary)
  }
  

  static public let whiteGrayRed = W3WColorSet(foreground: .white, background: .offDarkGrey, highlight: .red, secondary: .secondaryGray)

}

