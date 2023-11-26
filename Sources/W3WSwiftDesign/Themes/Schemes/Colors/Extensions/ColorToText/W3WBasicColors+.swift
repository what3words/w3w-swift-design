//
//  File.swift
//  
//
//  Created by Dave Duprey on 12/04/2023.
//

import UIKit


extension W3WBasicColors: CustomDebugStringConvertible, CustomStringConvertible {
  
  
    public var description: String {
      return debugDescription
    }
  
    public var debugDescription: String {
      var retvals = [String]()
      
      retvals.append("foreground: \(foreground?.debugDescription ?? "none")")
      retvals.append("background: \(background?.debugDescription ?? "none")")

      return "{" + retvals.joined(separator: ", ") + "}"
    }
  
}
