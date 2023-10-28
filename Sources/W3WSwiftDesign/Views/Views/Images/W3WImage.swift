//
//  File.swift
//  
//
//  Created by Dave Duprey on 20/04/2023.
//

import UIKit


enum W3WImageSource {
  case drawing(W3WDrawing)
  case system(String)
  case file(String)
}


public class W3WImage {

  var imageSource: W3WImageSource!
  var colors: W3WColors!
  
  
  public init(systemName: String, colors: W3WColors) {
    self.imageSource = .system(systemName)
    self.colors = colors
  }
  
  
  public init(drawing: W3WDrawing, colors: W3WColors) {
    imageSource = .drawing(drawing)
    self.colors = colors
  }
  
  
  public init(file: String, colors: W3WColors) {
    imageSource = .file(file)
    self.colors = colors
  }

  
  public func get(size: CGSize = W3WIconSize.largeIcon.value) -> UIImage {
    switch imageSource {
    case .drawing(let drawing):
      return from(drawing: drawing, size: size)
    case .system(let system):
      return from(symbol: system, size: size)
    case .file(let file):
      return from(file: file, size: size)
    case .none:
      return UIImage()
    }
  }
  
  
  func from(drawing: W3WDrawing, size: CGSize) -> UIImage {
    return UIImage(cgImage: drawing.asCGImage(size: size, colors: colors ?? .standardIcons)!)
  }
  
  
  func from(file: String, size: CGSize) -> UIImage {
    if let maskImage = UIImage(named: file, in: Bundle.module, compatibleWith: nil)?.withRenderingMode(.alwaysTemplate) {
      let bounds = CGRect(origin: .zero, size: size)

      UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
      let context = UIGraphicsGetCurrentContext()
      
      context?.clip(to: bounds, mask: maskImage.cgImage!)
      if let color = colors?.foreground?.current.cgColor {
        context?.setFillColor(color)
      }
      context?.fill(bounds)
      
      if let image = UIGraphicsGetImageFromCurrentImageContext()?.cgImage {
        UIGraphicsEndImageContext()
        return UIImage(cgImage: image, scale: 1.0, orientation: .down)
      } else {
        UIGraphicsEndImageContext()
      }

//      if let image = context?.makeImage() {
//        return UIImage(cgImage: image)
//      }
    }
    
    return UIImage()
  }
  
  
  func from(symbol: String, size: CGSize) -> UIImage {
    
    // if SF Symbols can take multi-colour, and colours are available
    if #available(iOS 15.0, *) {
      var colorArray = [UIColor]()
      
      if let foreground = colors?.foreground?.current.uiColor {
        colorArray.append(foreground)
      }
      
      if let secondary = colors?.secondary?.current.uiColor {
        colorArray.append(secondary)
      }
      
      if let tint = colors?.tint?.current.uiColor {
        colorArray.append(tint)
      }
      
      let configuration = UIImage.SymbolConfiguration(paletteColors: colorArray)
      
      if let image = UIImage(systemName: symbol, withConfiguration: configuration) {
        return image.withRenderingMode(.automatic)
      }
    }
      
//      if let foreground = colors?.foreground?.current.uiColor, let secondary = colors?.secondary?.current.uiColor, let tint = colors?.tint?.current.uiColor {
//        let configuration = UIImage.SymbolConfiguration(paletteColors: [foreground, secondary, tint])
//        return UIImage(systemName: symbol, withConfiguration: configuration)!.withRenderingMode(.automatic)
//      }
      
    if #available(iOS 13.0, *) { // if we have SF Symbols available at all
      // if there is a tint colour
      if let tint = colors?.tint?.current.uiColor {
        return UIImage(systemName: symbol)!.withTintColor(tint)
        
      // no tint colour, go with foreground color
      } else if let color = colors?.foreground?.current.uiColor {
        return UIImage(systemName: symbol)!.withTintColor(color)
        
      } else {
        return UIImage(systemName: symbol)!
      }
    }
      
    // if there are no SF Symbols
    // TODO: Add backwards compatibility, or make 'missing image' image
    return UIImage()
  }

  
//  func from_OLD(symbol: String, size: CGSize) -> UIImage {
//    // if we have SF Symbols available
//    if #available(iOS 13.0, *) {
//
//      // if SF Symbols can take multi-colour
//      if #available(iOS 15.0, *) {
//
//        if let foreground = colors?.foreground?.current.uiColor, let secondary = colors?.secondary?.current.uiColor, let tint = colors?.tint?.current.uiColor {
//          let configuration = UIImage.SymbolConfiguration(paletteColors: [foreground, secondary, tint])
//          //  colors?.foreground?.current.uiColor ?? W3WColor.foreground.current.uiColor,
//          //  colors?.secondary?.current.uiColor  ?? W3WColor.foreground.current.uiColor,
//          //  colors?.tint?.current.uiColor       ?? W3WColor.foreground.current.uiColor
//          //])
//          return UIImage(systemName: symbol, withConfiguration: configuration)!.withRenderingMode(.automatic)
//        }
//
//      // if SF Symbols don't have multi-colour
//      } else {
//        let image = UIImage(systemName: symbol)!
//        image.withTintColor(colors?.tint?.current.uiColor ?? .black)
//        return image
//      }
//
//    // if there are no SF Symbols
//    } else {
//      // TODO: Add backwards compatibility
//      return UIImage()
//    }
//
//    return UIImage()
//  }

  //let configuration = UIImage.SymbolConfiguration(pointSize: size.height)
  //return UIImage(systemName: symbol, withConfiguration: configuration)!

  
}




//  static func createImageWithRedCircle(size: CGSize, radius: CGFloat) -> CGImage? {
//    UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
//    guard let context = UIGraphicsGetCurrentContext() else { return nil }
//    let center = CGPoint(x: size.width / 2, y: size.height / 2)
//    context.setFillColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
//    context.fillEllipse(in: CGRect(origin: center, size: CGSize.zero).insetBy(dx: -radius, dy: -radius))
//    let image = UIGraphicsGetImageFromCurrentImageContext()?.cgImage
//    UIGraphicsEndImageContext()
//    return image
//  }



