//
//  File.swift
//  
//
//  Created by Dave Duprey on 25/04/2022.
//

import Foundation
import CoreGraphics


/// corner radius values that correspond to most what3words design standards
public struct W3WCornerRadius: Equatable, ExpressibleByFloatLiteral {
  public typealias FloatLiteralType = Float

  public let value: CGFloat
  
  public init(value: CGFloat) { self.value = value }
  public init(floatLiteral value: Float) { self.value = CGFloat(value) }

  public static let none:     W3WCornerRadius =  0.0
  public static let medium:   W3WCornerRadius =  4.0
  public static let soft:     W3WCornerRadius =  8.0
  public static let verySoft: W3WCornerRadius = 16.0
}

