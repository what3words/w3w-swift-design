//
//  File.swift
//  
//
//  Created by Dave Duprey on 17/03/2023.
//

import UIKit


extension W3WTheme {
  
  public static let defaults   = W3WTheme()
  public static let standard   = W3WTheme(base: .standard, buttons: .standardButtons, textFields: .standardTextFields, labels: .standardLabels, cells: .standardCells, icons: .standardIcons, voice: .standardVoice, ocr: .standardOcr)

  //  public static let what3words = W3WTheme(colors: .what3words, style: .what3words)
  //  public static let debug      = W3WTheme(colors: .debug, style: .debug)
  //  public static let maps       = W3WTheme(colors: .maps, style: .maps)
  //  public static let outlined   = W3WDesign.standard.with(style: .standard.with(border: W3WBorder(value: 1.0))).with(colors: .standard.with(border: .aqua).with(background: .orange))
  //  public static let w3wScheme = W3WDesignScheme(base: .what3words, cells: .what3words)
  
  
  // design for a what3words branded tableviewcell
  public static let w3wCell = W3WTheme(base: W3WScheme(colors: W3WColors(foreground: .text, background: .background, tint: .slash, secondary: .secondaryLabel)))

  public static let w3wCellIconFilled = W3WTheme(base: W3WScheme(
    colors:W3WColors(colors: W3WBasicColors.cellIconFilled),
    styles: W3WStyles(cornerRadius: .soft)
  ))
  
}
