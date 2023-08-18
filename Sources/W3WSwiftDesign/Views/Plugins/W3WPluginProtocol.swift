//
//  File.swift
//  
//
//  Created by Dave Duprey on 24/06/2023.
//

import UIKit
import W3WSwiftCore


public protocol W3WPluginProtocol {
  
  var button: W3WButton { get }
  var onSuggestions: W3WSuggestionsResponse { get }
  
}


public extension W3WPluginProtocol {
  
  func configure(button: W3WButton) {
    button.imageView?.contentMode = .scaleAspectFit
    
    button.position = W3WViewPosition(width: 24.0, height: 24.0)
//    button.position = W3WViewPosition(position: { parent, this in
//      return CGRect(origin: this.frame.origin, size: CGSize(width: parent?.frame.height ?? this.frame.width, height: parent?.frame.width ?? this.frame.height))
//    })
  }
  
}
