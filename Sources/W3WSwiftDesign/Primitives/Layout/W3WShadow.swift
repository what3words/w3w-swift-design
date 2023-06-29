//
//  File.swift
//  
//
//  Created by Dave Duprey on 07/04/2022.
//

import CoreGraphics


public struct W3WShadow {
  //let color: W3WColor
  let opacity: CGFloat
  let offset: CGFloat
  let radius: CGFloat
  
  public init(opacity: CGFloat, offset: CGFloat, radius: CGFloat) {
    self.opacity = opacity
    self.offset = offset
    self.radius = radius
  }
  
  static let none   = W3WShadow(opacity: 0.00, offset: 0.0, radius: 0.0)
  static let low    = W3WShadow(opacity: 0.33, offset: 0.0, radius: 5.0)
  static let medium = W3WShadow(opacity: 0.33, offset: 0.0, radius: 15.0)
  static let high   = W3WShadow(opacity: 0.33, offset: 0.0, radius: 30.0)
}

