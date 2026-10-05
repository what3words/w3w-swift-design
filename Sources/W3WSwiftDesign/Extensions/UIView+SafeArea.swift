//
//  UIView+SafeArea.swift
//  w3w-swift-design
//
//  Created by Kaley Nguyen on 01/10/2026.
//

#if canImport(UIKit)
import UIKit


@available(iOS 11.0, *)
public extension UIView {

  /// Safe area guide, corner-adaptive (rounded corners, iPhone Duo bar) on iOS 26+
  var w3wSafeAreaGuide: UILayoutGuide {
#if compiler(>=6.2)
    if #available(iOS 26.0, *) {
      return layoutGuide(for: .safeArea(cornerAdaptation: .horizontal))
    }
#endif
    return safeAreaLayoutGuide
  }


  /// Pins this view inside `view`'s safe area
  @discardableResult
  func pinContent(toSafeAreaOf view: UIView, insets: NSDirectionalEdgeInsets = .zero) -> [NSLayoutConstraint] {
    let guide = view.w3wSafeAreaGuide
    translatesAutoresizingMaskIntoConstraints = false
    let constraints = [
      topAnchor.constraint(equalTo: guide.topAnchor, constant: insets.top),
      leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: insets.leading),
      guide.trailingAnchor.constraint(equalTo: trailingAnchor, constant: insets.trailing),
      guide.bottomAnchor.constraint(equalTo: bottomAnchor, constant: insets.bottom)
    ]
    NSLayoutConstraint.activate(constraints)
    return constraints
  }


  /// Pins this view to every edge of `view`, under the bars. For backgrounds only
  @discardableResult
  func pinBackground(toEdgesOf view: UIView) -> [NSLayoutConstraint] {
    translatesAutoresizingMaskIntoConstraints = false
    let constraints = [
      topAnchor.constraint(equalTo: view.topAnchor),
      leadingAnchor.constraint(equalTo: view.leadingAnchor),
      view.trailingAnchor.constraint(equalTo: trailingAnchor),
      view.bottomAnchor.constraint(equalTo: bottomAnchor)
    ]
    NSLayoutConstraint.activate(constraints)
    return constraints
  }
}

#endif
