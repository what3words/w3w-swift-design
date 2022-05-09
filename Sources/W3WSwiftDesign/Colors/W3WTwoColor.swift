//
//  File.swift
//  
//
//  Created by Dave Duprey on 05/05/2022.
//

import Foundation


public struct W3WTwoColor {
  public var foreground: W3WColor
  public var background: W3WColor
  
  public init(foreground: W3WColor, background: W3WColor) {
    self.foreground = foreground
    self.background = background
  }
}
