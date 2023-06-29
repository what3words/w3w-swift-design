//
//  File.swift
//  
//
//  Created by Dave Duprey on 21/03/2023.
//

import UIKit



//public class W3WIconSfSymbol: W3WView, W3WIcon {
////  public var design: W3WDesign?
////
////  public var position: W3WViewPosition?
//
//  var systemName: String
//
//  var iconColors: W3WBaseColors?
//
//  public init(systemName: String, iconColors: W3WBaseColors? = nil, design: W3WDesign? = nil) {
//    self.iconColors = iconColors
//    self.systemName = systemName
//
//    super.init(design: design)
//
//    set(design: design, position: position)
//  }
//
//
//  public required init?(coder: NSCoder) {
//    systemName = "questionmark.diamond.fill"
//    super.init(coder: coder)
//    set(design: W3WDesign.none)
//    //contentMode = .scaleAspectFit
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
//  // overrides corner radius, why???
////  open override func draw(_ rect: CGRect) {
////    var image: UIImage!
////
////    if #available(iOS 13.0, *) {
////      image = UIImage(systemName: systemName)
////    } else {
////      image = UIImage(cgImage: )
////    }
////    image?.draw(in: rect)
////  }
//
//}

//@available(iOS 13.0, *)
//public class W3WIconSfSymbol: UIImageView, W3WViewProtocol, W3WIcon {
//
//  public var design: W3WDesign?
//  public var position: W3WViewPosition?
//
//  var systemName: String
//  var iconColors: W3WBaseColors?
//
//  public init(systemName: String, iconColors: W3WBaseColors? = nil, design: W3WDesign? = nil, position: W3WViewPosition? = nil) {
//    self.iconColors = iconColors
//    self.systemName = systemName
//
//    super.init(image: Self.makeIcon(systemName: systemName, iconColors: iconColors))
//    set(design: design, position: position)
//
//    tintColor = iconColors?.foreground?.current.uiColor
//    contentMode = .scaleAspectFit
//  }
//
//
//  public required init?(coder: NSCoder) {
//    systemName = ""
//    super.init(coder: coder)
//    set(design: W3WDesign.none)
//    contentMode = .scaleAspectFit
//  }
//
//
//  /// make sf symbol icon with colours provided
//  static func makeIcon(systemName: String, iconColors: W3WBaseColors? = nil) -> UIImage? {
//    if #available(iOS 15.0, *) {
//      if let c = iconColors?.asColorSet() {
//        let configuration = UIImage.SymbolConfiguration(paletteColors: [
//          c.foreground?.current.uiColor ?? W3WColor.foreground.current.uiColor,
//          c.secondary?.current.uiColor  ?? W3WColor.foreground.current.uiColor,
//          c.tint?.current.uiColor       ?? W3WColor.foreground.current.uiColor
//        ])
//        return UIImage(systemName: systemName, withConfiguration: configuration)?.withRenderingMode(.automatic)
//      }
//    }
//
//    return UIImage(systemName: systemName) //?.withTintColor(iconColors?.foreground?.current.uiColor ?? W3WColor.foreground.current.uiColor)
//  }
//
////  let icon = UIImage(systemName: systemName, withConfiguration: )?.withRenderingMode(.automatic)
////
////  if #available(iOS 15.0, *) {
////    if let c = iconColors as? W3WColorSet {
////      icon?.configuration = UIImage.SymbolConfiguration(paletteColors: [iconColors?.foreground?.current.uiColor ?? W3WColor.foreground.current.uiColor, iconColors?.secondary?.current.uiColor ?? W3WColor.foreground.current.uiColor, iconColors?.tint?.current.uiColor ?? W3WColor.foreground.current.uiColor])
////    }
////    super.init(image: UIImage(systemName: systemName, withConfiguration: iconConfiguration)?.withRenderingMode(.automatic))
////    //    } else {
////    //      super.init(image: UIImage(systemName: systemName))
////  }
//
//
//  /// convert this view into a UIImage
//  public func asImage(size: CGSize) -> UIImage? {
//    let renderer = UIGraphicsImageRenderer(bounds: CGRect(origin: .zero, size: size))
//    return renderer.image { rendererContext in
//      layer.render(in: rendererContext.cgContext)
//    }
//
////    let icon = Self.makeIcon(systemName: systemName, iconColors: iconColors)
////    return icon
//
//    //let s = size ?? position?.position().size ?? frame.size
//    //if let s = size ?? position?.position().size ?? frame.size {
//    //  return UIGraphicsImageRenderer(size: s).image { _ in
//    //    draw(CGRect(origin: .zero, size: s))
//    //  }
//    //}
//
////    UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0.0)
////    self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
////    self.draw(self.bounds)
////    let image = UIGraphicsGetImageFromCurrentImageContext()
////    UIGraphicsEndImageContext()
////    return image
//  }
//
//
//
//  func updateColors() {
//    image = Self.makeIcon(systemName: systemName, iconColors: iconColors)
//  }
//
//
//  // MARK: Callbacks
//
//
//  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//    updateView()
//  }
//
//
//  public override func layoutSubviews() {
//    super.layoutSubviews()
//    updateView()
//  }
//
//
//}
