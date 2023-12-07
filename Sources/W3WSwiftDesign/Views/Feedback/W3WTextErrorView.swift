//
//  File.swift
//  
//
//  Created by Dave Duprey on 25/11/2020.
//
#if !os(macOS) && !os(watchOS)

import Foundation
import UIKit
import W3WSwiftCore
import W3WSwiftThemes


/// view to display an erro
public class W3WTextErrorView: W3WMessageView {
  
  var label: UILabel? = UILabel(frame: .w3wVerySmall)
  
  var font: UIFont {
    get {
      return UIFont.systemFont(ofSize: frame.height * 38.0 / 48.0, weight: .regular)
    }
  }
  
  
  /// initialize the UI
  override func setupUI(colors: W3WColors?) {
    super.setupUI(colors: colors)

    updateGeometry()
    
    if let l = label {
      addSubview(l)
    }

    updateColours()
  }
  
  
  override func updateColours() {
    if let c = W3WBasicColors.error.background {
      backgroundColor = c.current.uiColor
    }
    if let c = colors?.border {
      layer.borderColor = c.current.cgColor
    }
    layer.borderWidth = 0.5
    
    label?.attributedText = W3WString(label?.text ?? "").style(color: W3WBasicColors.error.foreground, font: font).asAttributedString()
  }
  
  
//  override func updateGeometry() {
//  }
  
  
  /// sets the error as an atributed string
  public func set(error: NSAttributedString) {
    updateColours()
    label?.attributedText = error
  }
  
  
  /// sets the error as plain text
  public func set(error: String) {
    label?.text = error
    updateColours()
  }

  
  public override func layoutSubviews() {
    var labelFrame = frame
    labelFrame.origin = CGPoint(x: W3WPadding.light.value, y: 0.0)
    labelFrame.size.width -= W3WPadding.heavy.value
    
    label?.frame = labelFrame
    label?.font = font
    label?.adjustsFontSizeToFitWidth = true
    label?.minimumScaleFactor = 0.5
  }
  
  
}


#endif
