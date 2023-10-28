//
//  File.swift
//  
//
//  Created by Dave Duprey on 01/09/2023.
//

import UIKit


public extension W3WCornerRadius {
  static let none:     W3WCornerRadius =  0.0
  static let medium:   W3WCornerRadius =  4.0
  static let soft:     W3WCornerRadius =  8.0
  static let softer:   W3WCornerRadius = 14.0
  static let verySoft: W3WCornerRadius = 16.0
}


public extension W3WIconSize {
  static let smallIcon  = W3WIconSize(value: CGSize(width: 16.0, height: 16.0))
  static let mediumIcon = W3WIconSize(value: CGSize(width: 32.0, height: 32.0))
  static let largeIcon  = W3WIconSize(value: CGSize(width: 64.0, height: 64.0))
  static let handleIcon = W3WIconSize(value: CGSize(width: 40.0, height: 6.0))
}


public extension W3WLineThickness {
  static let none:       W3WLineThickness = 0.0
  static let onePoint:   W3WLineThickness = 1.0
  static let twoPoint:   W3WLineThickness = 2.0
  static let threePoint: W3WLineThickness = 2.0
  static let fourPoint:  W3WLineThickness = 4.0
}


public extension W3WMargin {
  static let none:   W3WMargin =  0.0
  static let thin:   W3WMargin =  4.0
  static let light:  W3WMargin =  8.0
  static let medium: W3WMargin = 12.0
  static let bold:   W3WMargin = 16.0
  static let heavy:  W3WMargin = 24.0
}


public extension W3WPadding {
  static let none:   W3WPadding =  0.0
  static let single: W3WPadding =  1.0
  static let fine:   W3WPadding =  2.0
  static let thin:   W3WPadding =  4.0
  static let light:  W3WPadding =  8.0
  static let medium: W3WPadding = 12.0
  static let bold:   W3WPadding = 16.0
  static let heavy:  W3WPadding = 24.0
}


public extension W3WRowHeight {
  static let extraSmall       = W3WRowHeight(value: 32.0)
  static let small            = W3WRowHeight(value: 40.0)
  static let medium           = W3WRowHeight(value: 48.0)
  static let large            = W3WRowHeight(value: 64.0)
  static let extraLarge       = W3WRowHeight(value: 72.0)
  static let extraExtraLarge  = W3WRowHeight(value: 380.0)
}


public extension W3WShadow {
  static let none   = W3WShadow(opacity: 0.00, offset: 0.0, radius: 0.0)
  static let low    = W3WShadow(opacity: 0.33, offset: 0.0, radius: 5.0)
  static let medium = W3WShadow(opacity: 0.33, offset: 0.0, radius: 15.0)
  static let high   = W3WShadow(opacity: 0.33, offset: 0.0, radius: 30.0)
}
