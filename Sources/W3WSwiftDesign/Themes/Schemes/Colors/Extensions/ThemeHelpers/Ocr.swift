//
//  File.swift
//  
//
//  Created by Dave Duprey on 08/09/2023.
//


extension W3WColors {
  
  static public func ocrColors(text: W3WColor, background: W3WColor, outline: W3WColor, outlineFound: W3WColor, outlineError: W3WColor, wordsOutline: W3WColor) -> W3WColors {
    return W3WColors(
      background: background,
      separator: wordsOutline,
      success: W3WBasicColors(
        foreground: text,
        background: outlineFound),
      error: W3WBasicColors(
        foreground: text,
        background: outlineError),
      line: outline)
  }
  
}

extension W3WStyles {
  
  static public func ocrStyle(line: W3WLineThickness, foundLine: W3WLineThickness, fonts: W3WFonts = W3WFonts()) -> W3WStyles {
    return W3WStyles(
      border: line,
      fonts: fonts,
      lineThickness: foundLine
    )
  }
  
}
