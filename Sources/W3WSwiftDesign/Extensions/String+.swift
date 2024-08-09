//
//  String+.swift
//  TestApp
//
//  Created by Dave Duprey on 28/07/2024.
//


public extension String {
  
  /// convenience func to convert a String to a W3WString
  var w3w: W3WString {
    get {
      return W3WString(self)
    }
  }
  
}
