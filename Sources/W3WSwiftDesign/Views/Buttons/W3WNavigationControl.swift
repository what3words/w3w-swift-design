//
//  W3WNavigationControl.swift
//  w3w-swift-design
//
//  Created by Au Nguyen on 02/10/2026.
//

import UIKit
import W3WSwiftThemes

/// One definition of the close and back controls so every bar item and close button shares the glyph, identifier and tint.
public enum W3WNavigationControl {
  case close
  case back

  /// Glyph for the control; the back chevron follows the layout direction because SF chevrons do not mirror on their own.
  public var image: W3WImage {
    switch self {
    case .close: return .xmark
    case .back: return W3WNavigationControl.isRightToLeft ? .chevronRight : .chevronLeft
    }
  }

  public var accessibilityIdentifier: String {
    switch self {
    case .close: return "navigation_bar_close"
    case .back: return "navigation_bar_back"
    }
  }

  /// English fallback only; callers pass a translated label.
  public var defaultAccessibilityLabel: String {
    switch self {
    case .close: return "Close"
    case .back: return "Back"
    }
  }

  /// Tint for nav bar close/back buttons: the theme's dark-blue label colour (navy in light mode, near-white in dark).
  public static func tint(from theme: W3WTheme?) -> W3WColor? {
    (theme ?? .what3words).labelsTertiary
  }

  public static var isRightToLeft: Bool {
    UIView.userInterfaceLayoutDirection(for: UIView.appearance().semanticContentAttribute) == .rightToLeft
  }
}
