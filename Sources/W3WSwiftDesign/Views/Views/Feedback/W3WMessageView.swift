//
//  File.swift
//  
//
//  Created by Dave Duprey on 11/08/2021.
//
#if !os(macOS) && !os(watchOS)

import UIKit


/// a view that has a line at the top
public class W3WMessageView: UIView {
  
  var colors: W3WColors? // = .blackGrayRedScheme
  
  public var drawLine = true
  
  // Init
  public init(frame: CGRect, colors: W3WColors = .blackGrayRedScheme) {
    super.init(frame: frame)
    setupUI(colors: colors)
  }
  
  
  public required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    setupUI(colors: colors)
  }

  
  func setupUI(colors: W3WColors?) {
    self.colors = colors
  }
  
  
  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)
    updateColours()
  }

  
  func updateColours() {
    if let c = colors?.background { backgroundColor   = c.current.uiColor }
    if let c = colors?.border     { layer.borderColor = c.current.cgColor }
    if let c = colors?.tint       { tintColor         = c.current.uiColor }

    setNeedsDisplay()
  }
   

  func updateGeometry() {
    setNeedsLayout()
  }

  
  /// draws in some diesign elements
  override public func draw(_ rect: CGRect) {
    if drawLine {
      let cgContext = UIGraphicsGetCurrentContext()
      cgContext?.move(to: CGPoint(x: rect.minX, y: rect.minY))
      cgContext?.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
      cgContext?.setStrokeColor(colors?.tint?.current.cgColor ?? W3WColor.border.current.cgColor)
      cgContext?.setLineWidth(3.0)
      cgContext?.strokePath()
    } else {
      super.draw(rect)
    }
  }
  
  
}

#endif
