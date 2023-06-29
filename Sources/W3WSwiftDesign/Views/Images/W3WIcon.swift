//
//  File.swift
//  
//
//  Created by Dave Duprey on 16/05/2022.
//

import UIKit


public class W3WIcon: UIImageView, W3WViewProtocol {
  
  public var design: W3WDesign?
  public var position: W3WViewPosition?

  var underlyingImage: W3WImage
  var iconColors: W3WColorSet


  // MARK: Init


  public init(drawing: W3WDrawing, iconColors: W3WColorSet = .standard.asColorSet(), design: W3WDesign? = nil) {
    self.underlyingImage = W3WImage(drawing: drawing, colors: iconColors)
    self.iconColors      = iconColors
    
    super.init(image: self.underlyingImage.get())
    contentMode = .scaleAspectFit
    
    set(design: design, position: nil)
  }
  
  
  public init(systemName: String, iconColors: W3WColorSet = .emptyColorSet, design: W3WDesign? = nil) {
    self.underlyingImage = W3WImage(systemName: systemName, colors: iconColors)
    self.iconColors      = iconColors
    
    super.init(image: self.underlyingImage.get())
    contentMode = .scaleAspectFit
    
    set(design: design, position: nil)
  }
  
  
  public init(file: String, iconColors: W3WColorSet = .emptyColorSet, design: W3WDesign? = nil) {
    self.underlyingImage = W3WImage(file: file, colors: iconColors)
    self.iconColors      = iconColors
    
    super.init(image: self.underlyingImage.get())
    contentMode = .scaleAspectFit
    
    set(design: design, position: nil)
  }

  
  public required init?(coder: NSCoder) {
    self.underlyingImage = W3WImage(drawing: W3WDrawing.x, colors: .what3words)
    self.iconColors      = .whiteGrayRed

    super.init(coder: coder)
    contentMode = .scaleAspectFit
  }
  
  
  /// convert this view into a UIImage
  public func asImage(size: CGSize) -> UIImage? {
    return underlyingImage.get(size: size)
//    let s = size // ?? self.bounds.size
//    let b = CGRect(origin: .zero, size: s)
//    UIGraphicsBeginImageContextWithOptions(s, false, 0.0)
//    self.drawHierarchy(in: b, afterScreenUpdates: true)
//    self.draw(b)
//    let image = UIGraphicsGetImageFromCurrentImageContext()
//    UIGraphicsEndImageContext()
//    return image
  }

  
  
  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    self.image = underlyingImage.get()
    updateView()
  }
  
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    self.image = underlyingImage.get()
    updateView()
  }

  
}


//public protocol W3WIcon: UIView {
//
//  func updateView()
//  func asImage(size: CGSize) -> UIImage?
//
//}


//public class W3WIcon: UIImageView, W3WViewProtocol {
//  
//  public var design: W3WDesign?
//  public var position: W3WViewPosition?
//  
//  public init(design: W3WDesign? = nil, position: W3WViewPosition? = nil) {
//    super.init(frame: position?.position() ?? .w3wWhatever)
//    set(design: design, position: position)
//  }
//  
//  
//  required init?(coder: NSCoder) {
//    super.init(coder: coder)
//  }
//  
//  
//  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//    updateView()
//  }
//  
//}



//public enum W3WIconName: String {
//  case search = "magnifyingglass"
//}
//  static public let micOn   = W3WIcon(drawing: .micWithSlashes, colors: .microphoneOn)
//  static public let micOff  = W3WIcon(drawing: .micWithSlashes, colors: .microphoneOff)
//  static public let micGray = W3WIcon(drawing: .micWithSlashes, colors: .microphoneGray)
//  static public let ocr     = W3WIcon(drawing: .ocr)


/// An icon made from eitehr an bitmap resource, or a W3WDrawList
//public class W3WIconOld: UIView {
//
//  static public let defaultFrame = CGRect(x: 0.0, y: 0.0, width: W3WRowHeight.extraSmall.value, height: W3WRowHeight.extraSmall.value)
//
//  var image: UIView?
//  var drawing: W3WDrawing?
//  var colors: W3WColorSet?
//  var padding: W3WPadding!
//
//
//  public init(systemName: String, colors: W3WColorSet = .blackGrayRed, frame: CGRect = W3WIcon.defaultFrame, padding: W3WPadding = .none) {
//    super.init(frame: frame)
//    set(systemName: systemName, colors: colors, padding: padding)
//  }
//
//
//  public init(drawing: W3WDrawing, colors: W3WColorSet = .blackGrayRed, frame: CGRect = W3WIcon.defaultFrame, padding: W3WPadding = .none) {
//    super.init(frame: frame)
//    set(drawing: drawing, colors: colors, padding: padding)
//  }
//
//
//  required init?(coder: NSCoder) {
//    self.colors = .blackGrayRed
//    super.init(coder: coder)
//  }
//
//
//  // MARK: Accessors
//
//
//  public func set(systemName: String, colors: W3WColorSet, padding: W3WPadding = .none) {
//    self.padding = padding
//    self.colors  = colors
//
//    if #available(iOS 13.0, *) {
//      image = UIImageView(image: UIImage(systemName: systemName))
//    } else {
//      // Fallback on earlier versions
//    }
//
//    if let c = colors.foreground {
//      image?.tintColor = c.current.uiColor
//    }
//    image?.frame = frame.inset(by: UIEdgeInsets(top: padding.value, left: padding.value, bottom: padding.value, right: padding.value))
//
//    if let i = image {
//        addSubview(i)
//    }
//  }
//
//
//  public func set(drawing: W3WDrawing, colors: W3WColorSet, padding: W3WPadding = .none) {
//    self.padding = padding
//    self.colors  = colors
//    self.drawing = drawing
//
//    for v in subviews {
//      v.removeFromSuperview()
//    }
//
//    image = W3WDrawingView(drawing: drawing, colors: colors, frame: frame.inset(by: UIEdgeInsets(top: padding.value, left: padding.value, bottom: padding.value, right: padding.value)))
//
//    if let i = image {
//      addSubview(i)
//    }
//  }
//
//
//  public func uiImage() -> UIImage {
//    if #available(iOS 10.0, *) {
//      let renderer = UIGraphicsImageRenderer(bounds: bounds)
//      return renderer.image { rendererContext in
//        layer.render(in: rendererContext.cgContext)
//      }
//    } else {
//      UIGraphicsBeginImageContext(self.frame.size)
//      self.layer.render(in:UIGraphicsGetCurrentContext()!)
//      let image = UIGraphicsGetImageFromCurrentImageContext()
//      UIGraphicsEndImageContext()
//      return UIImage(cgImage: image!.cgImage!)
//    }
//  }
//
//
//  // MARK: Layout
//
//  public override func layoutSubviews() {
//    super.layoutSubviews()
//    image?.frame = CGRect(x: padding.value, y: padding.value, width: frame.width - padding.value * 2.0, height: frame.height - padding.value * 2.0)
//
////    if let d = drawing, let i = image {
////      d.draw(uiView: i)
////    }
//  }
//
//}
