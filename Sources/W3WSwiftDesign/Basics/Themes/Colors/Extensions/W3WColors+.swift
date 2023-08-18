//
//  File.swift
//  
//
//  Created by Dave Duprey on 30/06/2023.
//


extension W3WColors: CustomDebugStringConvertible, CustomStringConvertible {
  
  public var name: String {
    get {
      var retvals = [String]()

      for (index, colorset) in colors {
        retvals.append("\(index): \(colorset.description)")
      }
      
//      retvals.append("Base: " + base.description)
//      if let b = buttonsSet    { retvals.append("Button: " + b.description) }
//      if let t = textFieldsSet { retvals.append("TextField: " + t.description) }
//      if let l = labelsSet     { retvals.append("Label: " + l.description) }

      return String(describing: type(of: self)) + ": " + retvals.joined(separator: ",\n ")
    }
  }
  
  
  public var description: String {
    return name
  }
  
  
  
  public var debugDescription: String {
    return name
  }
}
