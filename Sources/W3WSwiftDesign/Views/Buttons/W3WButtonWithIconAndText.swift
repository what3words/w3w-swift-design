//
//  W3WButtonWithIconAndText.swift
//  
//
//  Created by Thy Nguyen on 03/04/2024.
//

import UIKit
import W3WSwiftCore

public final class W3WButtonWithIconAndText: W3WButton {
  /// Custom height for button, if it's not specified then button height will be dependent on its intrinsic size
  private let height: CGFloat?
  
  /// Custom image size based on button custom height and scheme's padding
  private var imageSize: CGSize?
  
  public init(image: W3WImage, 
              label: String,
              height: CGFloat? = nil,
              fontStyle: W3WFontStyle? = nil,
              spacing: CGFloat? = nil,
              scheme: W3WScheme? = nil,
              onTap: @escaping () -> Void = {}) {
    self.height = height
    super.init(image: image, label: label, fontStyle: fontStyle, spacing: spacing, scheme: scheme, onTap: onTap)
    self.spacing = spacing
    configure()
  }
  
  public init(icon: W3WIconView,
              label: String,
              height: CGFloat? = nil,
              fontStyle: W3WFontStyle? = nil,
              spacing: CGFloat? = nil,
              scheme: W3WScheme? = nil,
              onTap: @escaping () -> () = { }) {
    self.height = height
    super.init(icon: icon, label: label, fontStyle: fontStyle, spacing: spacing, scheme: scheme, onTap: onTap)
    self.spacing = spacing
    configure()
  }
  
  private func configure() {
    translatesAutoresizingMaskIntoConstraints = false
    imageView?.contentMode = .scaleAspectFit
    if let height = height {
      imageSize = .init(width: height, height: height)
      NSLayoutConstraint.activate([
        heightAnchor.constraint(equalToConstant: height),
      ])
    } else {
      imageSize = icon?.underlyingImage.get().size
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public override func set(scheme: W3WScheme?) {
    self.scheme = scheme
    if let height = height, let insets = scheme?.styles?.padding {
      let size = height - insets.value * 2.0
      imageSize = .init(width: size, height: size)
    }
    update(scheme: scheme)
    icon?.set(scheme: scheme)
    if let i = icon {
      if let imageSize = imageSize {
        setImage(i.asImage(size: .init(value: imageSize)), for: .normal)
      } else {
        setImage(i.asImage(), for: .normal)
      }
    }
  }
}
