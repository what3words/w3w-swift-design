//
//  File.swift
//  
//
//  Created by Dave Duprey on 17/03/2023.
//


extension W3WColor: CustomDebugStringConvertible, CustomStringConvertible {
  
  public var name: String {
    get {
      var s = [String]()
      for (mode, color) in colors {
        s.append("\(mode):\(color.name)")
      }
      
      return String("(" + s.joined(separator: ", ") + ")")
    }
  }
  

  public var description: String {
    return name
  }
  
  
  public var debugDescription: String {
    return name
  }
}
