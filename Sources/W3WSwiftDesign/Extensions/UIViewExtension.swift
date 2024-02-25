//
//  File.swift
//  
//
//  Created by Dave Duprey on 19/08/2023.
//

#if canImport(UIKit)
import UIKit


/// private extension to easily color and style UIViews
/// this is used by a lot of the views to set colours and style
public extension UIView {

  
  /// Apply both colours and style
  /// - Parameters:
  ///   - scheme: a scheme containing colours and style information
  func apply(scheme: W3WScheme?) {
    if let colors = scheme?.colors {
      apply(colors: colors)
    }
    
    if let styles = scheme?.styles {
      apply(styles: styles)
    }
  }
  
  
  /// Apply colours to the view
  /// - Parameters:
  ///   - scheme: a scheme containing colours and style information
  func apply(colors: W3WColors?) {
    if let c = colors?.background {
      backgroundColor = c.current.uiColor
    }

    if let t = colors?.tint {
      tintColor = t.current.uiColor
    }

    if let b = colors?.border {
      layer.borderColor = b.current.cgColor
    }

    if let s = colors?.shadow {
      layer.shadowColor = s.current.cgColor
    }
    
    //  special case to get inside a searchcontroller
    if let s = self as? UISearchBar {
      if let background = colors?.background {
        if #available(iOS 13.0, *) {
          s.searchTextField.backgroundColor = background.current.uiColor
        } else {
          s.backgroundColor = background.current.uiColor
        }
      }
    }
  }
  
  
  /// Apply styles to the view
  /// - Parameters:
  ///   - scheme: a scheme containing colours and style information
  func apply(styles: W3WStyles?) {
    if let border = styles?.border?.value {
      layer.borderWidth = border
    }

    if let cornerRadius = styles?.cornerRadius?.value {
      layer.cornerRadius = cornerRadius
    }

    if let shadow = styles?.shadow {
      layer.shadowOpacity = Float(shadow.opacity)
      layer.shadowOffset  = CGSize(width: shadow.offset, height: shadow.offset)
      layer.shadowRadius  = shadow.radius
    }
  }
  
}


#endif
