//
//  File.swift
//  
//
//  Created by Dave Duprey on 16/03/2023.
//

import UIKit


extension W3WCoreColor: CustomDebugStringConvertible, CustomStringConvertible {
  
  public var name: String {
    get {
      return find(color: self.uiColor)
    }
  }

  
  public var description: String {
    return name
  }
  


  public var debugDescription: String {
    return name
  }

  
  
  func find(color: UIColor) -> String {
    var cname = "Unknown"
    var match = 3.0
    
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 0
    color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    
    for (hex, _) in Self.names {
      let (r,g,b) = getRGB(hex: hex)
      let difference = colorDifference(r0: r, g0: g, b0: b, r1: red, g1: green, b1: blue)
      if match > difference {
        match = difference
        cname = Self.names[hex] ?? "Unknown"
      }
    }
    
    //print("Colour match: ", match)
    if match > 0.01 {
      cname = "Unknown"
    }
    
    if alpha < 1.0 {
      cname += " (" + String(format: "%.0f", alpha * 100.0) + "%)"
    }
        
    return cname
  }
  
  
  func colorDifference(r0: CGFloat, g0: CGFloat, b0: CGFloat, r1: CGFloat, g1: CGFloat, b1: CGFloat) -> CGFloat {
    let sumR = pow(r1 - r0, 2.0)
    let sumG = pow(g1 - g0, 2.0)
    let sumB = pow(b1 - b0, 2.0)
    return sqrt( sumR + sumB + sumG )
  }
  
  
  func getRGB(hex: String) -> (CGFloat, CGFloat, CGFloat) {
    var rgbValue: UInt64 = 0
    Scanner(string: hex).scanHexInt64(&rgbValue)
    
    let red   = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
    let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
    let blue  = CGFloat(rgbValue & 0x0000FF) / 255.0
    
    return (red, green, blue)
  }
  
  
  static let names: [String:String] = [

    "87e1d1": "Aqua",
    "2e71b8": "Blue",
    "363636": "Charcoal",
    "f26c50": "Coral",
    "0a3049": "Dark Blue",
    "53c18a": "Green",
    "e0e0e0": "LightGrey",
    "a7a7a7": "MediumGrey",
    "c5b000": "Mustard",
    "f4a344": "Orange",
    "E11F26": "Red",
    "f6d31f": "Yellow",
    "005379": "Secondary Blue",
    "C2E1EB": "Teal",
    "98d5e5": "Information Blue",
    "B24000": "Error Red Text",
    "8b4ca1": "Link Visited",
    
    "EBEBEB": "Grey 92",
    "D6D6D6": "Grey 84",
    "C4C4C4": "Grey 77",
    "808080": "Grey 50",
    "616161": "Grey 38",
    "525252": "Grey 32",

    // off greys
    "F2F4F5": "Off Grey",
    "B5B5B5": "Off Light Grey",
    "525E66": "Off MidGrey",
    "31383D": "Off Dark Grey",
    
    // iOS System Colours, taken from https://sarunw.com/posts/dark-color-cheat-sheet/
    "F2F2F7": "Secondary System Background Light",
    "1C1C1E": "Secondary System Background Dark",
    "2C2C2E": "Tertiary System Background Dark",
    
    "3C3C43": "Label Light",
    "EBEBF5": "Label Dark",

    "C6C6C8": "Opaque Separator Light",
    "38383A": "Opaque Separator Dark",
    
    "007AFF": "System Blue Light",
    "0A84FF": "System Blue Dark",
    "34C759": "System Green Light",
    "30D158": "System Green Dark",
    "5856D6": "System Indigo Light",
    "5E5CE6": "System Indigo Dark",
    "FF9500": "System Orange Light",
    "FF9F0A": "System Orange Dark",
    "FF2D55": "System Pink Light",
    "FF375F": "System Pink Dark",
    "AF52DE": "System Purple Light",
    "BF5AF2": "System Purple Dark",
    "FF3B30": "System Red Light",
    "FF453A": "System Red Dark",
    "5AC8FA": "System Teal Light",
    "64D2FF": "System Teal Dark",
    "FFCC00": "System Yellow Light",
    "FFD60A": "System Yellow Dark",
    
    "8E8E93": "System Gray",
    "AEAEB2": "System Gray 2 Light",
    "636366": "System Gray 2 Dark",
    "C7C7CC": "System Gray 3 Light",
    "48484A": "System Gray 3 Dark",
    "D1D1D6": "System Gray 4 Light",
    "3A3A3C": "System Gray 4 Dark",
    "E5E5EA": "System Gray 5 Light",
  
    "000000": "Black",
    "FFFFFF": "White",
    "FF0000": "Pure Red",
    "00FF00": "Pure Green",
    "0000FF": "Pure Blue",
    "FFFF00": "Pure Yellow",
    "00FFFF": "Pure Cyan",

    "F9F9F9": "Septenary Fill Light",
    "747480": "Septenary Fill Dark",
  ]
  

}
