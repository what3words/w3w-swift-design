//
//  File.swift
//  
//
//  Created by Dave Duprey on 16/05/2022.
//

import UIKit


public class W3WIconView: UIImageView, W3WViewProtocol {
  
  public var theme: W3WTheme?
  public var position: W3WViewPosition?

  var underlyingImage: W3WImage
  //var iconColors: W3WColorSet


  // MARK: Init

  
  public init(image: W3WImage, theme: W3WTheme? = nil) {
    self.underlyingImage = image
    self.underlyingImage.colors = theme?[.icons]?.colors
    //self.iconColors      = colorSet
    
    super.init(image: self.underlyingImage.get())
    contentMode = .scaleAspectFit
    clipsToBounds = true
    
    set(theme: theme, position: nil)
  }
  
  
  public init(drawing: W3WDrawing, theme: W3WTheme? = nil) {
    self.underlyingImage = W3WImage(drawing: drawing, colors: theme?[.icons]?.colors ?? .standard)
    //self.iconColors      = colorSet
    
    super.init(image: self.underlyingImage.get())
    contentMode = .scaleAspectFit
    clipsToBounds = true
    
    set(theme: theme, position: nil)
  }
  
  
  //public init(systemName: String, colorSet: W3WColorSet = .emptyColorSet, theme: W3WTheme? = nil) {
  public init(systemName: String, theme: W3WTheme? = nil) {
    self.underlyingImage = W3WImage(systemName: systemName, colors: theme?[.icons]?.colors ?? .standard)
    //self.iconColors      = colorSet
    
    super.init(image: self.underlyingImage.get())
    contentMode = .scaleAspectFit
    clipsToBounds = true

    set(theme: theme, position: nil)
  }
  
  
  //public init(file: String, colorSet: W3WColorSet = .emptyColorSet, theme: W3WTheme? = nil) {
  public init(file: String, theme: W3WTheme? = nil) {
    self.underlyingImage = W3WImage(file: file, colors: theme?[.icons]?.colors ?? .standard)
    //self.iconColors      = colorSet
    
    super.init(image: self.underlyingImage.get())
    contentMode = .scaleAspectFit
    clipsToBounds = true

    set(theme: theme, position: nil)
  }
  
  
  public required init?(coder: NSCoder) {
    self.underlyingImage = W3WImage(drawing: W3WDrawing.x, colors: .standard)
    //self.iconColors      = .whiteGrayRed

    super.init(coder: coder)
    contentMode = .scaleAspectFit
    clipsToBounds = true
  }
  
  
  public init(icon: W3WIconView, frame: CGRect? = nil) {
    self.underlyingImage = icon.underlyingImage
    //self.iconColors      = icon.iconColors
    
    super.init(image: self.underlyingImage.get())
    contentMode = .scaleAspectFit
    clipsToBounds = true
    
    self.frame = frame ?? icon.frame
    
    set(theme: icon.theme, position: nil)
  }
  
  
  public func copy(frame: CGRect? = nil) -> W3WIconView {
    return W3WIconView(icon: self, frame: frame)
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

  
  public func updateImage() {
    self.image = underlyingImage.get()
  }
  
  
  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    updateImage()
    updateView()
  }
  
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    updateImage()
    updateView()
  }


  public func update(theme: W3WTheme?) {
    apply(theme: theme)
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
//  public var theme: W3WDesign?
//  public var position: W3WViewPosition?
//  
//  public init(theme: W3WDesign? = nil, position: W3WViewPosition? = nil) {
//    super.init(frame: position?.position() ?? .w3wWhatever)
//    set(theme: theme, position: position)
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
