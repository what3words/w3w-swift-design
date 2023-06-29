//
//  File.swift
//  
//
//  Created by Dave Duprey on 13/04/2023.
//

import UIKit


public class W3WLabel: UILabel, W3WViewProtocol {
  
  public var design: W3WDesign?

  public var position: W3WViewPosition?

  
  public init(text: W3WString? = nil, design: W3WDesign? = nil) {
    super.init(frame: .w3wWhatever)
    //frame = position?.position(superview, self) ?? .w3wWhatever
    position?.position(superview, self)
    set(design: design, position: position)
    attributedText = text?.asAttributedString()
  }

  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  
  open override func layoutSubviews() {
    super.layoutSubviews()
    updateView()
  }

}
