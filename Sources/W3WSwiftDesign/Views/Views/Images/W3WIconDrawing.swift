//
//  File.swift
//  
//
//  Created by Dave Duprey on 20/03/2023.
//

import UIKit



//public class W3WIconDrawing: W3WView, W3WIcon {
//
////  public var theme: W3WDesign?
////  public var position: W3WViewPosition?
//
//  var drawing: W3WDrawing
//  var iconColors: W3WColorSet
//
//
//  // MARK: Init
//
//
//  public init(drawing: W3WDrawing, iconColors: W3WColorSet, theme: W3WDesign? = nil, position: W3WViewPosition? = nil) {
//    self.drawing = drawing
//    self.iconColors = iconColors
//    super.init(theme: theme)
//    self.backgroundColor = .clear
//    set(theme: theme, position: position)
//  }
//
//
//  public required init?(coder: NSCoder) {
//    self.drawing = W3WDrawing.x
//    self.iconColors = .whiteGrayRed
//    super.init(coder: coder)
//  }
//
//
////  func configure() {
////  }
//
//
//  // MARK: Traits
//
//
//  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//    updateView()
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
//  /// convert this view into a UIImage
//  public func asImage(size: CGSize) -> UIImage? {
//    let s = size // ?? self.bounds.size
//    let b = CGRect(origin: .zero, size: s)
//    UIGraphicsBeginImageContextWithOptions(s, false, 0.0)
//    self.drawHierarchy(in: b, afterScreenUpdates: true)
//    self.draw(b)
//    let image = UIGraphicsGetImageFromCurrentImageContext()
//    UIGraphicsEndImageContext()
//    return image
//  }
//
//
//
//  // MARK: Drawing
//
//
//  func draw(_ line: W3WDrawLine, rect: CGRect) {
//    let path = UIBezierPath()
//
//    path.move(to: scale(point: line.start, rect: rect))
//    path.addLine(to: scale(point: line.end, rect: rect))
//
//    iconColors[line.color].current.uiColor.setStroke()
//    path.lineWidth = scale(float: line.width, rect: rect)
//    path.stroke()
//    path.close()
//  }
//
//
//  func draw(_ circle: W3WDrawCircle, rect: CGRect) {
//    let path = UIBezierPath(arcCenter: scale(point: circle.center, rect: rect), radius: scale(float: circle.radius, rect: rect), startAngle: 0.0, endAngle: 2.0 * CGFloat.pi, clockwise: true)
//
//    iconColors[circle.color].current.uiColor.setFill()
//    path.fill()
//    path.close()
//  }
//
//
//  func draw(_ arc: W3WDrawArc, rect: CGRect) {
//    let path = UIBezierPath(arcCenter: scale(point: arc.center, rect: rect), radius: scale(float: arc.radius, rect: rect), startAngle: arc.start, endAngle: arc.end, clockwise: true)
//
//    iconColors[arc.color].current.uiColor.setStroke()
//    path.lineWidth = scale(float: arc.width, rect: rect)
//    path.stroke()
//    path.close()
//  }
//
//
//  func draw(_ rectangle: W3WDrawRectangle, rect: CGRect) {
//    let path = UIBezierPath(rect: scale(rectangle: rectangle.rectangle, rect: rect))
//
//    iconColors[rectangle.color].current.uiColor.setFill()
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
