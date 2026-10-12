//
//  W3WCloseButton.swift
//
//
//  Created by Thy Nguyen on 25/02/2024.
//

import UIKit

/// In-content circular close button. On iOS 26+ it is the same system glass circle as the nav bar items
/// (`UIGlassEffect`, black/white glyph) whatever init is used; before that it is an X on a thin blur, where the
/// original inits keep their white glyph for camera feeds and the theme/scheme inits take both colours from the design system.
public class W3WCloseButton: W3WButton {
  /// Diameter of the glass circle on iOS 26+, matching the system bar item.
  public static let glassSize: CGFloat = 44
  /// Glyph size inside the glass circle, matching the nav bar items.
  public static let glassGlyphSize: CGFloat = 24

  let size: CGFloat
  let inset: CGFloat
  let roundedCorners: Bool
  /// True when a caller supplied its own scheme colours; otherwise the glass glyph follows the device appearance.
  private var usesExplicitColors = false

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
               scheme: W3WCloseButton.scheme(colors: colors, size: size, inset: inset, roundedCorners: roundedCorners, explicitColors: true),
               onTap: onTouch)
    usesExplicitColors = true
    finishSetup(accessibilityLabel: accessibilityLabel)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Shared pieces

  /// `explicitColors`: a caller-supplied scheme keeps its colours on the glass; the default and theme inits take the bar items' black/white glyph.
  private static func scheme(colors: W3WColors, size: CGFloat, inset: CGFloat, roundedCorners: Bool, explicitColors: Bool = false) -> W3WScheme {
    if #available(iOS 26.0, *) {
      // The glass circle is a subview (see `addGlass`); the scheme only sizes the glyph and colours it like the bar items.
      let glyphInset = max(0, (size - glassGlyphSize) / 2)
      let styles: W3WStyles = .standard.with(padding: W3WPadding(value: glyphInset))
      let glassColors = explicitColors ? colors : W3WColors(foreground: W3WNavigationControl.glyphTint(from: nil))
      return W3WScheme(colors: glassColors, styles: styles)
    }
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
    if #available(iOS 26.0, *) {
      addGlass()
    }
    // `W3WButton` applies the scheme on the next run-loop turn; the glass glyph must be right from the first frame.
    applyGlassGlyphIfNeeded()
  }

  /// On the glass the glyph is a template symbol tinted by the device appearance (like the glass itself), unless a
  /// caller chose its own colours. Re-applied after every scheme update because `W3WButton` bakes the scheme colour in.
  public override func update(scheme: W3WScheme?) {
    super.update(scheme: scheme)
    applyGlassGlyphIfNeeded()
  }

  private func applyGlassGlyphIfNeeded() {
    guard #available(iOS 26.0, *), !usesExplicitColors else { return }
    let tint = W3WNavigationControl.glyphTintColor(from: nil)
    setImage(W3WNavigationControl.close.templateImage, for: .normal)
    tintColor = tint
    imageView?.tintColor = tint
  }

  /// System glass circle behind the glyph, centred, the size of a bar item. A `UIVisualEffectView` subview also keeps
  /// `W3WButton` from adding its own blur.
  @available(iOS 26.0, *)
  private func addGlass() {
    let glass = UIVisualEffectView(effect: UIGlassEffect())
    glass.cornerConfiguration = .capsule()
    glass.isUserInteractionEnabled = false
    glass.translatesAutoresizingMaskIntoConstraints = false
    insertSubview(glass, at: 0)
    NSLayoutConstraint.activate([
      glass.centerXAnchor.constraint(equalTo: centerXAnchor),
      glass.centerYAnchor.constraint(equalTo: centerYAnchor),
      glass.widthAnchor.constraint(equalToConstant: Self.glassSize),
      glass.heightAnchor.constraint(equalToConstant: Self.glassSize)
    ])
  }
}
