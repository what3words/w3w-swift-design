//
//  File.swift
//  
//
//  Created by Dave Duprey on 21/03/2023.
//

import UIKit


extension W3WStyles {
  
  public static let none       = W3WStyle()

  public static let standard = W3WStyles(
    base:       W3WStyle(fonts: W3WFonts(), padding: W3WPadding.medium),
    buttons:    W3WStyle(cornerRadius: .softer, fonts: W3WFonts(), padding: W3WPadding.medium),
    textFields: W3WStyle(cornerRadius: .soft, fonts: W3WFonts(), padding: W3WPadding.fine),
    labels:     W3WStyle(fonts: W3WFonts(), padding: W3WPadding.medium)
  )

  public static let what3words = W3WStyles(cornerRadius: 4.0)
  
  public static let maps = W3WStyles(separator: 1.0)
  
  public static let debug = W3WStyles(
    base:       W3WStyle(fonts: W3WFonts(font: UIFont(name: "American Typewriter", size: 14.0)!), padding: W3WPadding.medium),
    buttons:    W3WStyle(fonts: W3WFonts(font: UIFont(name: "American Typewriter", size: 14.0)!), padding: W3WPadding.medium),
    textFields: W3WStyle(fonts: W3WFonts(font: UIFont(name: "American Typewriter", size: 14.0)!), padding: W3WPadding.medium),
    labels:     W3WStyle(fonts: W3WFonts(font: UIFont(name: "American Typewriter", size: 14.0)!), padding: W3WPadding.medium)
  )
  
  
}
