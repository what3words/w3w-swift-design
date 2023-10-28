//
//  File.swift
//  
//
//  Created by Dave Duprey on 13/04/2023.
//

import UIKit
import W3WSwiftCore


public class W3WLabel: UILabel, W3WViewProtocol {
  
  public var theme: W3WTheme?

  public var position: W3WViewPosition?

  public var fontStyle: W3WFontStyle?
  
  var customText: NSAttributedString? = nil
  
  public override var attributedText: NSAttributedString? {
    didSet {
      // we keep track of whether text or attributed text is set to help when it's time for coloring
      customText = attributedText
    }
  }
  
  public override var text: String? {
    didSet {
      // we keep track of whether text or attributed text is set to help when it's time for coloring
      customText = nil
    }
  }
  
  
  public init(localized: String, fontStyle: W3WFontStyle? = nil, theme: W3WTheme? = nil) {
    super.init(frame: .w3wWhatever)
    configure(text: W3WString(W3WTranslations.main.translate(key: localized)), fontStyle: fontStyle, theme: theme)
  }

  
  public init(text: W3WString? = nil, fontStyle: W3WFontStyle? = nil, theme: W3WTheme? = nil) {
    super.init(frame: .w3wWhatever)
    configure(text: text, fontStyle: fontStyle, theme: theme)
  }

  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    configure()
  }
  
  
  func configure(text: W3WString? = nil, fontStyle: W3WFontStyle? = nil, theme: W3WTheme? = nil) {
    position?.position(superview, self)
    
    set(theme: theme, position: position)
    
    if let fs = fontStyle {
      self.fontStyle = fs
      self.font = theme?[.labels]?.styles?.fonts?[fs]
    }
    
    if let t = text {
      attributedText = t.asAttributedString()
    }
    //self.text = text?.asString()
  }

  
  public func set(localized: String) {
    text = W3WTranslations.main.translate(key: localized)
  }
  
  
  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    updateView()
  }

  
  open override func layoutSubviews() {
    super.layoutSubviews()
    updateView()
  }

  
  public func update(theme: W3WTheme?) {
    apply(theme: theme?.copy(from: .labels, to: .base))
    update(fonts: theme?[.labels]?.styles?.fonts)
    
    if customText == nil {
      textColor = theme?[.labels]?.colors?.foreground?.current.uiColor
    }
  }
  
  
  func update(fonts: W3WFonts?) {
    var fontWasSet = false
    
    // fonts, only set if it's changed
    if let fs = fontStyle, let f = fonts?[fs] {
      fontWasSet = true
      if font != f {
        font = f
      }
    }
    
    // if the font wasn't set then we do some default behaviour
    if !fontWasSet {
      if font.pointSize != frame.height {
        font = font?.withSize(frame.height)
      }
    }
  }
  
}