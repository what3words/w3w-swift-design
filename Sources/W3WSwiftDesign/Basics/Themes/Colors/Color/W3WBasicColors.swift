//
//  File.swift
//  
//
//  Created by Dave Duprey on 05/05/2022.
//

import CoreGraphics

#if canImport(UIKit)
  import UIKit
#endif

#if canImport(AppKit)
import AppKit
#endif


@available(*, deprecated, renamed: "W3WBaseColors")
typealias W3WTwoColor = W3WBaseColors

@available(*, deprecated, renamed: "W3WBasicColors")
public typealias W3WBaseColors = W3WBasicColors


/// Holds a foreground and a background
public class W3WBasicColors {
  
  public var foreground: W3WColor?
  public var background: W3WColor?
  
  
  /// initialise with a foreground and background color
  public init(foreground: W3WColor? = nil, background: W3WColor? = nil) {
    self.foreground = foreground
    self.background = background
  }
  

  /// initialise with a foreground and background CGColor
  public init(cgForeground: CGColor? = nil, cgBackground: CGColor? = nil) {
    self.foreground = (cgForeground != nil) ? W3WColor(cgColor: cgForeground!) : nil
    self.background = (cgBackground != nil) ? W3WColor(cgColor: cgBackground!) : nil
  }

  
#if canImport(UIKit)
  public init(uiForeground: UIColor? = nil, uiBackground: UIColor? = nil) {
    self.foreground = (uiForeground != nil) ? W3WColor(uiColor: uiForeground!) : nil
    self.background = (uiBackground != nil) ? W3WColor(uiColor: uiBackground!) : nil
  }
#endif

#if os(macOS)
  public init(nsForeground: NSColor? = nil, nsBackground: NSColor? = nil) {
    self.foreground = (nsForeground != nil) ? W3WColor(nsColor: nsForeground!) : nil
    self.background = (nsBackground != nil) ? W3WColor(nsColor: nsBackground!) : nil
  }
#endif
  
  /// return the same colorset the foreground color changed
  public func with(foreground: W3WColor? = nil) -> W3WColorSet {
    return W3WColorSet(foreground: foreground, background: background)
  }
  
  
  /// return the same colorset the background color changed
  public func with(background: W3WColor? = nil) -> W3WColorSet {
    return W3WColorSet(foreground: foreground, background: background)
  }
  
  
//  public func findTint() -> W3WColor? {
//    if let c = self as? W3WColorSet {
//      return c.tint
//    }
//    if let c = self as? W3WColorSet {
//      return c.tint
//    }
//    
//    return foreground
//  }
//  
//  
//  // set colours specific to particular view derived types
//  func update(view: UIView?) {
//    if let t = view as? UITextField {
//      update(textField: t)
//    } else if let b = view as? UIButton {
//      update(button: b)
//    } else if let c = view as? UITableViewCell {
//      update(cell: c)
//    } else  if let l = view as? UILabel {
//      update(label: l)
//    } else {
//      update(basics: view)
//    }
//  }
//  
//  
//  func update(basics view: UIView?) {
//    if let c = background {
//      view?.backgroundColor = c.current.uiColor
//    }
//    
//    if let t = self.asColorScheme().tint {
//      view?.tintColor = t.current.uiColor
//    }
//    
//    if let b = self.asColorScheme().border {
//      view?.layer.borderColor = b.current.cgColor
//    }
//    
//    if let s = self.asColorScheme().shadow {
//      view?.layer.shadowColor = s.current.cgColor
//    }
//  }
//  
//  
//  func update(label: UILabel) {
//    if let text = self.asColorCollection().labels?.foreground ?? self.foreground {
//      if label.attributedText == nil {
//        label.textColor = text.current.uiColor
//      }
//    }
//    if let back = self.asColorCollection().labels?.background ?? self.background {
//      label.backgroundColor = back.current.uiColor
//    }
//  }
//  
//  
//  func update(textField: UITextField) {
//    if let text = asColorCollection().textFields?.foreground ?? foreground {
//      textField.textColor = text.current.uiColor
//    }
//    if let background = asColorCollection().textFields?.background ?? background {
//      textField.backgroundColor = background.current.uiColor
//    }
//  }
//  
//  
//  func update(cell: UITableViewCell) {
//    if let text = foreground {
//      cell.textLabel?.textColor = text.current.uiColor
//    }
//    
//    if let subtext = asColorSet().secondary ?? foreground {
//      cell.detailTextLabel?.textColor = subtext.current.uiColor
//    }
//
//    if let h = self.asColorScheme().highlight?.foreground {
//      cell.textLabel?.highlightedTextColor = h.current.uiColor
//      cell.detailTextLabel?.highlightedTextColor = h.current.uiColor
//    }
//
//    if let hb = self.asColorScheme().highlight?.background {
//      let selectedBackground = UIView(frame: cell.bounds)
//      selectedBackground.backgroundColor = hb.current.uiColor
//      cell.selectedBackgroundView = selectedBackground
//    }
//  }
//  
//  
//  func update(button: UIButton) {
//    if let text = foreground {
//      button.setTitleColor(text.current.uiColor, for: .normal)
//    }
//    
//    if let f = self.asColorScheme().highlight?.foreground {
//      button.setTitleColor(f.current.uiColor, for: .highlighted)
//    }
//  }
//  
//  
//  // MARK: Conversions
//  
//
//  public func asColorSet() -> W3WColorSet {
//    if let colorSet = self as? W3WColorSet {
//      return colorSet
//    } else {
//      return W3WColorSet(colors: self)
//    }
//  }
//
//  
//  public func asColorCollection() -> W3WColorCollection {
//    if let colorCollection = self as? W3WColorCollection {
//      return colorCollection
//    } else {
//      return W3WColorCollection(base: self.asColorSet())
//    }
//  }
//  
}

