//
//  File.swift
//  
//
//  Created by Dave Duprey on 17/05/2022.
//

import UIKit


/// A list of drawing elements (circle line, etc) intended as a system
/// independant way of handling icons.  Can be employed by UIKit, or SwiftUI
/// conforms to Sequence so this can be used in loops: `for element in list { }`
/// has + operator for easy concatinating
/// All drawlists limit themselves to the space: (0,0) -> (1,1)
public struct W3WDrawing: Sequence, IteratorProtocol, ExpressibleByArrayLiteral {

  public typealias ArrayLiteralElement = W3WDrawingElement
  
  var count: Int
  
  var list = [W3WDrawingElement]()

  
  public init(arrayLiteral elements: W3WDrawingElement...) {
    self.count = 0
    self.list = elements
  }
  
  
  public init(items: [W3WDrawingElement]) {
    self.count = 0
    self.list = items
  }
  

  public subscript(index: Int) -> W3WDrawingElement {
    return list[index]
  }

  
  public mutating func next() -> W3WDrawingElement? {
    if count >= list.count || count < 0 {
      return nil
    } else {
      defer { count += 1 }
      return list[count]
    }
  }
  
  
  static func +(left: W3WDrawing, right: W3WDrawing) -> W3WDrawing {
    var newList = left.list
    newList.append(contentsOf: right.list)
    
    return W3WDrawing(items: newList)
  }
  
  
  func asCGImage(size: CGSize, colors: W3WColors) -> CGImage? {
    //let scaledSize =  CGSize(width: size.width / UIScreen.main.scale, height: size.height / UIScreen.main.scale)
    UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
    guard let context = UIGraphicsGetCurrentContext() else { return nil }
    draw(context: context, colors: colors, rect: CGRect(origin: .zero, size: size))
    let image = UIGraphicsGetImageFromCurrentImageContext()?.cgImage
    UIGraphicsEndImageContext()
    return image
  }
  
  
  
  // MARK: Maths
  
  
  func scale(point: CGPoint, rect: CGRect) -> CGPoint {
    let f = Swift.min(rect.width, rect.height)
    let xOffset = (rect.width  - f) / 2.0
    let yOffset = (rect.height - f) / 2.0
    return CGPoint(x: point.x * f + xOffset, y: point.y * f + yOffset)
  }
  
  
  func scale(float: CGFloat, rect: CGRect) -> CGFloat {
    let f = Swift.min(rect.width, rect.height)
    return float * f
  }
  
  
  func scale(rectangle: CGRect, rect: CGRect) -> CGRect {
    let sizepoint = scale(point: CGPoint(x: rectangle.size.width, y: rectangle.size.height), rect: rect)
    let size = CGSize(width: sizepoint.x, height: sizepoint.y)
    
    return CGRect(origin: scale(point: rectangle.origin, rect: rect), size: size)
  }

  
  // MARK: Drawing

  
  func draw(_ line: W3WDrawLine, rect: CGRect, context: CGContext, colors: W3WColors) {
    let path = UIBezierPath()
    
    path.move(to: scale(point: line.start, rect: rect))
    path.addLine(to: scale(point: line.end, rect: rect))
    
    colors[line.color].current.uiColor.setStroke()
    path.lineWidth = scale(float: line.width, rect: rect)
    path.stroke()
    path.close()
  }
  
  
  func draw(_ circle: W3WDrawCircle, rect: CGRect, context: CGContext, colors: W3WColors) {
    let path = UIBezierPath(arcCenter: scale(point: circle.center, rect: rect), radius: scale(float: circle.radius, rect: rect), startAngle: 0.0, endAngle: 2.0 * CGFloat.pi, clockwise: true)
    
    colors[circle.color].current.uiColor.setFill()
    path.fill()
    path.close()
  }
  
  
  func draw(_ arc: W3WDrawArc, rect: CGRect, context: CGContext, colors: W3WColors) {
    let path = UIBezierPath(arcCenter: scale(point: arc.center, rect: rect), radius: scale(float: arc.radius, rect: rect), startAngle: arc.start, endAngle: arc.end, clockwise: true)
    
    colors[arc.color].current.uiColor.setStroke()
    path.lineWidth = scale(float: arc.width, rect: rect)
    path.stroke()
    path.close()
  }
  
  
  func draw(_ rectangle: W3WDrawRectangle, rect: CGRect, context: CGContext, colors: W3WColors) {
    let path = UIBezierPath(rect: scale(rectangle: rectangle.rectangle, rect: rect))
    
    colors[rectangle.color].current.uiColor.setFill()
    path.fill()
    path.close()
  }

  
  /// iOS UIView draw function
  func draw(context: CGContext, colors: W3WColors, rect: CGRect) {
    for i in self {
      switch i {
      case .line(let line):
        draw(line, rect: rect, context: context, colors: colors)
      case .circle(let circle):
        draw(circle, rect: rect, context: context, colors: colors)
      case .arc(let arc):
        draw(arc, rect: rect, context: context, colors: colors)
      case .rectangle(let rectangle):
        draw(rectangle, rect: rect, context: context, colors: colors)
      }
    }
  }

  
  
}

