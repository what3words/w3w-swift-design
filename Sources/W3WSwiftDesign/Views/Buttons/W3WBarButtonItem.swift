//
//  W3WBarButtonItem.swift
//  w3w-swift-design
//
//  Created by Au Nguyen on 02/10/2026.
//

import UIKit
import W3WSwiftThemes

/// Close or back bar item without the Liquid Glass tinted circle: `.plain` style, no shared background, theme tint.
public class W3WBarButtonItem: UIBarButtonItem {
  /// Nil for a generic icon item.
  public let control: W3WNavigationControl?
  private let onTap: () -> Void

  /// Tint precedence: `tint`, then the scheme's tint or foreground, then the theme's nav token.
  public static func close(theme: W3WTheme? = nil,
                           scheme: W3WScheme? = nil,
                           tint: W3WColor? = nil,
                           accessibilityLabel: String? = nil,
                           action: @escaping () -> Void) -> W3WBarButtonItem {
    W3WBarButtonItem(control: .close, theme: theme, scheme: scheme, tint: tint, accessibilityLabel: accessibilityLabel, action: action)
  }

  public static func back(theme: W3WTheme? = nil,
                          scheme: W3WScheme? = nil,
                          tint: W3WColor? = nil,
                          accessibilityLabel: String? = nil,
                          action: @escaping () -> Void) -> W3WBarButtonItem {
    W3WBarButtonItem(control: .back, theme: theme, scheme: scheme, tint: tint, accessibilityLabel: accessibilityLabel, action: action)
  }

  public convenience init(control: W3WNavigationControl,
                          theme: W3WTheme? = nil,
                          scheme: W3WScheme? = nil,
                          tint: W3WColor? = nil,
                          accessibilityLabel: String? = nil,
                          action: @escaping () -> Void) {
    self.init(image: control.image.get(),
              control: control,
              theme: theme,
              scheme: scheme,
              tint: tint,
              accessibilityLabel: accessibilityLabel ?? control.defaultAccessibilityLabel,
              accessibilityIdentifier: control.accessibilityIdentifier,
              action: action)
  }

  /// Any icon bar item with the same opt-out: `.plain`, no shared background, theme tint.
  public convenience init(image: UIImage,
                          theme: W3WTheme? = nil,
                          scheme: W3WScheme? = nil,
                          tint: W3WColor? = nil,
                          accessibilityLabel: String? = nil,
                          accessibilityIdentifier: String? = nil,
                          action: @escaping () -> Void) {
    self.init(image: image,
              control: nil,
              theme: theme,
              scheme: scheme,
              tint: tint,
              accessibilityLabel: accessibilityLabel,
              accessibilityIdentifier: accessibilityIdentifier,
              action: action)
  }

  private init(image: UIImage,
               control: W3WNavigationControl?,
               theme: W3WTheme?,
               scheme: W3WScheme?,
               tint: W3WColor?,
               accessibilityLabel: String?,
               accessibilityIdentifier: String?,
               action: @escaping () -> Void) {
    self.control = control
    self.onTap = action
    super.init()
    self.image = image.withRenderingMode(.alwaysTemplate)
    style = .plain
    target = self
    self.action = #selector(tapped)
    tintColor = (tint ?? scheme?.colors?.tint ?? scheme?.colors?.foreground ?? W3WNavigationControl.tint(from: theme))?.uiColor
    self.accessibilityLabel = accessibilityLabel
    self.accessibilityIdentifier = accessibilityIdentifier
    if #available(iOS 26.0, *) {
      hidesSharedBackground = true
    }
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  @objc private func tapped() {
    onTap()
  }
}
