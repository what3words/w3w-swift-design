//
//  File.swift
//  
//
//  Created by Dave Duprey on 09/09/2023.
//


// experimental...

public struct W3WScheme {
  
  public var colors: W3WColors?
  public var styles: W3WStyles?
  
  public init(colors: W3WColors? = nil, styles: W3WStyles? = nil) {
    self.colors = colors
    self.styles = styles
  }
 
  
  /// copy a color set from one set to another
  public func copy() -> W3WScheme {
    return W3WScheme(colors: W3WColors(colors: colors), styles: W3WStyles(style: styles))
  }

  
  public var description: String {
    return (colors?.description ?? "") + "\n" + (styles?.description ?? "")
  }

  
}
