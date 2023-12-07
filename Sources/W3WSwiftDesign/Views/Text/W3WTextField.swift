//
//  File.swift
//
//
//  Created by Dave Duprey on 16/05/2022.
//

import Foundation
import UIKit
import W3WSwiftThemes


open class W3WTextField: UITextField, UITextFieldDelegate, W3WViewProtocol { //}, W3WStyleProtocol {

  // MARK: W3WViewProtocol
  
  public var scheme: W3WScheme?
  public var position: W3WViewPosition?
  
  // MARK: Vars
  
  public var onTextChange: (String, String) -> () = { _,_ in }
  
  public var onEditingBegan: () -> () = { }
  
  public var onEditingEnded: () -> () = { }
  
  public var onTextAppeared: () -> () = { }

  public var onTextDisappeared: () -> () = { }

  var lastFontPointSize = CGFloat(0.0)

  // MARK: Init
  
  
  public init(scheme: W3WScheme? = nil) {
    super.init(frame: .w3wWhatever)
    //frame = position?.position(superview, self) ?? .w3wWhatever
    position?.position(superview, self)
    set(scheme: scheme)
    configure()
  }
  


  public override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    configure()
  }
  
  
  /// set up the UI stuff and more
  func configure() {
    delegate = self
    
    // set up this view
    //placeholder = "Search"
    clearButtonMode = .always
    
    updateView()
  }


  // MARK: Accessors

  
  public func leadingView(view: UIView?) {
    if let v = view {
      leftView = v
      leftViewMode = .always
    } else {
      leftView = nil
      leftViewMode = .never
    }
  }
  
  
  public func trailingView(view: UIView?) {
    if let v = view {
      rightView = v
      rightViewMode = .always
    } else {
      rightView = nil
      rightViewMode = .never
    }
  }
  
  
  public func set(text: String) {
    self.text = text
    resignFirstResponder()
  }
  
  
  // MARK: UITextFieldDelegate
  
  
  /// called when the text contents change
  open func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
    if let t = text {
      let newText = t.replacingCharacters(in: Range(range, in: t)!, with: string)

      onTextChange(t, newText)
      
      if t.count == 0 && newText.count != 0 {
        textAppeared()
      }
      if t.count != 0 && newText.count == 0 {
        textDisappeared()
      }
    }
    
    return true
  }
  
  
  open func textAppeared() {
    onTextAppeared()
  }
  
  
  open func textDisappeared() {
    onTextDisappeared()
  }
  
  
  public func textFieldDidBeginEditing(_ textField: UITextField) {
    onEditingBegan()
  }
  
  public func textFieldDidEndEditing(_ textField: UITextField) {
    onEditingEnded()
  }
  

  
  // MARK: UI Overrides
  
  
  public override func textRect(forBounds bounds: CGRect) -> CGRect {
    var newBounds = super.textRect(forBounds: bounds)

    if leftView == nil {
      newBounds = newBounds.inset(by: UIEdgeInsets(top: 0.0, left: W3WPadding.light.value, bottom: 0.0, right: W3WPadding.light.value))
    } else {
      newBounds = newBounds.inset(by: UIEdgeInsets(top: 0.0, left: bounds.height * 0.125, bottom: 0.0, right: bounds.height * 0.375))
    }
    
    return newBounds
  }

  
  public override func editingRect(forBounds bounds: CGRect) -> CGRect {
    return textRect(forBounds: bounds)
  }
  
  // Provides left padding for images
  public override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
    return CGRect(x: bounds.height * 0.25, y: bounds.height * 0.25, width: bounds.height * 0.5, height: bounds.height * 0.5)
  }
  
  
  // Provides left padding for images
  public override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
    return CGRect(x: bounds.width - bounds.height * 0.75, y: bounds.height * 0.25, width: bounds.height * 0.5, height: bounds.height * 0.5)
  }
  
  
  
  // MARK: Layout
  
  
  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    updateView()
  }

  
  open override func layoutSubviews() {
    //super.layoutSubviews()
    updateView()
  }

  
  public func update(scheme: W3WScheme?) {
    apply(scheme: scheme)
    update(colors: scheme?.colors)
    update(style: scheme?.styles)
  }
  
  
  func update(style: W3WStyles?) {
    var fontWasSet = false
    
    // set styles
    if let style = style {
      
      // fonts
      if let f = style.fonts?.body {
        fontWasSet = true
        if font != f {
          font = f
        }
      }
    }
    
    // if the font wasn't set then we do some default behaviour
    if !fontWasSet {
      let desiredPoints = frame.height / 2.0
      if lastFontPointSize != desiredPoints {
        font = font?.withSize(desiredPoints)
        lastFontPointSize = font?.pointSize ?? 0.0
      }
    }
  }
  
  
  func update(colors: W3WColors?) {
    // set colours
    if let colorSet = colors {
      
      // text colour
      if let text = colorSet.foreground {
        textColor = text.current.uiColor
      }
      
      // background
      if let background = colorSet.background {
        backgroundColor = background.current.uiColor
      }
    }
  }
 
}
