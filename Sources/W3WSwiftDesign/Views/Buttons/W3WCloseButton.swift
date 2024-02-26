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
  
  public init(size: CGFloat = 60.0,
              inset: CGFloat = 16.0,
              withCornerRadius: Bool = true,
              onTouch: (() -> Void)?) {
    self.size = size
    self.inset = inset
    self.onTouch = onTouch
    let colors = W3WColors(foreground: .clear, tint: .white)
    let visualEffect: W3WVisualEffect
    if #available(iOS 13.0, *) {
      visualEffect = W3WVisualEffect(blurEffectStyle: UIBlurEffect.Style.light.rawValue,
                                     vibrancyEffectStyle: UIVibrancyEffectStyle.tertiaryFill.rawValue,
                                     padding: W3WPadding(value: inset),
                                     cornerRadius: withCornerRadius ? W3WCornerRadius(value: (size - inset * 2.0) / 2.0) : 0.0)
    } else {
      visualEffect = W3WVisualEffect(blurEffectStyle: UIBlurEffect.Style.light.rawValue,
                                     padding: W3WPadding(value: inset),
                                     cornerRadius: withCornerRadius ? W3WCornerRadius(value: (size - inset * 2.0) / 2.0) : 0.0)
    }
    let styles: W3WStyles = .standard
      .with(visualEffect: visualEffect)
      .with(padding: W3WPadding(value: inset + 8.0))
    let scheme = W3WScheme(colors: colors, styles: styles)
    super.init(image: W3WImage(systemName: "xmark", colors: colors), scheme: scheme)
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
