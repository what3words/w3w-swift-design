//
//  File.swift
//
//
//  Created by Dave Duprey on 07/04/2022.
//
import CoreGraphics

#if os(macOS)
import AppKit
#endif

#if canImport(UIKit)
import UIKit
#endif


/// A collection of style settings that can be applied to a UIView
public class W3WStyle: CustomDebugStringConvertible, CustomStringConvertible {
//public class W3WStyle: NSObject, UITraitEnvironment {
  //public var traitCollection = UITraitCollection()
  //public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) { }
  
  public let border:        W3WLineThickness?
  public let cornerRadius:  W3WCornerRadius?
  public let shadow:        W3WShadow?
  public let fonts:         W3WFonts?
  public let padding:       W3WPadding?
  public let separator:     W3WLineThickness?
  public let rowHeight:     W3WRowHeight?
  //public let secondaryFont: UIFont?
  //public let margin:       W3WMargin?
  //public let overlay:      W3WOverlay?
  
  
  /// initiate with any number of optional parameters, all other settings will be ignored / left as default
  //public init(padding: W3WPadding? = nil, border: W3WBorder? = nil, cornerRadius: W3WCornerRadius? = nil, shadow: W3WDropShadow? = nil, overlay: W3WOverlay? = nil, font: UIFont? = nil) {
  //public init(border: W3WBorder? = nil, cornerRadius: W3WCornerRadius? = nil, padding: W3WPadding? = nil, margin: W3WMargin? = nil) {
  public init(border: W3WLineThickness? = nil, cornerRadius: W3WCornerRadius? = nil, shadow: W3WShadow? = nil, fonts: W3WFonts? = nil, padding: W3WPadding? = nil, separator: W3WLineThickness? = nil, rowHeight: W3WRowHeight? = nil) {
    self.border         = border
    self.cornerRadius   = cornerRadius
    self.shadow         = shadow
    self.fonts          = fonts
    self.padding        = padding
    self.separator      = separator
    self.rowHeight      = rowHeight
    //self.margin       = margin
    //self.shadow       = shadow
    //self.overlay     = overlay
  }
  
  
  init(style: W3WStyle?) {
    self.border         = style?.border
    self.cornerRadius   = style?.cornerRadius
    self.shadow         = style?.shadow
    self.fonts          = style?.fonts
    self.padding        = style?.padding
    self.separator      = style?.separator
    self.rowHeight      = style?.rowHeight
  }

  
  // MARK: Withs (builders)

  public func with(border: W3WLineThickness)   -> W3WStyle       { return W3WStyle(border: border, cornerRadius: cornerRadius, shadow: shadow, fonts: fonts, padding: padding) }
  public func with(shadow: W3WShadow)      -> W3WStyle     { return W3WStyle(border: border, cornerRadius: cornerRadius, shadow: shadow, fonts: fonts, padding: padding) }
  public func with(fonts: W3WFonts)           -> W3WStyle   { return W3WStyle(border: border, cornerRadius: cornerRadius, shadow: shadow, fonts: fonts, padding: padding) }
  public func with(padding: W3WPadding)         -> W3WStyle  { return W3WStyle(border: border, cornerRadius: cornerRadius, shadow: shadow, fonts: fonts, padding: padding) }
  public func with(cornerRadius: W3WCornerRadius) -> W3WStyle { return W3WStyle(border: border, cornerRadius: cornerRadius, shadow: shadow, fonts: fonts, padding: padding) }

  
  func update(view: UIView?) {
//    if let tableHeader = view as? W3WPaddedView {
//      update(tableHeader: tableHeader)
//    } else
    if let textField = view as? UITextField {
      update(textField: textField)
    } else if let label = view as? UILabel {
      update(label: label)
    } else if let button = view as? UIButton {
      update(button: button)
    } else if let cell      = view as? UITableViewCell {
      update(cell: cell)
    } else {
      update(basics: view)
    }
  }
  
  
  func update(basics view: UIView?) {
    if let border = border?.value {
      view?.layer.borderWidth = border
    }
    
    if let cornerRadius = cornerRadius?.value {
      view?.layer.cornerRadius = cornerRadius
    }
    
    if let shadow = shadow {
      view?.layer.shadowOpacity = Float(shadow.opacity)
      view?.layer.shadowOffset  = CGSize(width: shadow.offset, height: shadow.offset)
      view?.layer.shadowRadius  = shadow.radius
    }
  }
  
  
  func update(textField: UITextField) {
    update(basics: textField)
    
    if let f = fonts?.body {
      textField.font = f
    }
  }
  
  
  func update(searchBar: UISearchBar) {
    if let cr = cornerRadius {
      if #available(iOS 13.0, *) {
        searchBar.searchTextField.layer.cornerRadius = cr.value
      } else {
        searchBar.layer.cornerRadius = cr.value
      }
    }
  }

  
  func update(label: UILabel) {
    if let l = label as? W3WLabel, let fontStyle = l.fontStyle {
      if let f = fonts?[fontStyle] {
        label.font = f
      }
    } else {
      if let f = fonts?.body {
        label.font = f
      }
    }
  }
  
  
  func update(button: UIButton) {
    let space = W3WPadding.light.value
    button.imageView?.contentMode = .scaleAspectFit
    
    //button.imageEdgeInsets   = UIEdgeInsets(top: 0.0, left: space, bottom: 0.0, right: space)
    button.contentEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0,   bottom: 0.0, right: space)
    button.titleEdgeInsets   = UIEdgeInsets(top: 0.0, left: space, bottom: 0.0, right: -space)
    
    if let f = fonts?.body {
      button.titleLabel?.font = f
    }
    
    
//      let forContentPadding contentPadding: UIEdgeInsets,
//      let imageTitlePadding: CGFloat
//
//      self.contentEdgeInsets = UIEdgeInsets(
//          top: contentPadding.top,
//          left: contentPadding.left,
//          bottom: contentPadding.bottom,
//          right: contentPadding.right + imageTitlePadding
//        )
//        self.titleEdgeInsets = UIEdgeInsets(
//          top: 0,
//          left: imageTitlePadding,
//          bottom: 0,
//          right: -imageTitlePadding
//        )
    
    
    update(basics: button)
  }
  
  
  func update(cell: UITableViewCell) {
    if let f = fonts?.body {
      cell.textLabel?.font = f
    }
    if let f = fonts?.callout {
      cell.detailTextLabel?.font = f
    }
  }
  
  
//  func update(tableHeader: W3WPaddedView) {
//    let margin = padding?.value ?? W3WPadding.thin.value
//    tableHeader.wrappedView?.frame = tableHeader.bounds.inset(by: UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin))
//    update(basics: tableHeader)
//  }
  
  
  // TODO: implement W3WStyle.update(icon) 
  func update(icon: W3WIconView) {
    update(basics: icon)
    //icon.updateImage()
  }
  

//  func update(collectionCell: UICollectionViewCell) {
//    if let f = fonts?.body {
//      cell.textLabel?.font = f
//    }
//    if let f = fonts?.callout {
//      cell.detailTextLabel?.font = f
//    }
//  }
  
  
  

  
//  func scaleIfNesseary(font f:UIFont) -> UIFont {
//    var retval: UIFont
//
//    let fontScaleFactor = UIFontMetrics(forTextStyle: .body).scaledValue(for: 100.0) / 100.0
//
//    if let font = font {
//      retval = UIFont(descriptor: font.fontDescriptor, size: font.pointSize * fontScaleFactor)
//    }
//    else {
//      retval = .preferredFont(forTextStyle: .body)
//    }
//
//    return retval
//  }
  
  
  
  
  #if canImport(UIKit) && !os(watchOS)
  
  /// apply this style as best as possible to the UIView, and check for certain
  /// descendants and apply unique styles to them too
  public func apply(view: UIView) {
//    view.backgroundColor = colors?.background.current.uiColor
//
//    if let cr = cornerRadius {
//      view.layer.cornerRadius = cr.value
//    }
//
//    if let b = border {
//      view.layer.borderWidth = b.thickness.value
//      view.layer.borderColor = b.color.current.cgColor
//    }
//
//    if let m = padding?.value {
//      view.layoutMargins = UIEdgeInsets(top: m, left: m, bottom: m, right: m)
//    }
//
//    if let v = view as? UITextField {
//      v.textColor = colors?.foreground.current.uiColor
//    }
//
//    if let b = view as? UIButton {
//      b.setTitleColor(colors?.foreground.current.uiColor, for: .normal)
//    }
//
//    if let t = view as? UITextView {
//      t.textColor = colors?.foreground.current.uiColor
//    }
//
//    if let s = shadow {
//      view.layer.shadowColor = s.color.current.cgColor
//      view.layer.shadowOffset = CGSize(width: s.offset, height: s.offset)
//      view.layer.shadowRadius = s.radius
//      view.layer.shadowOpacity = Float(s.opacity)
//    }
  }
  
  #endif

//  static public func apply(style: W3WStyle, to view: UIView?, theme: W3WTheme = .light) {
//    
//    // if this view has it's own style handling
//    if let styleingView = view as? W3WStyleProtocol {
//      styleingView.apply(style: style, theme: theme)
//
//    // this view is unaware of W3WDesign and so we try our best with it
//    } else {
//      applyBasics(style: style, to: view, theme: theme)
//    }
//  }
//
//  
//  static func applyBasics(style: W3WStyle, to view: UIView?, theme: W3WTheme = .light) {
//    if let view = view {
//      view.backgroundColor = style.background?[theme].color
//      
//      if let cr = style.cornerRadius {
//        if cr == .verySoft {
//          view.layer.cornerRadius = min(view.frame.width, view.frame.height)
//        } else {
//          view.layer.cornerRadius = cr.value
//        }
//      }
//      
//      if let b = style.border {
//        view.layer.borderWidth = b.thickness.value
//        view.layer.borderColor = b.color.cgColor
//      }
//      
//      if let m = style.padding?.value {
//        view.layoutMargins = UIEdgeInsets(top: m, left: m, bottom: m, right: m)
//      }
//      
//      if let v = view as? UITextField {
//        v.textColor = style.forground?[theme].color
//      }
//      
//      if let b = view as? UIButton {
//        b.setTitleColor(style.forground?[theme].color, for: .normal)
//      }
//      
//      if let t = view as? UITextView {
//        t.textColor = style.forground?[theme].color
//      }
//      
//      if let s = style.shadow {
//        view.layer.shadowColor = s.color.cgColor
//        view.layer.shadowOffset = CGSize(width: s.offset, height: s.offset)
//        view.layer.shadowRadius = s.radius
//        view.layer.shadowOpacity = Float(s.opacity)
//      }
//    }
//  }
  
  
  public var description: String {
    return debugDescription
  }
  
  
  public var debugDescription: String {
    var retvals = [String]()
    
    if let b = border       { retvals.append("Border: "  + b.value.description) }
    if let c = cornerRadius { retvals.append("Corner: "  + c.value.description) }
    if let s = shadow       { retvals.append("Shadow: "  + s.radius.description) }
    if let f = fonts        { retvals.append("Font: "    + f.body.fontName + " " + f.body.pointSize.description) }
    if let p = padding      { retvals.append("Padding: " + p.value.description) }

    return String(describing: type(of: self)) + ": " + retvals.joined(separator: ", ")
  }

  
}


