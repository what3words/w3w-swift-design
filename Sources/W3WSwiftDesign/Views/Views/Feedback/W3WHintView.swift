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


/// view to display an erro
public class W3WHintView: W3WMessageView {

  public var onTapped: () -> () = { }
  
  var hintLabel: UILabel?  = UILabel(frame: CGRect(origin: .zero, size: CGSize(width: 1.0, height: 1.0)))
  var titleLabel: UILabel? = UILabel(frame: CGRect(origin: .zero, size: CGSize(width: 1.0, height: 1.0)))

  
  /// initialize the UI
  override func setupUI(colors: W3WColors?) {
    super.setupUI(colors: colors)
    
    drawLine = false
    
    if let l = titleLabel {
      addSubview(l)
    }
    
    if let l = hintLabel {
      addSubview(l)
    }

    updateGeometry()
    updateColours()
    
    // create a gesture recognizer (tap gesture)
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapHappened(recognizer:)))
    tapGesture.cancelsTouchesInView = true
    addGestureRecognizer(tapGesture)
  }
  
  
  /// called when the user touches the center of the circle
  @objc func tapHappened(recognizer: UITapGestureRecognizer) {
    onTapped()
  }

  
  override func updateColours() {
    super.updateColours()

    if let c = colors?.foreground {
      titleLabel?.textColor = c.current.uiColor
    }
    
    if let c = colors?.brand {
      hintLabel?.textColor  = c.current.uiColor
    }

    //let hintFontHeight  = frame.height * (18.0 / 58.0)
    hintLabel?.attributedText = W3WString(hintLabel?.text ?? "").asAttributedString() //, font: W3WFont.pickaFont(size: hintFontHeight, weight: .semibold)).asAttributedString() //  W3WFormatter.ensureSlashes(text: hintLabel?.text, font: W3WFormatter.pickaFont(size: hintFontHeight, weight: .semibold))
  }
  
  
//  override func updateGeometry() {
//    super.updateGeometry()
//  }
  
  
  /// sets the error as an atributed string
  public func set(title: String, hint: NSAttributedString) {
    DispatchQueue.main.async {
      self.updateColours()
      self.titleLabel?.text = title
      self.hintLabel?.attributedText = hint
    }
  }
  
  
  /// sets the error as plain text
  public func set(title: String, hint: String) {
    titleLabel?.text = title
    hintLabel?.text = hint
  }
  
  
  public override func layoutSubviews() {
    let padding         = frame.height * (6.0 / 58.0)
    let titleHeight     = frame.height * (20.0 / 58.0)
    let titleFontHeight = frame.height * (14.0 / 58.0)
    let hintHeight      = frame.height * (22.0 / 58.0)
    let hintFontHeight  = frame.height * (18.0 / 58.0)
    let spaceBetween    = frame.height * (3.0 / 58.0)
    
    var labelFrame = frame
    labelFrame.origin = CGPoint(x: padding * 2.0, y: padding)
    labelFrame.size.width = frame.width - padding * 4.0
    labelFrame.size.height = titleHeight
    
    titleLabel?.frame = labelFrame
    titleLabel?.font = UIFont.systemFont(ofSize: titleFontHeight, weight: .regular)
    titleLabel?.adjustsFontSizeToFitWidth = true
    titleLabel?.minimumScaleFactor = 0.4
    
    labelFrame.origin.y = labelFrame.origin.y + labelFrame.size.height + spaceBetween
    labelFrame.size.height = hintHeight
    
    hintLabel?.frame = labelFrame
    hintLabel?.font = UIFont.systemFont(ofSize: hintFontHeight, weight: .semibold)
    hintLabel?.adjustsFontSizeToFitWidth = true
    hintLabel?.minimumScaleFactor = 0.5
    
    layer.borderWidth = 0.5
  }
  

}

#endif
