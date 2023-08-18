//
//  File.swift
//  
//
//  Created by Dave Duprey on 18/08/2023.
//

import UIKit


public class W3WHeaderCell: W3WPaddedView {
  
  public var label: W3WLabel? {
    get {
      return wrappedView as? W3WLabel
    }
  }
  
  public init(text: W3WString, height: W3WRowHeight, theme: W3WTheme? = nil) {
    super.init(view: W3WLabel(text: text, theme: theme), theme: theme)

    // set the height of the frame
    frame = CGRect(origin: frame.origin, size: CGSize(width: frame.width, height: height.value))
  }
  
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
}
