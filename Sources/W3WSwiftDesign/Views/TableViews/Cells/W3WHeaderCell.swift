//
//  File.swift
//  
//
//  Created by Dave Duprey on 18/08/2023.
//

import UIKit
import W3WSwiftThemes


public class W3WHeaderCell: W3WPaddedView {
  
  public var label: W3WLabel? { get { wrappedView as? W3WLabel } }
  
  public init(text: String, height: W3WRowHeight, scheme: W3WScheme? = nil) {
    let labelTheme = scheme?.with(background: .clear)
    let labelText  = W3WString(text, color: scheme?.colors?.header?.foreground)
    
    super.init(view: W3WLabel(text: labelText, fontStyle: .caption1, scheme: labelTheme), scheme: W3WScheme())
    
    // set the height of the frame
    frame = CGRect(origin: frame.origin, size: CGSize(width: frame.width, height: height.value))
  }
  
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
}

