//
//  File.swift
//  
//
//  Created by Dave Duprey on 17/03/2023.
//


extension W3WColors: CustomDebugStringConvertible, CustomStringConvertible {
  
  public var name: String {
    get {
      var retvals = [String]()
      
      if let f = foreground  { retvals.append("Foreground: "  + f.description) }
      if let b = background  { retvals.append("Background: "  + b.description) }
      if let s = secondary   { retvals.append("Secondary: "   + s.description) }
      if let t = tint        { retvals.append("Tint: "        + t.description) }
      if let b = brand       { retvals.append("Brand: "       + b.description) }
      if let h = highlight   { retvals.append("Highlight: "   + h.description) }
      if let b = border      { retvals.append("Border: "      + b.description) }
      if let s = separator   { retvals.append("Separator: "   + s.description) }
      if let s = shadow      { retvals.append("Shadow: "      + s.description) }
      if let p = placeholder { retvals.append("Placeholder: " + p.description) }
      if let s = success     { retvals.append("Success: "     + s.description) }
      if let e = error       { retvals.append("Error: "       + e.description) }
      if let h = header      { retvals.append("Header: "      + h.description) }
      if let l = line        { retvals.append("Line: "        + l.description) }

      return String(describing: type(of: self)) + ": " + retvals.joined(separator: ", ")
    }
  }

  
  public var description: String {
    return name
  }

  
  public var debugDescription: String {
    return name
  }
}
