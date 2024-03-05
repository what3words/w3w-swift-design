//
//  W3WCloseButton.swift
//
//
//  Created by Thy Nguyen on 25/02/2024.
//

import UIKit

public class W3WCloseButton: W3WButton {
  public var onTouch: (() -> Void)?
  
  let size: CGFloat
  let inset: CGFloat
  let roundedCorners: Bool
  
  public init(
    size: CGFloat = 60.0,
    inset: CGFloat = 16.0,
    roundedCorners: Bool = true,
    onTouch: @escaping (() -> Void) = {}
  ) {
    self.size = size
    self.inset = inset
    self.roundedCorners = roundedCorners
    self.onTouch = onTouch
    
    let colors = W3WColors(foreground: .clear, tint: .white)
    
    let styles: W3WStyles = .standard
      .with(visualEffect: W3WVisualEffect(style: .thin,
                                          fill: .fill,
                                          padding: W3WPadding(value: inset),
                                          cornerRadius: roundedCorners ? W3WCornerRadius(value: (size - inset * 2.0) / 2.0) : 0.0))
      .with(padding: W3WPadding(value: inset + 8.0))

    let scheme = W3WScheme(colors: colors, styles: styles)

    super.init(image: .xmark, scheme: scheme)
    
    addTarget(self, action: #selector(didTouch), for: .touchUpInside)
    translatesAutoresizingMaskIntoConstraints = false
  }
  
  @available(iOS 13.0, *)
  public init(
    size: CGFloat = 60.0,
    inset: CGFloat = 16.0,
    roundedCorners: Bool = true,
    imageConfiguration: UIImage.Configuration? = nil,
    onTouch: @escaping (() -> Void) = {}
  ) {
    self.size = size
    self.inset = inset
    self.roundedCorners = roundedCorners
    self.onTouch = onTouch
    
    let colors = W3WColors(foreground: .clear, tint: .white)
    
    let styles: W3WStyles = .standard
      .with(visualEffect: W3WVisualEffect(style: .thin,
                                          fill: .fill,
                                          padding: W3WPadding(value: inset),
                                          cornerRadius: roundedCorners ? W3WCornerRadius(value: (size - inset * 2.0) / 2.0) : 0.0))
      .with(padding: W3WPadding(value: inset + 8.0))
    
    let scheme = W3WScheme(colors: colors, styles: styles)
    
    let w3wImage: W3WImage = .xmark
    if let imageConfiguration = imageConfiguration {
      w3wImage.setImageConfiguration(imageConfiguration)
    }

    super.init(image: w3wImage, scheme: scheme)
    
    addTarget(self, action: #selector(didTouch), for: .touchUpInside)
    translatesAutoresizingMaskIntoConstraints = false
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc open func didTouch() {
    onTouch?()
  }
}
