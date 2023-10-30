//
//  File.swift
//  
//
//  Created by Dave Duprey on 07/04/2022.
//
import CoreGraphics


@available(*, deprecated, renamed: "W3WLineThickness")
typealias W3WBorder = W3WLineThickness


public struct W3WLineThickness: Equatable, ExpressibleByFloatLiteral {
  public typealias FloatLiteralType = Float
  
  public let value: CGFloat
  
  public init(floatLiteral value: Float) {
    self.value = CGFloat(value)
  }
  
  public init(value: CGFloat) { self.value = value }
}


