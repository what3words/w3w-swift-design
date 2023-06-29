//
//  File.swift
//  
//
//  Created by Dave Duprey on 25/04/2023.
//


public class W3WColorListCell: W3WColorSet {
  
  var icon: W3WColorSet?
  var accessory: W3WColor?
  
  public init(main: W3WColorSet? = nil, icon: W3WColorSet? = nil, accessory: W3WColor? = nil) {
    super.init(colors: main)
    
    self.icon = icon ?? main?.with(background: main?.findTint())
    self.accessory = accessory
  }

}
