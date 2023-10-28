//
//  File.swift
//
//
//  Created by Dave Duprey on 07/04/2022.
//
import CoreGraphics


/// padding values that correspond to most what3words design standards
public struct W3WMargin: Equatable, ExpressibleByFloatLiteral {
  public typealias FloatLiteralType = Float
  
  public let value: CGFloat
  
  public init(value: CGFloat) { self.value = value }
  public init(floatLiteral value: Float) { self.value = CGFloat(value) }
}

