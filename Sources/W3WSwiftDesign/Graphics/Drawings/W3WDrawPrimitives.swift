//
//  File.swift
//  
//
//  Created by Dave Duprey on 12/05/2022.
//

import UIKit


/// Base protocol for a piece of a drawing
public protocol W3WDrawingPrimitive {
}


/// A line
public struct W3WDrawLine: W3WDrawingPrimitive {
  public let start: CGPoint
  public let end: CGPoint
  public let color: W3WColorSetNames
  public let width: CGFloat
}


/// A circle
public struct W3WDrawCircle: W3WDrawingPrimitive {
  public let center: CGPoint
  public let radius: CGFloat
  public let color: W3WColorSetNames
}


/// An arc
public struct W3WDrawArc: W3WDrawingPrimitive {
  public let center: CGPoint
  public let radius: CGFloat
  public let start:  CGFloat
  public let end:    CGFloat
  public let color: W3WColorSetNames
  public let width: CGFloat
}


/// A line
public struct W3WDrawRectangle: W3WDrawingPrimitive {
  public let rectangle: CGRect
  public let color: W3WColorSetNames
}


/// An enum that holds either a line, circle or arc
public enum W3WDrawingElement {
  case line(W3WDrawLine)
  case circle(W3WDrawCircle)
  case arc(W3WDrawArc)
  case rectangle(W3WDrawRectangle)
}

