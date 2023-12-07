//
//  File.swift
//  
//
//  Created by Dave Duprey on 21/06/2023.
//

import Foundation
import W3WSwiftThemes


open class W3WSpacerView: W3WView  {
 
  public override init(scheme: W3WScheme? = nil) { //, position: W3WViewPosition? = nil) {
    super.init(scheme: scheme)
    
    isUserInteractionEnabled = false

    position = W3WViewPosition(expand: true)
  }
  
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
}
