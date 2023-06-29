////
////  File.swift
////  
////
////  Created by Dave Duprey on 17/05/2022.
////
//
//import UIKit
//
//
//
//@available(*, deprecated, renamed: "W3WDrawingView")
//typealias W3WDrawView = W3WDrawingView
//
//
///// Takes a W3WDrawList and renders it into this UIView
//public class W3WDrawingView: UIView {
//
//  /// instructions on how to draw the thing
//  var drawing: W3WDrawing
//  var colors: W3WColorSet
//  
//  
//  // MARK: Init
//  
//  public convenience init() {
//    self.init(frame: .w3wWhatever)
//  }
//  
//  
//  public init(drawing: W3WDrawing, colors: W3WColorSet = .blackGrayRed, frame: CGRect) {
//    self.drawing = drawing
//    self.colors = colors
//    super.init(frame: frame)
//    instantiateUIElements()
//  }
//  
//  
//  public override init(frame: CGRect) {
//    self.drawing = W3WDrawing.x
//    self.colors = .blackGrayRed
//    super.init(frame: frame)
//    instantiateUIElements()
//  }
//  
//  
//  public required init?(coder: NSCoder) {
//    self.drawing = W3WDrawing.x
//    self.colors = .blackGrayRed
//    super.init(coder: coder)
//    instantiateUIElements()
//  }
//  
//  
//  /// set up all the UI stuff, called from the init() functions
//  public func instantiateUIElements() {
//    backgroundColor = .clear
//  }
//  
//
//  // MARK: Accessors
//  
//  
//  public func set(drawing: W3WDrawing) {
//    self.drawing = drawing
//  }
//  
//  
//  func scale(point: CGPoint, rect: CGRect) -> CGPoint {
//    let f = min(rect.width, rect.height)
//    let xOffset = (rect.width  - f) / 2.0
//    let yOffset = (rect.height - f) / 2.0
//    return CGPoint(x: point.x * f + xOffset, y: point.y * f + yOffset)
//  }
//  
//  
//  func scale(float: CGFloat, rect: CGRect) -> CGFloat {
//    let f = min(rect.width, rect.height)
//    return float * f
//  }
//  
//  
//  func scale(rectangle: CGRect, rect: CGRect) -> CGRect {
//    let sizepoint = scale(point: CGPoint(x: rectangle.size.width, y: rectangle.size.height), rect: rect)
//    let size = CGSize(width: sizepoint.x, height: sizepoint.y)
//                     
//    return CGRect(origin: scale(point: rectangle.origin, rect: rect), size: size)
//  }
//  
//  
//  func draw(_ line: W3WDrawLine, rect: CGRect) {
//    let path = UIBezierPath()
//
//    path.move(to: scale(point: line.start, rect: rect))
//    path.addLine(to: scale(point: line.end, rect: rect))
//
//    colors[line.color].current.uiColor.setStroke()
//    path.lineWidth = scale(float: line.width, rect: rect)
//    path.stroke()
//    path.close()
//  }
//  
//  
//  func draw(_ circle: W3WDrawCircle, rect: CGRect) {
//    let path = UIBezierPath(arcCenter: scale(point: circle.center, rect: rect), radius: scale(float: circle.radius, rect: rect), startAngle: 0.0, endAngle: 2.0 * CGFloat.pi, clockwise: true)
//    
//    colors[circle.color].current.uiColor.setFill()
//    path.fill()
//    path.close()
//  }
//  
//  
//  func draw(_ arc: W3WDrawArc, rect: CGRect) {
//    let path = UIBezierPath(arcCenter: scale(point: arc.center, rect: rect), radius: scale(float: arc.radius, rect: rect), startAngle: arc.start, endAngle: arc.end, clockwise: true)
//    
//    colors[arc.color].current.uiColor.setStroke()
//    path.lineWidth = scale(float: arc.width, rect: rect)
//    path.stroke()
//    path.close()
//  }
//  
//  
//  func draw(_ rectangle: W3WDrawRectangle, rect: CGRect) {
//    let path = UIBezierPath(rect: scale(rectangle: rectangle.rectangle, rect: rect))
//    
//    colors[rectangle.color].current.uiColor.setFill()
//    path.fill()
//    path.close()
//  }
//
//  
//  /// iOS UIView draw function
//  open override func draw(_ rect: CGRect) {
//    for i in drawing {
//      switch i {
//      case .line(let line):
//        draw(line, rect: rect)
//      case .circle(let circle):
//        draw(circle, rect: rect)
//      case .arc(let arc):
//        draw(arc, rect: rect)
//      case .rectangle(let rectangle):
//        draw(rectangle, rect: rect)
//      }
//    }
//  }
//
//  
//}
//
