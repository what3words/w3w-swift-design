//
//  W3WColorSetNames.swift
//  
//
//  Created by Dave Duprey on 25/04/2023.
//


/// Used to indicate colors in a W3WColorSet as a parameter
/// can be used as a subscript eg: `colors[.background]`
/// this way colour choices can be made data and stored
/// in drawing data
public enum W3WColorSetNames {
  case foreground
  case secondary
  case background
  case tint
}
