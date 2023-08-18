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
  
  public static let none:      W3WLineThickness = 0.0
  public static let onePoint:  W3WLineThickness = 1.0
  public static let twoPoint:  W3WLineThickness = 2.0
  public static let fourPoint: W3WLineThickness = 4.0
}



//public struct W3WBorder: ExpressibleByFloatLiteral {
//  public typealias FloatLiteralType = Float
//
//  public let thickness: W3WBorderWeight
//  public let color: W3WColor
//
//  public init(thickness: W3WBorderWeight = .onePoint, color: W3WColor = .secondaryGray) {
//    self.thickness = thickness
//    self.color = color
//  }
//
//  public init(floatLiteral value: Float) {
//    self.thickness = W3WBorderWeight(value: CGFloat(value))
//    self.color = .offDarkGrey
//  }
//
//  static public let none  = W3WBorder(thickness: .none,     color: .clear)
//  static public let light = W3WBorder(thickness: .onePoint, color: .offDarkGrey)
//  static public let red   = W3WBorder(thickness: .twoPoint, color: .red)
//}
//
//
//public struct W3WBorderWeight: Equatable, ExpressibleByFloatLiteral {
//  public typealias FloatLiteralType = Float
//
//  public let value: CGFloat
//
//  public init(floatLiteral value: Float) {
//    self.value = CGFloat(value)
//  }
//
//  public init(value: CGFloat) { self.value = value }
//
//  public static let none      = W3WBorderWeight(value: 0.0)
//  public static let onePoint  = W3WBorderWeight(value: 1.0)
//  public static let twoPoint  = W3WBorderWeight(value: 2.0)
//  public static let fourPoint = W3WBorderWeight(value: 4.0)
//}

