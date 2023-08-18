//
//  W3WString.swift
//  
//
//  Created by Dave Duprey on 2022-07-20.
//

import Foundation
import UIKit
import MapKit
import W3WSwiftCore


/// + operator for W3WString
public func +(left: W3WString, right: W3WString) -> W3WString {
  left.string.append(right.string)
  return left
}


/// A utility class to simplify using NSAttributedString.
/// Allows simple concatination via +, and uses W3WColor
public class W3WString: CustomStringConvertible, ExpressibleByStringLiteral {
  public typealias StringLiteralType = String

  var string = NSMutableAttributedString()

  public init() {
  }
  
  
  required public init(stringLiteral value: String) {
    self.string = NSMutableAttributedString(string: value)
  }



//  public init(_ str: String = "", font: UIFont? = nil) {
//    string = NSMutableAttributedString(string: str)
//  }

  
  public init(_ str: String, color: W3WColor? = nil, font: UIFont? = nil) {
    string = NSMutableAttributedString(string: str)
    _ = style(color: color, font: font)
  }
  
  
  public init(_ str: NSAttributedString?, color: W3WColor? = nil, font: UIFont? = nil) {
    if let s = str {
      string = NSMutableAttributedString(attributedString: s)
    } else {
      string = NSMutableAttributedString(string: "")
    }
  }
  

//  public init(kilometers: Double, color: W3WColor? = nil, font: UIFont? = nil) {
//    string = NSMutableAttributedString(string: distanceToString(kilometers: kilometers))
//    _ = style(color: color, font: font)
//  }
//
//
//  public init(meters: Double, color: W3WColor? = nil, font: UIFont? = nil) {
//    string = NSMutableAttributedString(string: distanceToString(kilometers: meters))
//    _ = style(color: color, font: font)
//  }

  
  public init(distance: W3WDistance, color: W3WColor? = nil, font: UIFont? = nil) {
    string = NSMutableAttributedString(string: distanceToString(distance: distance))
    _ = style(color: color, font: font)
  }


  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  
  public func asAttributedString() -> NSAttributedString {
    return string
  }
  
  
  public func asString() -> String {
    return string.string
  }
  
  
  func makeAttributes(color: W3WColor? = nil, font: UIFont? = nil) -> [NSAttributedString.Key: AnyObject] {
    var style = [NSAttributedString.Key: AnyObject]()
    if let c = color?.current.uiColor {
      style[.foregroundColor] = c
    }
    if let f = font {
      style[.font] = f
    }

    return style
  }


  public func style(color: W3WColor? = nil, font: UIFont? = nil) -> W3WString {
    let style = makeAttributes(color: color, font: font)
    string.setAttributes(style, range: NSRange(location: 0, length: string.length))

    return self
  }
  
  
  /// this might not be working as advertised
  public func trim(characterSet: CharacterSet) {
    let mString = NSMutableAttributedString(attributedString: string)
    mString.mutableString.trimmingCharacters(in: characterSet)
    string = mString
  }
  
  
  public func withSlashes(color: W3WColor = .red, font: UIFont? = nil) -> W3WString {
    //trim(characterSet: CharacterSet(charactersIn: "/"))
    string = removeLeadingSlashes().string
    return W3WString("///", color: color, font: font) + self
  }
  
  
  public func addSlashesIfAddress(color: W3WColor = .red, font: UIFont? = nil) -> W3WString {
    if W3WRegex.isPossible3wa(text: asString()) {
      string = removeLeadingSlashes().string
      return withSlashes(color: color, font: font)
    }
    
    return self
  }
  
  
  func removeLeadingSlashes() -> W3WString {
    while string.string.first == "/" {
      string.deleteCharacters(in: NSRange(location: 0, length: 1))
    }
    return self
  }
  

  public func highlight(word: String, color: W3WColor? = nil, font: UIFont? = nil) {
    let style = makeAttributes(color: color, font: font)

    if let regex = try? NSRegularExpression(pattern: word, options: .caseInsensitive) {
      let matches = regex.matches(in: string.string, range: NSRange(location: 0, length: string.length))
      for match in matches {
        string.addAttributes(style, range: match.range)
      }
    }

  }


  static public func +=( lhs: inout W3WString, rhs: W3WString) {
    lhs = lhs + rhs
  }
  
  
  
  
  
//  /// returns a distance in the localised format (miles,km,etc)
//  /// - Parameters:
//  ///   - meters: number of meters to use
//  func distanceToString(meters: Double) -> String {
//    var distance = ""
//
//    let formatter = MKDistanceFormatter()
//    formatter.unitStyle = .abbreviated
//
//    // note: W3WSettings.measurement might be .userPreference, in which case formatter.units is let to it's default
//    if W3WSettings.measurement == .metric {
//      formatter.units = .metric
//    } else if W3WSettings.measurement == .imperial {
//      formatter.units = .imperial
//    }
//
//    distance = formatter.string(fromDistance: meters)
//
//    return distance
//  }
//
//
//  /// returns a distance in the localised format (miles,km,etc)
//  /// - Parameters:
//  ///   - kilometers: number of kilometers to use
//  func distanceToString(kilometers: Double) -> String {
//    var distance = ""
//
//    let formatter = MKDistanceFormatter()
//    formatter.unitStyle = .abbreviated
//
//    // note: W3WSettings.measurement might be .userPreference, in which case formatter.units is let to it's default
//    if W3WSettings.measurement == .metric {
//      formatter.units = .metric
//    } else if W3WSettings.measurement == .imperial {
//      formatter.units = .imperial
//    }
//
//    if kilometers == 0 {
//      distance = "<" + formatter.string(fromDistance: 1000.0)
//    } else {
//      distance = formatter.string(fromDistance: kilometers * 1000.0)
//    }
//    //distance = formatter.string(fromDistance: 2.0)
//
//    distance = distance.replacingOccurrences(of: ".0", with: "")
//
//    return distance
//  }
  
  
  /// returns a distance in the localised format (miles,km,etc)
  /// - Parameters:
  ///   - kilometers: number of kilometers to use
  func distanceToString(distance: W3WDistance) -> String {
    var string = ""
    
    let formatter = MKDistanceFormatter()
    formatter.unitStyle = .abbreviated
    
    // note: W3WSettings.measurement might be .userPreference, in which case formatter.units is let to it's default
    if W3WSettings.measurement == .metric {
      formatter.units = .metric
    } else if W3WSettings.measurement == .imperial {
      formatter.units = .imperial
    }
    
    //if distance.meters == 0 {
    //  string = "<" + formatter.string(fromDistance: 1000.0)
    //} else {
    string = formatter.string(fromDistance: distance.meters)
    //}
    //distance = formatter.string(fromDistance: 2.0)
    
    //string = string.replacingOccurrences(of: ".0", with: "")
    
    return string
  }
  
  
  func wordsToArray() -> [String] {
    let text    = string.string
    let regex   = try! NSRegularExpression(pattern: W3WRegex.regex_3wa_word)
    let matches = regex.matches(in: text, range: NSRange(text.startIndex..., in:text))
    
    var words = [String]()
    for match in matches {
      let word = String(text[Range(match.range, in: text)!]).lowercased()
      words.append(word)
    }
    
    return words
  }

  
  func compareAsWords(to: W3WString) -> Bool {
    let a1 = wordsToArray()
    let a2 = to.wordsToArray()
    
    if a1[0] == a2[0] && a1[1] == a2[1] && a1[2] == a2[2] {
      return true
    } else {
      return false
    }
  }
  
  
  func fixDidYouMean() -> W3WString {
    let words = wordsToArray()
    let separator = isJapanese() ? "。" : "."

    return W3WString(words.joined(separator: separator))
  }

  
  // maybe change this to getSeparatorFor() and move it to W3WSwiftTypes
  func isJapanese() -> Bool {
    let text    = string.string
    let regex   = try! NSRegularExpression(pattern: "[぀-ヿ|ｦ-ﾟ]")
    let count = regex.numberOfMatches(in: text, range: NSRange(text.startIndex..., in:text))

    if count == 0 {
      return false
    } else {
      return true
    }
  }
  

  public var description: String {
    var pieces = [String]()

    //Find all attributes in the text.
    string.enumerateAttributes(in: NSRange(location: 0, length: string.length)) { (attributes, range, stop) in
      var smallerPieces = [String]()
      smallerPieces.append("\"" + string.mutableString.substring(with: range) + "\"")
      attributes.forEach { (key, value) in
        smallerPieces.append(makeDescriptivePiece(range: range, key: key, value: value))
      }
      pieces.append(smallerPieces.joined(separator: ""))
    }
    
    return String(pieces.joined(separator: ","))
  }
    
  
  func makeDescriptivePiece(range: NSRange, key: Any, value: Any) -> String {
    if let color = value as? UIColor {
      return "(\(W3WCoreColor(uiColor: color)))"

    } else if let font = value as? UIFont {
      return "(" + font.fontName + "," + String(describing: font.pointSize) + ")"

    } else {
      return String(describing: key) + ": " + String(describing: value)
    }
  }
  
  
}
