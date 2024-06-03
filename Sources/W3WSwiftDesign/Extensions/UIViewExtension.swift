//
//  File.swift
//  
//
//  Created by Dave Duprey on 19/08/2023.
//

#if canImport(UIKit)
import UIKit


/// private extension to easily color and style UIViews
/// this is used by a lot of the views to set colours and style
public extension UIView {

  
  /// Apply both colours and style
  /// - Parameters:
  ///   - scheme: a scheme containing colours and style information
  func apply(scheme: W3WScheme?) {
    if let colors = scheme?.colors {
      apply(colors: colors)
    }
    
    if let styles = scheme?.styles {
      apply(styles: styles)
    }
  }
  
  
  /// Apply colours to the view
  /// - Parameters:
  ///   - scheme: a scheme containing colours and style information
  func apply(colors: W3WColors?) {
    if let c = colors?.background {
      if c.current.uiColor != backgroundColor {
        backgroundColor = c.current.uiColor
      }
    }

    if let t = colors?.tint {
      if t.current.uiColor != tintColor {
        tintColor = t.current.uiColor
      }
    }

    if let b = colors?.border {
      if b.current.cgColor != layer.borderColor {
        layer.borderColor = b.current.cgColor
      }
    }

    if let s = colors?.shadow {
      if s.current.cgColor != layer.shadowColor {
        layer.shadowColor = s.current.cgColor
      }
    }
    
    //  special case to get inside a searchcontroller
    if let s = self as? UISearchBar {
      if let background = colors?.background {
        if #available(iOS 13.0, *) {
          s.searchTextField.backgroundColor = background.current.uiColor
        } else {
          s.backgroundColor = background.current.uiColor
        }
      }
    }
  }
  
  
  /// Apply styles to the view
  /// - Parameters:
  ///   - scheme: a scheme containing colours and style information
  func apply(styles: W3WStyles?) {
    if let border = styles?.border?.value {
      if layer.borderWidth != border {
        layer.borderWidth = border
      }
    }

    if let cornerRadius = styles?.cornerRadius?.value {
      if layer.cornerRadius != cornerRadius {
        layer.cornerRadius = cornerRadius
      }
    }

    if let shadow = styles?.shadow {
      if layer.shadowOpacity != Float(shadow.opacity) {
        layer.shadowOpacity = Float(shadow.opacity)
      }
      
      if layer.shadowOffset != CGSize(width: shadow.offset, height: shadow.offset) {
        layer.shadowOffset  = CGSize(width: shadow.offset, height: shadow.offset)
      }
      
      if layer.shadowRadius != shadow.radius {
        layer.shadowRadius = shadow.radius
      }
    }
    
    if let visualEffect = styles?.visualEffect {
      if !visualEffectActive() {
        add(visualEffect: visualEffect)
      }
    }
  }
  

  func effectToBlur(effect: W3WVisualEffectBlur) -> UIBlurEffect.Style {
    switch effect {
      case .regular:
        return .regular
      case .thick:
        return .dark
      case .thin:
        return .light
      case .ultraThick:
        return .dark
      case .ultraThin:
        return .extraLight
    }
  }
  
  
  @available(iOS 13, *)
  func effectToVibrancy(effect: W3WVisualEffectFill) -> UIVibrancyEffectStyle {
    switch effect {
      case .label:
        return .label
      case .secondaryLabel:
        return .secondaryLabel
      case .tertiaryLabel:
        return .tertiaryLabel
      case .quaternaryLabel:
        return .quaternaryLabel
      case .fill:
        return .fill
      case .secondaryFill:
        return .secondaryFill
      case .tertiaryFill:
        return .tertiaryFill
      case .separator:
        return .separator
    }
  }
  
  
  /// determines if there is a UIVisualEffectView applied to the view
  func visualEffectActive() -> Bool {
    if let _ = subviews.first(where: { $0 is UIVisualEffectView}) {
      return true
    } else {
      return false
    }
  }
  
  
  /// Add w3w visual effect to current view
  /// - Parameters:
  ///   - w3wVisualEffect: w3w model containing all the styles of the visual effect view to be added to current view
  func add(visualEffect: W3WVisualEffect) {
    
    if #available(iOS 13.0, *) {
      addVisualEffectIos13Up(visualEffect: visualEffect)
    } else {
      addVisualEffectIos12Down(visualEffect: visualEffect)
    }
  }

  
  @available(iOS 13, *)
  func addVisualEffectIos13Up(visualEffect: W3WVisualEffect) {
    let blurEffectStyle     = effectToBlur(effect: visualEffect.style)
    let vibrancyEffectStyle = effectToVibrancy(effect: visualEffect.fill)

    addVisualEffect(
      blurEffectStyle: blurEffectStyle,
      vibrantEffectStyle: vibrancyEffectStyle,
      inset: visualEffect.padding.insets,
      cornerRadius: visualEffect.cornerRadius.value
    )
  }
  
  
  func addVisualEffectIos12Down(visualEffect: W3WVisualEffect) {
    let blurEffectStyle = effectToBlur(effect: visualEffect.style)
    addVisualEffect(
      blurEffectStyle: blurEffectStyle,
      inset: visualEffect.padding.insets,
      cornerRadius: visualEffect.cornerRadius.value
    )
  }
  
  
  /// Add visual effect to current view
  /// - Parameters:
  ///   - blurEffectStyle: style of the blur effect to be added to current view
  ///   - inset: the space around the visual effect view within current view, default is zero
  ///   - cornerRadius: the corner radius of the visual effect view, default is 0.0
  func addVisualEffect(blurEffectStyle: UIBlurEffect.Style,
                       inset: UIEdgeInsets = .zero,
                       cornerRadius: CGFloat = 0.0) {
    let blurEffect = UIBlurEffect(style: blurEffectStyle)
    let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
    addVisualEffect(blurEffect: blurEffect, vibrantEffect: vibrancyEffect, inset: inset, cornerRadius: cornerRadius)
  }
  
  /// Add visual effect to current view
  /// - Parameters:
  ///   - blurEffectStyle: style of the blur effect to be added to current view
  ///   - vibrantEffectStyle: style of the vibrant effect to be added to current view
  ///   - inset: the space around the visual effect view within current view, default is zero
  ///   - cornerRadius: the corner radius of the visual effect view, default is 0.0
  @available(iOS 13.0, *)
  func addVisualEffect(blurEffectStyle: UIBlurEffect.Style,
                       vibrantEffectStyle: UIVibrancyEffectStyle,
                       inset: UIEdgeInsets = .zero,
                       cornerRadius: CGFloat = 0.0) {
    let blurEffect = UIBlurEffect(style: blurEffectStyle)
    let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect, style: vibrantEffectStyle)
    addVisualEffect(blurEffect: blurEffect, vibrantEffect: vibrancyEffect, inset: inset, cornerRadius: cornerRadius)
  }
  
  /// Add visual effect to current view
  /// - Parameters:
  ///   - blurEffect: the blur effect should be added to current view
  ///   - vibrantEffect: the vibrant effect should be added to current view
  ///   - inset: the space around the visual effect view within current view, default is zero
  ///   - cornerRadius: the corner radius of the visual effect view, default is 0.0
  func addVisualEffect(blurEffect: UIBlurEffect,
                       vibrantEffect: UIVibrancyEffect?,
                       inset: UIEdgeInsets = .zero,
                       cornerRadius: CGFloat = 0.0) {
    // Remove old blur view
    if let view = subviews.first(where: { $0 is UIVisualEffectView}) {
      view.removeFromSuperview()
    }
    
    // Create new blur view
    let blurEffectView = UIVisualEffectView(effect: blurEffect)
    blurEffectView.translatesAutoresizingMaskIntoConstraints = false
    blurEffectView.isUserInteractionEnabled = false
    blurEffectView.layer.cornerRadius = cornerRadius
    blurEffectView.clipsToBounds = true
    
    // Create a vibrant effect view and add to the blur view
    if let vibrantEffect = vibrantEffect {
      let vibrancyEffectView = UIVisualEffectView(effect: vibrantEffect)
      vibrancyEffectView.translatesAutoresizingMaskIntoConstraints = false
      vibrancyEffectView.clipsToBounds = true
      blurEffectView.contentView.addSubview(vibrancyEffectView)
      NSLayoutConstraint.activate([
        vibrancyEffectView.topAnchor.constraint(equalTo: blurEffectView.contentView.topAnchor),
        vibrancyEffectView.bottomAnchor.constraint(equalTo: blurEffectView.contentView.bottomAnchor),
        vibrancyEffectView.leadingAnchor.constraint(equalTo: blurEffectView.contentView.leadingAnchor),
        vibrancyEffectView.trailingAnchor.constraint(equalTo: blurEffectView.contentView.trailingAnchor),
      ])
    }
    
    // Add the blur view to current view
    insertSubview(blurEffectView, at: 0)
    NSLayoutConstraint.activate([
      blurEffectView.topAnchor.constraint(equalTo: topAnchor, constant: inset.top),
      blurEffectView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset.bottom),
      blurEffectView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset.left),
      blurEffectView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset.right),
    ])
  }
}

#endif
