//
//  File.swift
//  
//
//  Created by Dave Duprey on 16/05/2022.
//

import UIKit


public class W3WIconView: UIImageView, W3WViewProtocol {
  
  public var scheme: W3WScheme?
  public var position: W3WViewPosition?

  var underlyingImage: W3WImage
  //var iconColors: W3WColorSet


  // MARK: Init

  
  public init(image: W3WImage, scheme: W3WScheme? = nil) {
    self.underlyingImage = image
    self.underlyingImage.colors = scheme?.colors
    //self.iconColors      = colorSet
    
    super.init(image: self.underlyingImage.get())
    contentMode = .scaleAspectFit
    clipsToBounds = true
    
    set(scheme: scheme, position: nil)
  }
  
  
  public init(drawing: W3WDrawing, scheme: W3WScheme? = nil) {
    self.underlyingImage = W3WImage(drawing: drawing, colors: scheme?.colors ?? .standard)
    //self.iconColors      = colorSet
    
    super.init(image: self.underlyingImage.get())
    contentMode = .scaleAspectFit
    clipsToBounds = true
    
    set(scheme: scheme, position: nil)
  }
  
  
  //public init(systemName: String, colorSet: W3WColorSet = .emptyColorSet, scheme: W3WScheme? = nil) {
  public init(systemName: String, scheme: W3WScheme? = nil) {
    self.underlyingImage = W3WImage(systemName: systemName, colors: scheme?.colors ?? .standard)
    //self.iconColors      = colorSet
    
    super.init(image: self.underlyingImage.get())
    contentMode = .scaleAspectFit
    clipsToBounds = true

    set(scheme: scheme, position: nil)
  }
  
  
  //public init(file: String, colorSet: W3WColorSet = .emptyColorSet, scheme: W3WScheme? = nil) {
  public init(file: String, scheme: W3WScheme? = nil) {
    self.underlyingImage = W3WImage(file: file, colors: scheme?.colors ?? .standard)
    //self.iconColors      = colorSet
    
    super.init(image: self.underlyingImage.get())
    contentMode = .scaleAspectFit
    clipsToBounds = true

    set(scheme: scheme, position: nil)
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
    
    set(scheme: icon.scheme, position: nil)
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


  public func update(scheme: W3WScheme?) {
    apply(scheme: scheme)
  }
  
}
