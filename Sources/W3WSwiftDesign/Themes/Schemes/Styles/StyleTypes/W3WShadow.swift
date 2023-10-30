//
//  File.swift
//  
//
//  Created by Dave Duprey on 07/04/2022.
//

import CoreGraphics


public struct W3WShadow {
  let opacity: CGFloat
  let offset: CGFloat
  let radius: CGFloat
  
  public init(opacity: CGFloat, offset: CGFloat, radius: CGFloat) {
    self.opacity = opacity
    self.offset = offset
    self.radius = radius
  }
  
}

