//
//  File.swift
//  
//
//  Created by Dave Duprey on 06/09/2022.
//

import UIKit


public struct W3WIconSize: Equatable {
  public let value: CGSize
  
  public init(value: CGSize) { self.value = value }
  
  public static let smallIcon  = W3WIconSize(value: CGSize(width: 16.0, height: 16.0))
  public static let mediumIcon = W3WIconSize(value: CGSize(width: 32.0, height: 32.0))
  public static let largeIcon  = W3WIconSize(value: CGSize(width: 64.0, height: 64.0))

  public static let handleIcon = W3WIconSize(value: CGSize(width: 30.0, height: 4.0))
}



/// values that correspond to most what3words design standards
//public struct W3WIconSizes: Equatable, ExpressibleByFloatLiteral {
//  public typealias FloatLiteralType = Float
//
//  public let value: CGFloat
//
//  public init(value: CGFloat) { self.value = value }
//  public init(floatLiteral value: Float) { self.value = CGFloat(value) }
//
//  public static let smallIcon:   W3WIconSizes = 16.0
//  public static let handleWidth: W3WIconSizes = 30.0
//}

