//
//  File.swift
//  
//
//  Created by Dave Duprey on 17/03/2023.
//

import UIKit


extension W3WViewPosition {
  
  static public func width(_ width: CGFloat) -> W3WViewPosition {
    return W3WViewPosition(width: width)
  }
  
  
  static public func height(_ height: CGFloat) -> W3WViewPosition {
    return W3WViewPosition(height: height)
  }
  
  
  static public func expand() -> W3WViewPosition {
    return W3WViewPosition(expand: true)
  }
  
  
  static public func absolute(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> W3WViewPosition {
    return Self.absolute(origin: CGPoint(x: x, y: y), size: CGSize(width: width, height: height))
  }
  
  
  static public func absolute(origin: CGPoint, size: CGSize) -> W3WViewPosition {
    return Self.absolute(rect: CGRect(origin: origin, size: size))
  }
  
  
  static public func absolute(rect: CGRect) -> W3WViewPosition {
    W3WViewPosition() { _,_ in return rect }
  }
                         
                         
  /// convenince function to place a textfield at the top of a narrow view
  static public func top(width: CGFloat? = nil, height: CGFloat = 32.0, insetBy: CGFloat = 16.0) -> W3WViewPosition {
    return W3WViewPosition() { parent, this in
      return CGRect(
        x: (parent?.safeAreaInsets.left ?? 0.0) + insetBy,
        y: (parent?.safeAreaInsets.top ?? 0.0)  + insetBy,
        width: width ?? (parent?.frame.width ?? 0.0) - (parent?.safeAreaInsets.left ?? 0.0) - (parent?.safeAreaInsets.right ?? 0.0) - insetBy * 2.0,
        height: height
      )
    }
  }
  
  
  
  /// conveniece function to place an view below another
  static public func place(below: UIView, margin: CGFloat = 8.0, width: CGFloat? = nil, height: CGFloat? = nil) -> W3WViewPosition {
    return W3WViewPosition() { parent, this in
      weak var parent = below
      return CGRect(
        x: (parent?.frame.minX ?? 0.0),
        y: (parent?.frame.maxY ?? 0.0) + margin,
        width: width ?? (parent?.frame.width ?? 0.0),
        height: height ?? (parent?.frame.height ?? 0.0)
      )
    }
  }
  
  
  /// conveniece function to place an view below another
  static public func place(above: UIView, margin: CGFloat = 8.0, width: CGFloat? = nil, height: CGFloat? = nil) -> W3WViewPosition {
    return W3WViewPosition() { parent, this in
      weak var parent = above
      return CGRect(
        x: (parent?.frame.minX ?? 0.0),
        y: (parent?.frame.minY ?? 0.0) - margin - (parent?.frame.height ?? 0.0),
        width: width ?? (parent?.frame.width ?? 0.0),
        height: height ?? (parent?.frame.height ?? 0.0)
      )
    }
  }
  
  
  /// conveniece function to place an view below another
  static public func place(leftOf: UIView, margin: CGFloat = 8.0, width: CGFloat? = nil, height: CGFloat? = nil) -> W3WViewPosition {
    return W3WViewPosition() { parent, this in
      weak var parent = leftOf
      return CGRect(
        x: (parent?.frame.minX ?? 0.0) - margin - (parent?.frame.width ?? 0.0),
        y: (parent?.frame.minY ?? 0.0),
        width: width ?? (parent?.frame.width ?? 0.0),
        height: height ?? (parent?.frame.height ?? 0.0)
      )
    }
  }
  
  
  /// conveniece function to place an view below another
  static public func place(rightOf: UIView, margin: CGFloat = 8.0, width: CGFloat? = nil, height: CGFloat? = nil) -> W3WViewPosition {
    return W3WViewPosition() { parent, this in
      weak var parent = rightOf
      return CGRect(
        x: (parent?.frame.maxX ?? 0.0) + margin,
        y: (parent?.frame.minY ?? 0.0),
        width: width ?? (parent?.frame.width ?? 0.0),
        height: height ?? (parent?.frame.height ?? 0.0)
      )
    }
  }

  
  
  /// convenince function to place a view in the center of a view
  static public func center(size: CGSize) -> W3WViewPosition {
    return W3WViewPosition() { parent, this in
      return CGRect(
        x: (parent?.center.x ?? 0.0) - size.width / 2.0,
        y: (parent?.center.y ?? 0.0) - size.height / 2.0,
        width: size.width,
        height: size.height
      )
    }
  }
  
  
  /// convenince function to place a view in the center of a view
  static public func center(inset: UIEdgeInsets) -> W3WViewPosition {
    return W3WViewPosition() { parent, this in
      return CGRect(
        x: (parent?.frame.minX ?? 0.0) + inset.left,
        y: (parent?.frame.minY ?? 0.0) + inset.top,
        width: (parent?.frame.size.width ?? 0.0) - inset.left - inset.right,
        height: (parent?.frame.size.height ?? 0.0) - inset.top - inset.bottom
      )
    }
  }

  
  static public func inset(by: CGFloat) -> W3WViewPosition {
    return W3WViewPosition() { parent, this in
      return parent?.bounds.inset(by: UIEdgeInsets(top: by, left: by, bottom: by, right: by)) ?? this.frame
    }
  }

  
  static public func inset(by: UIEdgeInsets) -> W3WViewPosition {
    return W3WViewPosition() { parent, this in
      return parent?.bounds.inset(by: by) ?? this.frame
    }
  }

  
  static public func inset(by: W3WPadding) -> W3WViewPosition {
    return W3WViewPosition() { parent, this in
      return parent?.bounds.inset(by: by.insets) ?? this.frame
    }
  }

  
  static public func sideColumnLeft(width: CGFloat = 300.0, insetBy: W3WPadding = .bold, left: Bool = true) -> W3WViewPosition {
    return W3WViewPosition() { parent, this in
      if let p = parent {
        return CGRect(
          x: p.safeAreaInsets.left + insetBy.left,
          y: p.safeAreaInsets.top  + insetBy.top,
          width: width,
          height: p.frame.height - (insetBy.bottom + insetBy.top) * 3.0 - p.safeAreaInsets.top - p.safeAreaInsets.bottom
        )
      } else {
        return .zero
      }
    }
  }

  static public func insideLeading(insetBy: W3WPadding = .none) -> W3WViewPosition {
    return W3WViewPosition() { parent, this in
      let size = (parent?.frame.height ?? W3WPadding.fine.value) - insetBy.top - insetBy.bottom
      return CGRect(x: insetBy.left, y: insetBy.top, width: size, height: size)
    }
  }
  

  static public func bottom(insetBy: W3WPadding = .none, height: CGFloat? = nil) -> W3WViewPosition {
    return W3WViewPosition() { parent, this in
      let newHeight = height ?? this.frame.height

      let origin = CGPoint(x: insetBy.left, y: insetBy.top + (parent?.frame.height ?? 1024.0) - newHeight)
      let size   = CGSize(width: (parent?.frame.width ?? 320.0) - insetBy.left - insetBy.right, height: newHeight - insetBy.top - insetBy.bottom)

      return CGRect(origin: origin, size: size)
    }
  }
  
}
