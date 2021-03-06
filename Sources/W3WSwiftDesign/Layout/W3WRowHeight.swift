//
//  File.swift
//  
//
//  Created by Dave Duprey on 07/04/2022.
//

import CoreGraphics


public struct W3WRowHeight: Equatable {
  public let value: CGFloat
  
  public init(value: CGFloat) { self.value = value }
  
  static public let extraSmall       = W3WRowHeight(value: 32.0)
  static public let small            = W3WRowHeight(value: 40.0)
  static public let medium           = W3WRowHeight(value: 48.0)
  static public let large            = W3WRowHeight(value: 64.0)
  static public let extraLarge       = W3WRowHeight(value: 72.0)
  static public let extraExtraLarge  = W3WRowHeight(value: 380.0)
}
