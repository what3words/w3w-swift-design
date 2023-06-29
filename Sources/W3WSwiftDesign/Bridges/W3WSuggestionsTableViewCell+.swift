//
//  File.swift
//  
//
//  Created by Dave Duprey on 17/04/2023.
//

import Foundation
import W3WSwiftCore

#if canImport(w3w)
import w3w
#endif



public extension W3WSuggestionsTableViewCell {
  
#if canImport(w3w)
  func set(suggestion: W3WSdkSuggestion?) {
    let s = suggestion?.asBaseSuggestion()
    set(suggestion: s)
  }
#endif

}
