//
//  File.swift
//  
//
//  Created by Dave Duprey on 06/09/2022.
//

import UIKit


/// corner radius values that correspond to most what3words design standards
public struct W3WViewSizes: Equatable, ExpressibleByFloatLiteral {
  public let value: CGFloat
  
  public init(value: CGFloat) { self.value = value }
  public init(floatLiteral value: Float) { self.value = CGFloat(value) }
  
  public static let smallIcon   = W3WViewSizes(value: 16.0)
  public static let handleWidth = W3WViewSizes(value: 30.0)
}

