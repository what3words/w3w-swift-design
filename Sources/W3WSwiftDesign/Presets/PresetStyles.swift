//
//  File.swift
//  
//
//  Created by Dave Duprey on 21/03/2023.
//

import UIKit


extension W3WStyle {
  
  public static let none       = W3WStyle()

  public static let standard = W3WStyleCollection(
    base:       W3WStyle(fonts: W3WFonts(), padding: W3WPadding.medium),
    buttons:    W3WStyle(fonts: W3WFonts(), padding: W3WPadding.medium),
    textFields: W3WStyle(fonts: W3WFonts(), padding: W3WPadding.medium),
    labels:     W3WStyle(fonts: W3WFonts(), padding: W3WPadding.medium)
  )

  public static let what3words = W3WStyle(border: 1.0, cornerRadius: 10.0)
  
  public static let debug = W3WStyleCollection(
    base:       W3WStyle(fonts: W3WFonts(font: UIFont(name: "American Typewriter", size: 14.0)!), padding: W3WPadding.medium),
    buttons:    W3WStyle(fonts: W3WFonts(font: UIFont(name: "American Typewriter", size: 14.0)!), padding: W3WPadding.medium),
    textFields: W3WStyle(fonts: W3WFonts(font: UIFont(name: "American Typewriter", size: 14.0)!), padding: W3WPadding.medium),
    labels:     W3WStyle(fonts: W3WFonts(font: UIFont(name: "American Typewriter", size: 14.0)!), padding: W3WPadding.medium)
  )
  
  
}
