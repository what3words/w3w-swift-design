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
  
  static public let none:   W3WPadding =  0.0
  static public let single: W3WPadding =  1.0
  static public let fine:   W3WPadding =  2.0
  static public let thin:   W3WPadding =  4.0
  static public let light:  W3WPadding =  8.0
  static public let medium: W3WPadding = 12.0
  static public let bold:   W3WPadding = 16.0
  static public let heavy:  W3WPadding = 24.0
}

