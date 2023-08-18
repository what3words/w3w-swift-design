//
//  File.swift
//  
//
//  Created by Dave Duprey on 13/04/2023.
//

import UIKit


public class W3WLabel: UILabel, W3WViewProtocol {
  
  public var theme: W3WTheme?

  public var position: W3WViewPosition?

  public var fontStyle: W3WFontStyle?
  
  public init(text: W3WString? = nil, fontStyle: W3WFontStyle? = nil, theme: W3WTheme? = nil) {
    super.init(frame: .w3wWhatever)
    position?.position(superview, self)

    set(theme: theme, position: position)

    if let fs = fontStyle {
      self.fontStyle = fs
      self.font = theme?.style?.fonts?[fs]
    }

    if let t = text {
      attributedText = t.asAttributedString()
    }
    //self.text = text?.asString()
  }

  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  
  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    updateView()
  }

  
  open override func layoutSubviews() {
    super.layoutSubviews()
    updateView()
  }

}
