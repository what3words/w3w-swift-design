//
//  File.swift
//  
//
//  Created by Dave Duprey on 19/08/2023.
//

#if canImport(UIKit)
import UIKit


// private extension to easily color and style UIViews
public extension UIView {

  
  func apply(scheme: W3WScheme?, set: W3WSetTypes = .base) {
    if let colors = scheme?.colors {
      apply(colors: colors)
    }
    
    if let styles = scheme?.styles {
      apply(styles: styles)
    }
  }
  
  
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
//    if let s = self as? UISearchBar {
//      if let background = colors[.textFields].background {
//        if #available(iOS 13.0, *) {
//          s.searchTextField.backgroundColor = background.current.uiColor
//        } else {
//          s.backgroundColor = background.current.uiColor
//        }
//      }
//    }
  }
  
  
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
