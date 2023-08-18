//
//  File.swift
//  
//
//  Created by Dave Duprey on 15/08/2023.
//

import UIKit


public class W3WPaddedView: W3WView {


  // this view can optionally wrap another UIView to allow regular UIViews to interact with this w3w design library
  public var wrappedView: W3WViewProtocol?
  
  public init<ViewType: W3WViewProtocol>(view: ViewType? = nil, theme: W3WTheme? = nil) {
    super.init(theme: theme)
    set(theme: theme, position: position)
    set(view: view)
  }
  
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  
  public func set<ViewType: W3WViewProtocol>(view: ViewType?) {
    if let v = wrappedView {
      v.removeFromSuperview()
    }
    
    if let newView = view {
      wrappedView = newView
      addSubview(newView)

      let margin = theme?.style?.padding?.value ?? W3WPadding.thin.value
      let insets = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
      wrappedView?.position = .center(inset: insets)
    }
  }
  
  
  
  
  
  
  
  
  
  // W3WSettings.autosuggestResultsText


//  public init(text: W3WString, theme: W3WTheme? = nil) {
//    super.init(view: W3WLabel(text: text, theme: theme), theme: theme)
//    set(text: text)
//  }
//
//
//  public required init?(coder: NSCoder) {
//    super.init(coder: coder)
//  }
//
//
//  public func set(text: W3WString) {
//    if let label = wrappedView as? W3WLabel {
//      label.attributedText = text.asAttributedString()
//    }
//  }
  
  
//  open override func layoutSubviews() {
//    super.updateView()
//    //wrappedView?.updateView()
//
////    let margin = theme?.style?.padding?.value ?? W3WPadding.thin.value
////    let insets = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
////
////    if let wv = wrappedView as? W3WView {
////      wv.position = .center(inset: insets)
////      wv.updateView()
////
////    } else {
////      wrappedView?.frame = bounds.inset(by: UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin))
////    }
//
//    //let margin = theme?.style?.padding?.value ?? W3WPadding.thin.value
//    //wrappedView?.frame = bounds.inset(by: UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin))
//  }

}



