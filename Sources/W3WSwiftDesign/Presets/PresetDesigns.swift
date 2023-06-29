//
//  File.swift
//  
//
//  Created by Dave Duprey on 17/03/2023.
//

import UIKit


extension W3WDesign {
  
  public static let defaults   = W3WDesign()
  public static let standard   = W3WDesign(colors: .standard,   style: .standard)
  public static let what3words = W3WDesign(colors: .what3words, style: .what3words)
  public static let demo       = W3WDesign(colors: .demo)
  
  public static let debug      = W3WDesign(colors: .debug, style: .debug)
  
  //public static let outlined   = W3WDesign.standard.with(style: .standard.with(border: W3WBorder(value: 1.0))).with(colors: .standard.with(border: .aqua).with(background: .orange))
  
  
//  public static let w3wScheme = W3WDesignScheme(
//    base: .what3words,
//    cells: .what3words
//  )
  

  // public static let w3w
  
  
  // design for a what3words branded tableviewcell
  public static let w3wCell = W3WDesign(
    colors: W3WColorSet(foreground: .text, background: .background, tint: .slash, secondary: .secondaryLabel)
  )

  public static let w3wCellIconFilled = W3WDesign(
    colors: .cellIconFilled,
    style: W3WStyle(cornerRadius: .soft)
  )
  
}
