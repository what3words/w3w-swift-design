//
//  File.swift
//  
//
//  Created by Dave Duprey on 30/06/2023.
//


import UIKit


public class W3WColors {
  
  var colors: [W3WSetTypes : W3WColorSet] = [:]
  
  //var current = W3WSetTypes.base
  
//  var baseSet: W3WColorSet
//  var buttonsSet: W3WColorSet?
//  var textFieldsSet: W3WColorSet?
//  var labelsSet: W3WColorSet?
  
//  public var foreground: W3WColor? { base.foreground }
//  public var background: W3WColor? { base.background }
//  public var tint: W3WColor? { base.tint }
//  public var secondary: W3WColor? { base.secondary }
//  public var brand: W3WColor? { base.brand }
//  public var highlight: W3WBasicColors? { base.highlight }
//  public var border: W3WColor? { base.border }
//  public var separator: W3WColor? { base.separator }
//  public var shadow: W3WColor? { base.shadow }
//  public var placeholder: W3WColor? { base.placeholder }
//  public var error: W3WBasicColors? { base.error }
//
  
  public var foreground: W3WColor? { base.foreground }
  public var background: W3WColor? { base.background }
  public var tint: W3WColor?        { base.tint }
  public var secondary: W3WColor?    { base.secondary }
  public var brand: W3WColor?          { base.brand }
  public var highlight: W3WBasicColors? { base.highlight }
  public var border: W3WColor?          { base.border }
  public var separator: W3WColor?      { base.separator }
  public var shadow: W3WColor?        { base.shadow }
  public var placeholder: W3WColor?  { base.placeholder }
  public var error: W3WBasicColors? { base.error }
  
  
  public init(foreground: W3WColor? = nil, background: W3WColor? = nil, tint: W3WColor? = nil, secondary: W3WColor? = nil, brand: W3WColor? = nil, highlight: W3WBasicColors? = nil, border: W3WColor? = nil, separator: W3WColor? = nil, shadow: W3WColor? = nil, placeholder: W3WColor? = nil, error: W3WBasicColors? = nil, buttons: W3WColorSet? = nil, textFields: W3WColorSet? = nil, labels: W3WColorSet? = nil, maps: W3WColorSet? = nil, cells: W3WColorSet? = nil, icons: W3WColorSet? = nil) {
    colors[.base] = W3WColorSet(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, error: error)
    
    if let b = buttons    { colors[.buttons]    = b }
    if let t = textFields { colors[.textFields] = t }
    if let l = labels     { colors[.labels]     = l }
    if let m = maps       { colors[.maps]       = m }
    if let c = cells      { colors[.cells]      = c }
    if let i = icons      { colors[.icons]      = i }
  }
  
  
  /// initialise with a foreground, background, highlight and secondary colour
  public init(base: W3WColorSet, buttons: W3WColorSet? = nil, textFields: W3WColorSet? = nil, labels: W3WColorSet? = nil, maps: W3WColorSet? = nil, cells: W3WColorSet? = nil, icons: W3WColorSet? = nil) {
    colors[.base] = base
    add(type: .buttons, colorSet: buttons)
    add(type: .textFields, colorSet: textFields)
    add(type: .labels, colorSet: labels)
    add(type: .maps, colorSet: maps)
    add(type: .cells, colorSet: cells)
    add(type: .icons, colorSet: icons)
  }
  
  
  public init(colors newColors: W3WColors) {
    for (setType, colorSet) in newColors.colors {
      self.colors[setType] = colorSet
    }
  }
  
  
  var base: W3WColorSet {  get { return colors[.base] ?? W3WColorSet() } }
//  public var textFields: W3WColorSet {  get { return colors[.textFields] ?? base } }
//  public var buttons:    W3WColorSet {  get { return colors[.buttons] ?? base    } }
//  public var labels:     W3WColorSet {  get { return colors[.labels] ?? base     } }
//  public var map:        W3WColorSet {  get { return colors[.map] ?? base        } }

  
  public func refactored(from: W3WSetTypes) -> W3WColors {
    let retval = W3WColors(colors: self)
    retval.colors[.base] = retval.colors[.textFields] ?? base
    return retval
  }

  
  func add(type: W3WSetTypes, colorSet: W3WColorSet?) {
    if let c = colorSet {
      colors[type] = c
    }
  }

  
  public func add(type: String, colorSet: W3WColorSet?) {
    if let c = colorSet {
      colors[.custom(type)] = c
    }
  }

  
  public subscript(set: W3WSetTypes) -> W3WColorSet {
    return colors[set] ?? base
  }
  
  
  public subscript(set: String) -> W3WColorSet {
    return colors[.custom(set)] ?? base
  }
  

  // MARK: With
  
  
//  public func with(foreground: W3WColor? = nil)  -> W3WColors { return W3WColors(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, error: error, buttons: self[.buttons], textFields: self[.textFields], labels: self[.labels], maps: self[.maps], cells: self[.cells], icons: self[.icons]) }
//  public func with(background: W3WColor? = nil)   -> W3WColors { return W3WColors(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, error: error, buttons: self[.buttons], textFields: self[.textFields], labels: self[.labels], maps: self[.maps], cells: self[.cells], icons: self[.icons]) }
//  public func with(tint:       W3WColor? = nil)    -> W3WColors { return W3WColors(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, error: error, buttons: self[.buttons], textFields: self[.textFields], labels: self[.labels], maps: self[.maps], cells: self[.cells], icons: self[.icons]) }
//  public func with(secondary:  W3WColor? = nil)     -> W3WColors { return W3WColors(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, error: error, buttons: self[.buttons], textFields: self[.textFields], labels: self[.labels], maps: self[.maps], cells: self[.cells], icons: self[.icons]) }
//  public func with(brand:      W3WColor? = nil)      -> W3WColors { return W3WColors(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, error: error, buttons: self[.buttons], textFields: self[.textFields], labels: self[.labels], maps: self[.maps], cells: self[.cells], icons: self[.icons]) }
//  public func with(highlight:  W3WBasicColors? = nil) -> W3WColors { return W3WColors(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, error: error, buttons: self[.buttons], textFields: self[.textFields], labels: self[.labels], maps: self[.maps], cells: self[.cells], icons: self[.icons]) }
//  public func with(border:     W3WColor? = nil)        -> W3WColors { return W3WColors(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, error: error, buttons: self[.buttons], textFields: self[.textFields], labels: self[.labels], maps: self[.maps], cells: self[.cells], icons: self[.icons]) }
//  public func with(separator:  W3WColor? = nil)        -> W3WColors { return W3WColors(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, error: error, buttons: self[.buttons], textFields: self[.textFields], labels: self[.labels], maps: self[.maps], cells: self[.cells], icons: self[.icons]) }
//  public func with(shadow:      W3WColor? = nil)       -> W3WColors { return W3WColors(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, error: error, buttons: self[.buttons], textFields: self[.textFields], labels: self[.labels], maps: self[.maps], cells: self[.cells], icons: self[.icons]) }
//  public func with(placeholder: W3WColor? = nil)       -> W3WColors { return W3WColors(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, error: error, buttons: self[.buttons], textFields: self[.textFields], labels: self[.labels], maps: self[.maps], cells: self[.cells], icons: self[.icons]) }
//  public func with(error:       W3WBasicColors? = nil) -> W3WColors { return W3WColors(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, error: error, buttons: self[.buttons], textFields: self[.textFields], labels: self[.labels], maps: self[.maps], cells: self[.cells], icons: self[.icons]) }
//  public func with(buttons:     W3WColorSet? = nil)   -> W3WColors { return W3WColors(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, error: error, buttons: buttons, textFields: self[.textFields], labels: self[.labels], maps: self[.maps], cells: self[.cells], icons: self[.icons]) }
//  public func with(textFields: W3WColorSet? = nil)   -> W3WColors { return W3WColors(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, error: error, buttons: self[.buttons], textFields: textFields, labels: self[.labels], maps: self[.maps], cells: self[.cells], icons: self[.icons]) }
//  public func with(labels:    W3WColorSet? = nil)  -> W3WColors { return W3WColors(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, error: error, buttons: self[.buttons], textFields: self[.textFields], labels: labels, maps: self[.maps], cells: self[.cells], icons: self[.icons]) }
//  public func with(maps:    W3WColorSet? = nil)  -> W3WColors { return W3WColors(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, error: error, buttons: self[.buttons], textFields: self[.textFields], labels: self[.labels], maps: maps, cells: self[.cells], icons: self[.icons]) }
//  public func with(cells:  W3WColorSet? = nil)  -> W3WColors { return W3WColors(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, error: error, buttons: self[.buttons], textFields: self[.textFields], labels: self[.labels], maps: self[.maps], cells: cells, icons: self[.icons]) }
//  public func with(icons: W3WColorSet? = nil)  -> W3WColors { return W3WColors(foreground: foreground, background: background, tint: tint, secondary: secondary, brand: brand, highlight: highlight, border: border, separator: separator, shadow: shadow, placeholder: placeholder, error: error, buttons: self[.buttons], textFields: self[.textFields], labels: self[.labels], maps: self[.maps], cells: self[.cells], icons: icons) }

  // convenience setters for base colorSet
  public func with(foreground: W3WColor? = nil)  -> W3WColors { return with(setType: .base, colorSet: colors[.base]?.with(foreground: foreground)) }
  public func with(background: W3WColor? = nil)   -> W3WColors { return with(setType: .base, colorSet: colors[.base]?.with(background: background)) }
  public func with(tint:       W3WColor? = nil)    -> W3WColors { return with(setType: .base, colorSet: colors[.base]?.with(tint: tint)) }
  public func with(secondary:  W3WColor? = nil)     -> W3WColors { return with(setType: .base, colorSet: colors[.base]?.with(secondary: secondary)) }
  public func with(brand:      W3WColor? = nil)      -> W3WColors { return with(setType: .base, colorSet: colors[.base]?.with(brand: brand)) }
  public func with(highlight:  W3WBasicColors? = nil) -> W3WColors { return with(setType: .base, colorSet: colors[.base]?.with(highlight: highlight)) }
  public func with(border:     W3WColor? = nil)        -> W3WColors { return with(setType: .base, colorSet: colors[.base]?.with(border: border)) }
  public func with(separator:  W3WColor? = nil)        -> W3WColors { return with(setType: .base, colorSet: colors[.base]?.with(separator: separator)) }
  public func with(shadow:      W3WColor? = nil)       -> W3WColors { return with(setType: .base, colorSet: colors[.base]?.with(shadow: shadow)) }
  public func with(placeholder: W3WColor? = nil)       -> W3WColors { return with(setType: .base, colorSet: colors[.base]?.with(placeholder: placeholder)) }
  public func with(error:       W3WBasicColors? = nil) -> W3WColors { return with(setType: .base, colorSet: colors[.base]?.with(error: error)) }

  // convenience setters for various colorSets
  public func with(buttons:    W3WColorSet? = nil) -> W3WColors { return with(setType: .buttons,    colorSet: buttons) }
  public func with(textFields: W3WColorSet? = nil) -> W3WColors { return with(setType: .textFields, colorSet: textFields) }
  public func with(labels:    W3WColorSet? = nil)  -> W3WColors { return with(setType: .labels,    colorSet: labels) }
  public func with(maps:    W3WColorSet? = nil)    -> W3WColors { return with(setType: .maps,     colorSet: maps) }
  public func with(cells:  W3WColorSet? = nil)    -> W3WColors  { return with(setType: .cells,   colorSet: cells) }
  public func with(icons: W3WColorSet? = nil)    -> W3WColors   { return with(setType: .icons,  colorSet: icons) }

  
  /// make a copy of this colors but with a different colorSet for one of the sets
  public func with(setType: W3WSetTypes, colorSet: W3WColorSet?) -> W3WColors {
    let retval = W3WColors(colors: self)
    retval.colors[setType] = colorSet
    return retval
  }

  // MARK: UI Colorisers


  // set colours specific to particular view derived types
  func update(view: UIView?) {
    if let h = view as? W3WHeaderCell {
      print("HERE")
    }
      
    if let t = view as? UITextField {
      self[.textFields].update(textField: t)
      
    } else if let s = view as? UISearchBar {
      self[.textFields].update(searchBar: s)
      
    } else if let b = view as? UIButton {
      self[.buttons].update(button: b)

    } else if let c = view as? UITableViewCell {
      self[.cells].update(cell: c)
      
    } else if let l = view as? UILabel {
      self[.labels].update(label: l)

    } else if let cell = view as? UITableViewCell {
      self[.cells].update(cell: cell)
      
    } else if let cell = view as? UICollectionViewCell {
      self[.cells].update(basics: cell)

    } else if let i = view as? W3WIconView {
      self[.icons].update(icon: i)
      
    } else {
      base.update(basics: view)
    }

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
  }


//  func update(basics view: UIView?) {
//    if let c = self[.base].background {
//      view?.backgroundColor = c.current.uiColor
//    }
//
//    if let t = self[.base].tint {
//      view?.tintColor = t.current.uiColor
//    }
//
//    if let b = self[.base].border {
//      view?.layer.borderColor = b.current.cgColor
//    }
//
//    if let s = self[.base].shadow {
//      view?.layer.shadowColor = s.current.cgColor
//    }
//  }
//
//
//  func update(label: UILabel) {
//    if let text = self[.labels].foreground {
//      if label.attributedText == nil {
//        label.textColor = text.current.uiColor
//      }
//    }
//    if let back = self[.labels].background {
//      label.backgroundColor = back.current.uiColor
//    }
//  }
//
//
//  func update(textField: UITextField) {
//    if let text = self[.textFields].foreground {
//      textField.textColor = text.current.uiColor
//    }
//    if let background = self[.textFields].background {
//      textField.backgroundColor = background.current.uiColor
//    }
//  }
//
//
//  func update(cell: UITableViewCell) {
//    if let text = self[.base].foreground {
//      cell.textLabel?.textColor = text.current.uiColor
//    }
//
//    if let subtext = self[.base].secondary {
//      cell.detailTextLabel?.textColor = subtext.current.uiColor
//    }
//
//    if let h = self[.base].highlight?.foreground {
//      cell.textLabel?.highlightedTextColor = h.current.uiColor
//      cell.detailTextLabel?.highlightedTextColor = h.current.uiColor
//    }
//
//    if let hb = self[.base].highlight?.background {
//      let selectedBackground = UIView(frame: cell.bounds)
//      selectedBackground.backgroundColor = hb.current.uiColor
//      cell.selectedBackgroundView = selectedBackground
//    }
//  }
//
//
//  func update(button: UIButton) {
//    if let text = self[.buttons].foreground {
//      button.setTitleColor(text.current.uiColor, for: .normal)
//
//      //if let b = button as? W3WButton {
//      //  b.design = b.theme?.with(colors: self[.buttons])
//      //} else {
//      //  button.imageView?.tintColor = text.current.uiColor
//      //}
//    }
//
//    if let f = self[.buttons].background {
//      button.backgroundColor = f.current.uiColor
//    }
//  }
//

  
  
}


//public protocol W3WColors {
//
//  var foreground: W3WColor? { get set }
//  var background: W3WColor? { get set }
//  var tint: W3WColor? { get set }
//  var secondary: W3WColor? { get set }
//  var brand: W3WColor? { get set }
//  var highlight: W3WBaseColors? { get set }
//  var border: W3WColor? { get set }
//  var separator: W3WColor? { get set }
//  var shadow: W3WColor? { get set }
//  var placeholder: W3WColor? { get set }
//  var error: W3WBaseColors? { get set }
//
//}


//public extension W3WColors {
//
//  // MARK: Accessors
//
//  var forLabels:     W3WColorSet? { asColorCollection().labels     ?? asColorSet() }
//  var forButtons:    W3WColorSet? { asColorCollection().buttons    ?? asColorSet() }
//  var forTextFields: W3WColorSet? { asColorCollection().textFields ?? asColorSet() }
//
//
//  func asColorSet() -> W3WColorSet {
//    if let colorCollection = self as? W3WColorCollection {
//      return colorCollection
//    } else if let colorSet = self as? W3WColorSet {
//      return colorSet
//    } else {
//      return W3WColorSet(colors: nil)
//    }
//  }
//
//
//  func asColorCollection() -> W3WColorCollection {
//    if let colorCollection = self as? W3WColorCollection {
//      return colorCollection
//    } else if let colorSet = self as? W3WColorSet {
//      return W3WColorCollection(base: colorSet)
//    } else {
//      return W3WColorCollection(base: nil)
//    }
//  }
//
//
//}
