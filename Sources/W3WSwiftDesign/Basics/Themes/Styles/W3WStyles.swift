//
//  W3WStyles.swift
//  
//
//  Created by Dave Duprey on 09/05/2023.
//

import UIKit


public class W3WStyles: CustomDebugStringConvertible, CustomStringConvertible {
  
  var styles: [W3WSetTypes : W3WStyle] = [:]
  
  //var current = W3WSetTypes.base

  
  public var border:       W3WLineThickness? { return base.border }
  public var cornerRadius: W3WCornerRadius? { return base.cornerRadius }
  public var shadow:       W3WShadow? { return base.shadow }
  public var fonts:        W3WFonts? { return base.fonts }
  public var padding:      W3WPadding? { return base.padding }
  public var separator:    W3WLineThickness? { return base.separator }
  public var rowHeight:    W3WRowHeight? { return base.rowHeight }

  
  var base: W3WStyle {  get { return styles[.base] ?? W3WStyle() } }


  public init(border: W3WLineThickness? = nil, cornerRadius: W3WCornerRadius? = nil, shadow: W3WShadow? = nil, fonts: W3WFonts? = nil, padding: W3WPadding? = nil, separator: W3WLineThickness? = nil, rowHeight: W3WRowHeight? = nil, buttons: W3WStyle? = nil, textFields: W3WStyle? = nil, labels: W3WStyle? = nil, cells: W3WStyle? = nil, icons: W3WStyle? = nil) {
    add(type: .base, style: W3WStyle(border: border, cornerRadius: cornerRadius, shadow: shadow, fonts: fonts, padding: padding, separator: separator, rowHeight: rowHeight))
    add(type: .buttons, style: buttons)
    add(type: .textFields, style: textFields)
    add(type: .labels, style: labels)
    add(type: .cells, style: cells)
    add(type: .icons, style: icons)
  }

  
  public init(base: W3WStyle, buttons: W3WStyle? = nil, textFields: W3WStyle? = nil, labels: W3WStyle? = nil, cells: W3WStyle? = nil, icons: W3WStyle? = nil) {
    add(type: .base, style: base)
    add(type: .buttons, style: buttons)
    add(type: .textFields, style: textFields)
    add(type: .labels, style: labels)
    add(type: .cells, style: cells)
    add(type: .icons, style: icons)
  }
  
  
  public init(styles newStyles: W3WStyles) {
    for (setType, style) in newStyles.styles {
      self.styles[setType] = style
    }
  }
  
  
  public func refactored(from: W3WSetTypes) -> W3WStyles {
    let retval = W3WStyles(styles: self)
    retval.styles[.base] = retval.styles[.textFields] ?? base
    return retval
  }
  
  
  func add(type: W3WSetTypes, style: W3WStyle?) {
    if let s = style {
      styles[type] = s
    }
  }
  
  
  public func add(type: String, style: W3WStyle?) {
    if let s = style {
      styles[.custom(type)] = s
    }
  }
  
  
  public subscript(set: W3WSetTypes) -> W3WStyle {
    return styles[set] ?? base
  }
  
  
  public subscript(set: String) -> W3WStyle {
    return styles[.custom(set)] ?? base
  }


  
  // MARK: Withs (builders)
  
  public func with(border: W3WLineThickness)   -> W3WStyles    { return W3WStyles(border: border, cornerRadius: cornerRadius, shadow: shadow, fonts: fonts, padding: padding, rowHeight: rowHeight) }
  public func with(shadow: W3WShadow)         -> W3WStyles    { return W3WStyles(border: border, cornerRadius: cornerRadius, shadow: shadow, fonts: fonts, padding: padding, rowHeight: rowHeight) }
  public func with(fonts: W3WFonts)           -> W3WStyles    { return W3WStyles(border: border, cornerRadius: cornerRadius, shadow: shadow, fonts: fonts, padding: padding, rowHeight: rowHeight) }
  public func with(padding: W3WPadding)         -> W3WStyles   { return W3WStyles(border: border, cornerRadius: cornerRadius, shadow: shadow, fonts: fonts, padding: padding, rowHeight: rowHeight) }
  public func with(cornerRadius: W3WCornerRadius) -> W3WStyles  { return W3WStyles(border: border, cornerRadius: cornerRadius, shadow: shadow, fonts: fonts, padding: padding, rowHeight: rowHeight) }
  public func with(rowHeight: W3WRowHeight)        -> W3WStyles  { return W3WStyles(border: border, cornerRadius: cornerRadius, shadow: shadow, fonts: fonts, padding: padding, rowHeight: rowHeight) }

  // convenience setters for various styles
  public func with(buttons:    W3WStyle? = nil) -> W3WStyles { return with(setType: .buttons,    style: buttons) }
  public func with(textFields: W3WStyle? = nil) -> W3WStyles { return with(setType: .textFields, style: textFields) }
  public func with(labels:    W3WStyle? = nil)  -> W3WStyles { return with(setType: .labels,    style: labels) }
  public func with(maps:    W3WStyle? = nil)    -> W3WStyles { return with(setType: .maps,     style: maps) }
  public func with(cells:  W3WStyle? = nil)    -> W3WStyles  { return with(setType: .cells,   style: cells) }
  public func with(icons: W3WStyle? = nil)    -> W3WStyles   { return with(setType: .icons,  style: icons) }

  
  /// make a copy of this colors but with a different colorSet for one of the sets
  public func with(setType: W3WSetTypes, style: W3WStyle?) -> W3WStyles {
    let retval = W3WStyles(styles: self)
    retval.styles[setType] = style
    return retval
  }

  
  func update(view: UIView?) {
    if let textField = view as? UITextField {
      self[.textFields].update(textField: textField)
      
    } else if let s = view as? UISearchBar {
      self[.textFields].update(searchBar: s)

    } else if let label = view as? UILabel {
      self[.labels].update(label: label)
      
    } else if let button = view as? UIButton {
      self[.buttons].update(button: button)
      
    } else if let cell = view as? UITableViewCell {
      self[.cells].update(cell: cell)
      
    } else if let cell = view as? UICollectionViewCell {
      self[.cells].update(basics: cell)
      
    } else if let icon = view as? W3WIconView {
      self[.icons].update(icon: icon)
      
    } else {
      base.update(basics: view)
    }
  }
  

  public var description: String {
    return debugDescription
  }
  
  
  public var debugDescription: String {
    var retval = ""
    
    for (key,style) in styles {
      retval += "\(key): \(style.description) "
    }
    
    return retval
  }
  
  
}



//  public var buttons: W3WStyle?
//  public var textFields: W3WStyle?
//  public var labels: W3WStyle?


//  public var textFields: W3WStyle {  get { return textFields ?? self } }
//  public var buttons:    W3WStyle {  get { return buttons ?? self    } }
//  public var labels:     W3WStyle {  get { return labels ?? self     } }




//  func update(basics view: UIView?) {
//    base.update(view: view)
////    if let border = border?.value {
////      view?.layer.borderWidth = border
////    }
////
////    if let cornerRadius = cornerRadius?.value {
////      view?.layer.cornerRadius = cornerRadius
////    }
////
////    if let shadow = shadow {
////      view?.layer.shadowOpacity = Float(shadow.opacity)
////      view?.layer.shadowOffset  = CGSize(width: shadow.offset, height: shadow.offset)
////      view?.layer.shadowRadius  = shadow.radius
////    }
//  }
//
//
//  func update(textField: UITextField) {
//    self[.textFields].update(textField: textField)
////    if let f = fonts?.body {
////      textField.font = f
////    }
//  }
//
//
//  func update(label: UILabel) {
//    self[.labels].update(label: label)
////    if let f = fonts?.body {
////      label.font = f
////    }
//  }
//
//
//  func update(button: UIButton) {
//    self[.buttons].update(button: button)
////    button.imageView?.contentMode = .scaleAspectFit
////    //button.imageView?.frame = CGRect(origin: .zero, size: CGSize(width: 16.0, height: 16.0))
////    button.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: W3WPadding.thin.value, bottom: 0.0, right: W3WPadding.thin.value)
////    button.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: W3WPadding.thin.value, bottom: 0.0, right: W3WPadding.thin.value)
////    if let f = fonts?.body {
////      button.titleLabel?.font = f
////    }
//  }
//
//
//  func update(cell: UITableViewCell) {
//    self[.cells].update(cell: cell)
////    if let f = fonts?.body {
////      cell.textLabel?.font = f
////    }
////    if let f = fonts?.callout {
////      cell.detailTextLabel?.font = f
////    }
//  }


