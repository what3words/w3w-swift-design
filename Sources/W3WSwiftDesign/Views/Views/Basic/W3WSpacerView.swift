//
//  File.swift
//  
//
//  Created by Dave Duprey on 21/06/2023.
//

import Foundation



open class W3WSpacerView: W3WView  {
 
  public override init(theme: W3WTheme? = nil) { //, position: W3WViewPosition? = nil) {
    super.init(theme: theme)
    
    isUserInteractionEnabled = false

    position = W3WViewPosition(expand: true)
//    setContentHuggingPriority(.fittingSizeLevel, for: .horizontal)
//    setContentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)
//
//    setContentHuggingPriority(.fittingSizeLevel, for: .vertical)
//    setContentCompressionResistancePriority(.fittingSizeLevel, for: .vertical)
  }
  
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
}
