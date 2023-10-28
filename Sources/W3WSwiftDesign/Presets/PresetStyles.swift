//
//  File.swift
//  
//
//  Created by Dave Duprey on 21/03/2023.
//

import UIKit


extension W3WStyles {
  
  public static let standard          =  W3WStyles(fonts: W3WFonts(), padding: W3WPadding.medium)
  public static let standardButtons    =  W3WStyles(cornerRadius: .softer, fonts: W3WFonts(), padding: W3WPadding.medium)
  public static let standardTextFields =  W3WStyles(cornerRadius: .soft, padding: W3WPadding.fine)
  public static let standardLabels     =  W3WStyles(fonts: W3WFonts(), padding: W3WPadding.medium)
  public static let standardCells     =  W3WStyles(fonts: W3WFonts(), padding: W3WPadding.medium)
  public static let standardOcr     =   W3WStyles.ocrStyle(line: .twoPoint, foundLine: .fourPoint)

}

