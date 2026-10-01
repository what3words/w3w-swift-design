//
//  W3WLayoutSize.swift
//  w3w-swift-design
//
//  Created by Kaley Nguyen on 01/10/2026.
//

import CoreGraphics


/// Size checks against the space a view has, instead of the screen size
public enum W3WLayoutSize {

  public static let narrowWidth: CGFloat = 320
  public static let shortHeight: CGFloat = 667


  /// Zero (not laid out yet) is never narrow
  public static func isNarrowWidth(_ size: CGSize) -> Bool {
    return size.width > 0 && size.width <= narrowWidth
  }


  /// Zero (not laid out yet) is never short
  public static func isShortHeight(_ size: CGSize) -> Bool {
    return size.height > 0 && size.height <= shortHeight
  }
}


#if canImport(UIKit)
import UIKit

public extension UIView {

  /// Read during layout; bounds are zero in `init`
  var isNarrowWidth: Bool {
    return W3WLayoutSize.isNarrowWidth(bounds.size)
  }


  /// Read during layout; bounds are zero in `init`
  var isShortHeight: Bool {
    return W3WLayoutSize.isShortHeight(bounds.size)
  }
}

#endif
