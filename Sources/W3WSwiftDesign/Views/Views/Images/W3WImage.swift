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
  
}
