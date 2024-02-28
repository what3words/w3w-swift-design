//
//  File.swift
//  
//
//  Created by Dave Duprey on 13/04/2023.
//

import UIKit
import W3WSwiftCore
import W3WSwiftThemes


/// Derived from UILabel, this adds W3WScheme for colour and style
///  and can accept W3WString
public class W3WLabel: UILabel, W3WViewProtocol {
  
  public var scheme: W3WScheme?

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
  
  
  public init(localized: String, fontStyle: W3WFontStyle? = .body, scheme: W3WScheme? = nil) {
    super.init(frame: .w3wWhatever)
    configure(text: W3WString(W3WTranslations.main.translate(key: localized)), fontStyle: fontStyle, scheme: scheme)
  }

  
  public init(text: W3WString? = nil, fontStyle: W3WFontStyle? = .body, scheme: W3WScheme? = nil) {
    super.init(frame: .w3wWhatever)
    configure(text: text, fontStyle: fontStyle, scheme: scheme)
  }

  
  public init(text: W3WString? = nil, font: UIFont?, scheme: W3WScheme? = nil) {
    super.init(frame: .w3wWhatever)
    configure(text: text, font: font, scheme: scheme)
  }

  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    configure()
  }
  
  
  func configure(text: W3WString? = nil, fontStyle: W3WFontStyle? = .body, scheme: W3WScheme? = nil) {
    self.fontStyle = fontStyle
    configure(text: text, font: fontStyle == nil ? nil : scheme?.styles?.fonts?[fontStyle!], scheme: scheme)
  }
  
  
  func configure(text: W3WString? = nil, font: UIFont?, scheme: W3WScheme? = nil) {
    position?.position(superview, self)
    
    set(scheme: scheme, position: position)
    
    self.font = font
    
    if let t = text {
      attributedText = t.asAttributedString()
    }
  }

  
  public func set(localized: String) {
    W3WThread.runOnMain { [weak self] in
      self?.text = W3WTranslations.main.translate(key: localized)
    }
  }
  
  
  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    updateView()
  }

  
  open override func layoutSubviews() {
    super.layoutSubviews()
    updateView()
  }

  
  public func update(scheme: W3WScheme?) {
    apply(scheme: scheme)
    update(fonts: scheme?.styles?.fonts)
    
    if customText == nil {
      textColor = scheme?.colors?.foreground?.current.uiColor
    }
    
    if let alignment = scheme?.styles?.textAlignment?.value {
      textAlignment = alignment
    }
  }
  
  
  func update(fonts: W3WFonts?) {
    // No need to update font when attributed text is set
    if customText != nil {
      return
    }
    
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
