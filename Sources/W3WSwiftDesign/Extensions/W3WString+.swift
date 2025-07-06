//
//  W3WString+.swift
//  w3w-swift-design
//
//  Created by Khai Do on 6/7/25.
//

import Foundation
import UIKit
import W3WSwiftThemes
import W3WSwiftCore

public extension W3WString {
  
  /// add w3w slashes to the text
  /// - Parameters:
  ///   - color: The colour to use
  ///   - font: The font to use
  ///   - language: An optional `W3WLanguage` that determines the writing direction. Defaults to left-to-right if nil or unknown.
  func withSlashes(
    color: W3WColor = .w3wBrandBase,
    font: UIFont? = nil,
    language: W3WLanguage? = nil
  ) -> W3WString {
    switch language?.direction() {
    case .leftToRight, .topToBottom, .bottomToTop, nil:
      string = removeLeadingSlashes().string
      return W3WString("///", color: color, font: font) + self
      
    case .rightToLeft:
      string = removeTrailingSlashes().string
      return self + W3WString("///", color: color, font: font)
    }
  }
  
  
  /// add w3w slashes to the text
  /// - Parameters:
  ///   - color: The colour to use
  ///   - font: The font to use
  func withSlashes(color: W3WColor = .w3wBrandBase, font: W3WFont?) -> W3WString {
    return withSlashes(color: color, font: font?.uiFont)
  }

  
  /// remove trailing `///` from text
  @discardableResult
  func removeTrailingSlashes() -> W3WString {
    while string.string.last == "/" {
      let lastIndex = string.length - 1
      string.deleteCharacters(in: NSRange(location: lastIndex, length: 1))
    }
    return self
  }
  
  
  /// remove leading `///` from text
  @discardableResult
  func removeLeadingSlashes() -> W3WString {
    while string.string.first == "/" {
      string.deleteCharacters(in: NSRange(location: 0, length: 1))
    }
    return self
  }
  
  
  /// add w3w slashes to the text only if the text is in the form of a three word address
  /// - Parameters:
  ///   - color: The colour to use
  ///   - font: The font to use
  @discardableResult
  public func addSlashesIfAddress(color: W3WColor = .w3wBrandBase, font: UIFont? = nil) -> W3WString {
    if W3WRegex.isPossible3wa(text: asString()) {
      string = removeLeadingSlashes().string
      return withSlashes(color: color, font: font)
    }
    
    return self
  }


  /// add w3w slashes to the text only if the text is in the form of a three word address
  /// - Parameters:
  ///   - color: The colour to use
  ///   - font: The font to use
  @discardableResult
  public func addSlashesIfAddress(color: W3WColor = .w3wBrandBase, font: W3WFont?) -> W3WString {
    return addSlashesIfAddress(color: color, font: font?.uiFont)
  }
}
