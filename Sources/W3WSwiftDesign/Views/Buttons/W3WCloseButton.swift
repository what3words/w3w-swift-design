//
//  W3WCloseButton.swift
//
//
//  Created by Thy Nguyen on 25/02/2024.
//

import UIKit

/// In-content circular close button: an X on a thin blur. The original inits keep their white glyph for
/// camera feeds; the theme and scheme inits take both colours from the design system.
public class W3WCloseButton: W3WButton {
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
    super.init(image: W3WNavigationControl.close.image,
               scheme: W3WCloseButton.scheme(colors: W3WColors(foreground: .white), size: size, inset: inset, roundedCorners: roundedCorners),
               onTap: onTouch)
    finishSetup(accessibilityLabel: nil)
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
    super.init(image: W3WCloseButton.glyph(imageConfiguration),
               scheme: W3WCloseButton.scheme(colors: W3WColors(foreground: .white), size: size, inset: inset, roundedCorners: roundedCorners),
               onTap: onTouch)
    finishSetup(accessibilityLabel: nil)
  }

  /// Colours come from the theme: the glyph uses `labelsPrimary`, the backing uses `fillsSenary`; the blur stays.
  @available(iOS 13.0, *)
  public init(
    theme: W3WTheme,
    size: CGFloat = 60.0,
    inset: CGFloat = 16.0,
    roundedCorners: Bool = true,
    imageConfiguration: UIImage.Configuration? = nil,
    accessibilityLabel: String? = nil,
    onTouch: @escaping (() -> Void) = {}
  ) {
    self.size = size
    self.inset = inset
    self.roundedCorners = roundedCorners
    super.init(image: W3WCloseButton.glyph(imageConfiguration),
               scheme: W3WCloseButton.scheme(colors: W3WColors(foreground: theme.labelsPrimary, background: theme.fillsSenary),
                                             size: size, inset: inset, roundedCorners: roundedCorners),
               onTap: onTouch)
    finishSetup(accessibilityLabel: accessibilityLabel)
  }

  /// Colours come from the scheme: `tint` (or `foreground`) for the glyph, `background` for the backing.
  @available(iOS 13.0, *)
  public init(
    scheme: W3WScheme,
    size: CGFloat = 60.0,
    inset: CGFloat = 16.0,
    roundedCorners: Bool = true,
    imageConfiguration: UIImage.Configuration? = nil,
    accessibilityLabel: String? = nil,
    onTouch: @escaping (() -> Void) = {}
  ) {
    self.size = size
    self.inset = inset
    self.roundedCorners = roundedCorners
    let colors = W3WColors(foreground: scheme.colors?.tint ?? scheme.colors?.foreground, background: scheme.colors?.background)
    super.init(image: W3WCloseButton.glyph(imageConfiguration),
               scheme: W3WCloseButton.scheme(colors: colors, size: size, inset: inset, roundedCorners: roundedCorners),
               onTap: onTouch)
    finishSetup(accessibilityLabel: accessibilityLabel)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Shared pieces

  private static func scheme(colors: W3WColors, size: CGFloat, inset: CGFloat, roundedCorners: Bool) -> W3WScheme {
    let styles: W3WStyles = .standard
      .with(visualEffect: W3WVisualEffect(style: .thin,
                                          fill: .tertiaryFill,
                                          padding: W3WPadding(value: inset),
                                          cornerRadius: roundedCorners ? W3WCornerRadius(value: (size - inset * 2.0) / 2.0) : 0.0))
      .with(padding: W3WPadding(value: inset + 7.0))
    return W3WScheme(colors: colors, styles: styles)
  }

  @available(iOS 13.0, *)
  private static func glyph(_ configuration: UIImage.Configuration?) -> W3WImage {
    let image = W3WNavigationControl.close.image
    if let configuration {
      image.setImageConfiguration(configuration)
    }
    return image
  }

  private func finishSetup(accessibilityLabel: String?) {
    translatesAutoresizingMaskIntoConstraints = false
    imageView?.contentMode = .scaleAspectFit
    self.accessibilityLabel = accessibilityLabel ?? W3WNavigationControl.close.defaultAccessibilityLabel
    accessibilityIdentifier = W3WNavigationControl.close.accessibilityIdentifier
  }
}
