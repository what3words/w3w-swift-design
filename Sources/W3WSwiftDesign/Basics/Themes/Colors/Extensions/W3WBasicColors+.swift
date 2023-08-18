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
      
      if let f = foreground?.debugDescription {
        retvals.append("foreground: \(f)")
      }
      if let b = background?.debugDescription {
        retvals.append("background: \(b)")
      }

      return "{" + retvals.joined(separator: ", ") + "}"
    }
  
}
