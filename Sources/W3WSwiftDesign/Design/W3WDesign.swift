//
//  File.swift
//  
//
//  Created by Dave Duprey on 17/03/2023.
//

import UIKit



public class W3WDesign: CustomDebugStringConvertible, CustomStringConvertible {
    
  /// weakly head reference to the view to apply design to
  //public weak var owner: UIView?

  /// colours to use
  public var colors: W3WBaseColors?

  /// styles to apply
  public var style: W3WStyle?

  
  /// if the colors are a W3WColorSet, then return it as that otherwise nil
  public var colorSet: W3WColorSet? {
    return colors as? W3WColorSet
  }
  
  /// if the colors are a W3WColorScheme, then return it as that otherwise nil
  public var colorScheme: W3WColorScheme? {
    return colors as? W3WColorScheme
  }

  
  /// Init
  
  public init(colors: W3WBaseColors? = nil, style: W3WStyle? = nil) {
    self.colors = colors
    self.style = style
  }
  
  
  public init(design: W3WDesign?) {
    self.colors = design?.colors
    self.style = design?.style
  }
  
  
  public func update(view: UIView) {
    style?.update(view: view)
    colors?.update(view: view)
  }

  
//  updateStyle(view: view)
//  updateColors(view: view)
//
//
//  func updateStyle(view: UIView) {
//    style?.update(view: view)
//  }
//
//
//  func updateColors(view: UIView) {
//    colors?.update(view: view)
//  }
  

  
//textField.adjustsFontForContentSizeCategory = true
//textField.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
//      if let font = style?.font {
//        label.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font)
//        //label.adjustsFontForContentSizeCategory = true
//      }
////      label.font = .preferredFont(forTextStyle: .body)
//
//    if let margin = style?.margin?.value {
//      owner?.edgeInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
//    }
    
//    if let padding = style?.padding?.value {
//      owner?.bounds = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
//    }
  
  

  public func with(colors: W3WBaseColors?) -> W3WDesign {
    return W3WDesign(colors: colors, style: style)
  }
  
  
  public func with(style: W3WStyle?) -> W3WDesign {
    return W3WDesign(colors: colors, style: style)
  }
  
  
  public var description: String {
    return debugDescription
  }
  
  
  public var debugDescription: String {
    var retvals = [String]()
    
    if let d = style?.description {
      retvals.append(d)
    }
    
    if let c = colors?.description {
      retvals.append(c)
    }
    
    return retvals.joined(separator: "\n")
  }

  
}

