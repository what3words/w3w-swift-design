//
//  File.swift
//  
//
//  Created by Dave Duprey on 07/04/2022.
//
import CoreGraphics


/// padding values that correspond to most what3words design standards
public struct W3WPadding: Equatable, ExpressibleByFloatLiteral {
  public typealias FloatLiteralType = Float
  
  public let value: CGFloat
  
  public init(value: CGFloat) { self.value = value }
  public init(floatLiteral value: Float) { self.value = CGFloat(value) }
  
  static public let none   = W3WPadding(value: 0.0)
  static public let thin   = W3WPadding(value: 4.0)
  static public let light  = W3WPadding(value: 8.0)
  static public let medium = W3WPadding(value: 12.0)
  static public let bold   = W3WPadding(value: 16.0)
  static public let heavy  = W3WPadding(value: 24.0)
}

