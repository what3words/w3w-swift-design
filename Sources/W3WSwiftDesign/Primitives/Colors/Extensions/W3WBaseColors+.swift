//
//  File.swift
//  
//
//  Created by Dave Duprey on 12/04/2023.
//

import UIKit


extension W3WBaseColors: CustomDebugStringConvertible, CustomStringConvertible {
  
  
    public var description: String {
      return debugDescription
    }
  
  
    public var debugDescription: String {
      var retvals = [String]()
  
      if let f = foreground   { retvals.append("Foreground: "  + f.description) }
      if let b = background   { retvals.append("Background: "  + b.description) }
  
      if let set = self as? W3WColorSet {
        if let s = set.secondary  { retvals.append("Secondary: "  + s.description) }
        if let t = set.tint       { retvals.append("Tint: "  + t.description) }
      }
      
      if let scheme = self as? W3WColorScheme {
        
        if let b = scheme.brand        { retvals.append("Brand: "       + b.description) }
        if let h = scheme.highlight    { retvals.append("Highlight: "   + h.description) }
        if let b = scheme.border       { retvals.append("Border: "      + b.description) }
        if let s = scheme.separator    { retvals.append("Separator: "   + s.description) }
        if let s = scheme.shadow       { retvals.append("Shadow: "      + s.description) }
        if let p = scheme.placeholder  { retvals.append("Placeholder: " + p.description) }
        if let e = scheme.error        { retvals.append("Error: "       + e.description) }
      }
      
      return String(describing: type(of: self)) + ": " + retvals.joined(separator: ", ")
    }
  
}
