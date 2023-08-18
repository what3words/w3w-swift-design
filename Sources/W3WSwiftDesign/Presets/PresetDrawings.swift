//
//  File.swift
//  
//
//  Created by Dave Duprey on 01/09/2022.
//

import UIKit


/// commonly used w3w drawlists such as mic icon, tripple slashes etc
extension W3WDrawing {
  
  /// check mark
  public static let check: W3WDrawing = [
    // circle
    .arc(W3WDrawArc(center: CGPoint(x: 0.5, y: 0.5), radius: 0.475, start: 0.0, end: 2.0 * .pi, color: .foreground, width: 0.05)),
    
    // check
    .line(W3WDrawLine(start: CGPoint(x: 5.75 / 20.0, y: 11.5 / 20.0), end: CGPoint(x: 7.75 / 20.0, y: 13.5 / 20.0), color: .foreground, width: 0.05)),
    .line(W3WDrawLine(start: CGPoint(x: 7.75 / 20.0, y: 13.5 / 20.0), end: CGPoint(x: 14.75 / 20.0, y: 6.5 / 20.0), color: .foreground, width: 0.05)),
    
    // line endpoints
    .circle(W3WDrawCircle(center: CGPoint(x: 5.75 / 20.0, y: 11.5 / 20.0), radius: 0.025, color: .foreground)),
    .circle(W3WDrawCircle(center: CGPoint(x: 7.75 / 20.0, y: 13.5 / 20.0), radius: 0.025, color: .foreground)),
    .circle(W3WDrawCircle(center: CGPoint(x: 14.75 / 20.0, y: 6.5 / 20.0), radius: 0.025, color: .foreground)),
  ]
  
  
  /// microphone icon
  public static let mic: W3WDrawing = [
    // base
    .line(W3WDrawLine(start: CGPoint(x: 0.37,  y: 0.975), end: CGPoint(x: 0.63, y: 0.975), color: .foreground, width: 0.05)),
    .line(W3WDrawLine(start: CGPoint(x: 0.50,  y: 1.00),  end: CGPoint(x: 0.50, y: 0.85),  color: .foreground, width: 0.05)),
    
    // base line ends
    .circle(W3WDrawCircle(center: CGPoint(x: 0.37,  y: 0.975), radius: 0.025, color: .foreground)),
    .circle(W3WDrawCircle(center: CGPoint(x: 0.63, y: 0.975), radius: 0.025, color: .foreground)),
    
    // oval handle
    .arc(W3WDrawArc(center:  CGPoint(x: 0.50,  y: 0.50), radius: 0.35, start: 0.0, end: .pi, color: .foreground, width: 0.05)),
    .line(W3WDrawLine(start: CGPoint(x: 0.15,  y: 0.45),  end: CGPoint(x: 0.15,  y: 0.50), color: .foreground, width: 0.05)),
    .circle(W3WDrawCircle(center: CGPoint(x: 0.15,  y: 0.45), radius: 0.025, color: .foreground)),
    .line(W3WDrawLine(start: CGPoint(x: 0.85,  y: 0.45),  end: CGPoint(x: 0.85,  y: 0.50), color: .foreground, width: 0.05)),
    .circle(W3WDrawCircle(center: CGPoint(x: 0.85,  y: 0.45), radius: 0.025, color: .foreground)),
    
    // oval bottom
    .arc(W3WDrawArc(center:  CGPoint(x: 0.50,  y: 0.50), radius: 0.25, start: 0.0, end: .pi, color: .foreground, width: 0.05)),
    
    // oval sides
    .line(W3WDrawLine(start: CGPoint(x: 0.75, y: 0.25), end: CGPoint(x: 0.75, y: 0.5), color: .foreground, width: 0.05)),
    .line(W3WDrawLine(start: CGPoint(x: 0.25, y: 0.25), end: CGPoint(x: 0.25, y: 0.5), color: .foreground, width: 0.05)),
    
    // oval top
    .arc(W3WDrawArc(center:  CGPoint(x: 0.50,  y: 0.25 + 0.025), radius: 0.25, start: .pi, end: .pi * 2.0, color: .foreground, width: 0.05)),
  ]
  
  
  /// filled background for a mic icon
  public static let micFill: W3WDrawing = [
    // oval bottom
    .circle(W3WDrawCircle(center: CGPoint(x: 0.50,  y: 0.50), radius: 0.25, color: .foreground)),
    
    // oval sides
    .line(W3WDrawLine(start: CGPoint(x: 0.50,  y: 0.50), end: CGPoint(x: 0.50,  y: 0.25 + 0.025), color: .foreground, width: 0.5)),
    
    // oval top
    .circle(W3WDrawCircle(center:  CGPoint(x: 0.50,  y: 0.25 + 0.025), radius: 0.25, color: .foreground)),
  ]
  
  
  /// slashes that go inside the mic icon
  public static let micSlashes: W3WDrawing = [
    .line(W3WDrawLine(start: CGPoint(x: 0.54,  y: 0.275), end: CGPoint(x: 0.46, y: 0.525), color: .tint, width: 0.05)),
    .circle(W3WDrawCircle(center: CGPoint(x: 0.54, y: 0.275), radius: 0.025, color: .tint)),
    .circle(W3WDrawCircle(center: CGPoint(x: 0.46, y: 0.525), radius: 0.025, color: .tint)),
    
    .line(W3WDrawLine(start: CGPoint(x: 0.54 - 0.1,  y: 0.275), end: CGPoint(x: 0.46 - 0.1, y: 0.525), color: .tint, width: 0.05)),
    .circle(W3WDrawCircle(center: CGPoint(x: 0.54 - 0.1, y: 0.275), radius: 0.025, color: .tint)),
    .circle(W3WDrawCircle(center: CGPoint(x: 0.46 - 0.1, y: 0.525), radius: 0.025, color: .tint)),
    
    .line(W3WDrawLine(start: CGPoint(x: 0.54 + 0.1,  y: 0.275), end: CGPoint(x: 0.46 + 0.1, y: 0.525), color: .tint, width: 0.05)),
    .circle(W3WDrawCircle(center: CGPoint(x: 0.54 + 0.1, y: 0.275), radius: 0.025, color: .tint)),
    .circle(W3WDrawCircle(center: CGPoint(x: 0.46 + 0.1, y: 0.525), radius: 0.025, color: .tint)),
  ]
  
  
  /// circle to go around a mic icon
  public static let micCircle: W3WDrawing = [
    .circle(W3WDrawCircle(center: CGPoint(x: 0.50,  y: 0.50), radius: 0.2, color: .background)),
  ]
  
  
  /// mic icon with the slashes inside
  public static let micWithSlashes: W3WDrawing = .mic + .micSlashes
  
  
  /// mic icon filled, with slashes
  public static let micFilledWithSlashes: W3WDrawing = .micFill + .mic + .micSlashes
  
  
  /// corners of the OCR icon
  public static let ocrOutline: W3WDrawing = .makeOcrOutline()
  
  
  // makes an OCR icon corners
  public static func makeOcrOutline(lineWidth: CGFloat = 0.05, length: CGFloat = 0.2) -> W3WDrawing {
    return [
      .line(W3WDrawLine(start: CGPoint(x: 0.0, y: 0.0), end: CGPoint(x: length, y: 0.0), color: .foreground, width: lineWidth)),
      .line(W3WDrawLine(start: CGPoint(x: 0.0, y: 0.0), end: CGPoint(x: 0.0, y: length), color: .foreground, width: lineWidth)),
      
      .line(W3WDrawLine(start: CGPoint(x: 0.0, y: 1.0), end: CGPoint(x: 0.0, y: 1.0 - length), color: .foreground, width: lineWidth)),
      .line(W3WDrawLine(start: CGPoint(x: 0.0, y: 1.0), end: CGPoint(x: length, y: 1.0), color: .foreground, width: lineWidth)),
      
      .line(W3WDrawLine(start: CGPoint(x: 1.0, y: 1.0), end: CGPoint(x: 1.0, y: 1.0 - length), color: .foreground, width: lineWidth)),
      .line(W3WDrawLine(start: CGPoint(x: 1.0, y: 1.0), end: CGPoint(x: 1.0 - length, y: 1.0), color: .foreground, width: lineWidth)),
      
      .line(W3WDrawLine(start: CGPoint(x: 1.0, y: 0.0), end: CGPoint(x: 1.0, y: length), color: .foreground, width: lineWidth)),
      .line(W3WDrawLine(start: CGPoint(x: 1.0, y: 0.0), end: CGPoint(x: 1.0 - length, y: 0.0), color: .foreground, width: lineWidth)),
    ]
  }
  
  
  /// w3w slashes
  public static func makeSlashes(offset: CGFloat = 0.1, spacing: CGFloat = 0.3, width: CGFloat = 0.1, verticalInset: CGFloat = 0.2, translation: CGPoint = .zero, color: W3WColorSetNames = .tint) -> W3WDrawing {
    
    let l0top     = CGPoint(x: 0.5 + offset + translation.x,  y: verticalInset + translation.y)
    let l0bottom  = CGPoint(x: 0.5 - offset + translation.x, y: 1.0 - verticalInset + translation.y)
    
    let l1top     = CGPoint(x: 0.5 + offset + translation.x - spacing,  y: verticalInset + translation.y)
    let l1bottom  = CGPoint(x: 0.5 - offset + translation.x - spacing, y: 1.0 - verticalInset + translation.y)
    
    let l2top     = CGPoint(x: 0.5 + offset + translation.x + spacing,  y: verticalInset + translation.y)
    let l2bottom  = CGPoint(x: 0.5 - offset + translation.x + spacing, y: 1.0 - verticalInset + translation.y)
    
    return [
      .line(W3WDrawLine(start: l0top, end: l0bottom, color: color, width: width)),
      .circle(W3WDrawCircle(center: l0top,    radius: width / 2.0, color: color)),
      .circle(W3WDrawCircle(center: l0bottom, radius: width / 2.0, color: color)),
      
      .line(W3WDrawLine(start: l1top, end: l1bottom, color: color, width: width)),
      .circle(W3WDrawCircle(center: l1top,    radius: width / 2.0, color: color)),
      .circle(W3WDrawCircle(center: l1bottom, radius: width / 2.0, color: color)),
      
      .line(W3WDrawLine(start: l2top, end: l2bottom, color: color, width: width)),
      .circle(W3WDrawCircle(center: l2top,    radius: width / 2.0, color: color)),
      .circle(W3WDrawCircle(center: l2bottom, radius: width / 2.0, color: color)),
    ]
  }
  
  
  /// ocr icon, corners and slashes
  public static let ocr = .makeOcrOutline(lineWidth: 0.1, length: 0.25) + .makeSlashes(offset: 0.075, spacing: 0.175, width: 0.06, verticalInset: 0.28)
  
  
  /// halo for mic icon
  public static func halo(radius: CGFloat, center: CGPoint = CGPoint(x: 0.5, y: 0.5)) -> W3WDrawing {
    return [
      .circle(W3WDrawCircle(center: center, radius: radius * 1.000, color: .background)),
      .circle(W3WDrawCircle(center: center, radius: radius * 0.709, color: .foreground)),
      .circle(W3WDrawCircle(center: center, radius: radius * 0.484, color: .tint))
    ]
  }
  
  
  public static let mapPinBackground: W3WDrawing = [
    .rectangle(W3WDrawRectangle(rectangle: CGRect(x: 0.075, y: 0.0, width: 0.85, height: 0.85), color: .background)),
    .line(W3WDrawLine(start: CGPoint(x: 0.2 + 0.1, y: 0.7 - 0.1), end: CGPoint(x: 0.5 + 0.1, y: 1.0 - 0.1), color: .background, width: 0.25))
  ]
  
  
  public static let mapPin: W3WDrawing = .mapPinBackground + .makeSlashes(offset: 0.055, spacing: 0.175, width: 0.06, verticalInset: 0.32, translation: CGPoint(x: 0.0, y: -0.055), color: .foreground)
  
  
  public static let mapCircleBackground: W3WDrawing = [
    .circle(W3WDrawCircle(center: CGPoint(x: 0.5, y: 0.5), radius: 0.5, color: .foreground)),
    .circle(W3WDrawCircle(center: CGPoint(x: 0.5, y: 0.5), radius: 0.45, color: .background)),
  ]
  
  
  public static let mapCircle: W3WDrawing = .mapCircleBackground + .makeSlashes(offset: 0.055, spacing: 0.175, width: 0.06, verticalInset: 0.32, color: .foreground)

  
  /// X used for close buttons and such
  public static let x: W3WDrawing = [
    .line(W3WDrawLine(start: .zero, end: CGPoint(x: 1.0, y: 1.0), color: .foreground, width: 0.05)),
    .line(W3WDrawLine(start: CGPoint(x: 0.0, y: 1.0), end: CGPoint(x: 1.0, y: 0.0), color: .foreground, width: 0.05)),
  ]

  
  public static let chevronBackwards: W3WDrawing = [
    .line(W3WDrawLine(start: CGPoint(x: 0.325, y: 0.5), end: CGPoint(x: 0.62, y: 0.2), color: .foreground, width: 0.065)),
    .line(W3WDrawLine(start: CGPoint(x: 0.325, y: 0.5), end: CGPoint(x: 0.62, y: 0.8), color: .foreground, width: 0.065)),
    .circle(W3WDrawCircle(center: CGPoint(x: 0.325, y: 0.5),  radius: 0.0325, color: .foreground)),
    .circle(W3WDrawCircle(center: CGPoint(x: 0.62, y: 0.2), radius: 0.0325, color: .foreground)),
    .circle(W3WDrawCircle(center: CGPoint(x: 0.62, y: 0.8), radius: 0.0325, color: .foreground)),

  ]

  
}
