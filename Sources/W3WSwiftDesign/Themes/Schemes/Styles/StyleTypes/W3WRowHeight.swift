//
//  File.swift
//  
//
//  Created by Dave Duprey on 07/04/2022.
//

import CoreGraphics


/// row height values that correspond to most what3words design standards
public struct W3WRowHeight: Equatable, ExpressibleByFloatLiteral {
  public let value: CGFloat
  
  public init(value: CGFloat) { self.value = value }
  public init(floatLiteral value: Float) { self.value = CGFloat(value) }

  public func get() -> CGFloat {
    return value
  }
  
}
