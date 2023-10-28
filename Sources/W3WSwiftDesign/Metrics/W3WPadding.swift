//
//  File.swift
//  
//
//  Created by Dave Duprey on 07/04/2022.
//
import UIKit


/// padding values that correspond to most what3words design standards
public struct W3WPadding: Equatable, ExpressibleByFloatLiteral {
  public typealias FloatLiteralType = Float
  
  public let insets: UIEdgeInsets
  
  public var value:  CGFloat { get { return (insets.top + insets.bottom + insets.left + insets.right) / 4.0 } }
  
  public var top:    CGFloat { get { return insets.top    } }
  public var left:   CGFloat { get { return insets.left   } }
  public var bottom: CGFloat { get { return insets.bottom } }
  public var right:  CGFloat { get { return insets.right  } }
  
  
  public init(value: CGFloat) {
    self.insets = UIEdgeInsets(top: value, left: value, bottom: value, right: value)
  }
  
  
  public init(floatLiteral value: Float) {
    self.insets = UIEdgeInsets(top: CGFloat(value), left: CGFloat(value), bottom: CGFloat(value), right: CGFloat(value))
  }
  
  
  public init(insets: UIEdgeInsets) {
    self.insets = insets
  }
  
  
  public init(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
    self.insets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
  }
  
  
  public func with(top:  CGFloat)  -> W3WPadding  { return W3WPadding(top: top, left: left, bottom: bottom, right: right) }
  public func with(left:  CGFloat)  -> W3WPadding { return W3WPadding(top: top, left: left, bottom: bottom, right: right) }
  public func with(bottom: CGFloat) -> W3WPadding { return W3WPadding(top: top, left: left, bottom: bottom, right: right) }
  public func with(right: CGFloat) -> W3WPadding  { return W3WPadding(top: top, left: left, bottom: bottom, right: right) }

}

