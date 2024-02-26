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
      backgroundColor = c.current.uiColor
    }

    if let t = colors?.tint {
      tintColor = t.current.uiColor
    }

    if let b = colors?.border {
      layer.borderColor = b.current.cgColor
    }

    if let s = colors?.shadow {
      layer.shadowColor = s.current.cgColor
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
      layer.borderWidth = border
    }

    if let cornerRadius = styles?.cornerRadius?.value {
      layer.cornerRadius = cornerRadius
    }

    if let shadow = styles?.shadow {
      layer.shadowOpacity = Float(shadow.opacity)
      layer.shadowOffset  = CGSize(width: shadow.offset, height: shadow.offset)
      layer.shadowRadius  = shadow.radius
    }
    
    if let visualEffect = styles?.visualEffect {
      addVisualEffect(visualEffect)
    }
  }
  
}

// MARK: - Extension for adding visual effect
public extension UIView {
  /// Add w3w visual effect to current view
  /// - Parameters:
  ///   - w3wVisualEffect: w3w model containing all the styles of the visual effect view to be added to current view
  func addVisualEffect(_ w3wVisualEffect: W3WVisualEffect?) {
    guard let w3wVisualEffect = w3wVisualEffect else {
      return
    }
    if #available(iOS 13.0, *) {
      guard let blurEffectStyle = UIBlurEffect.Style(rawValue: w3wVisualEffect.blurEffectStyle),
            let vibrancyEffectStyle = UIVibrancyEffectStyle(rawValue: w3wVisualEffect.vibrancyEffectStyle) else {
        return
      }
      addVisualEffect(blurEffectStyle: blurEffectStyle,
                      vibrantEffectStyle: vibrancyEffectStyle,
                      inset: w3wVisualEffect.padding.insets,
                      cornerRadius: w3wVisualEffect.cornerRadius.value)
    } else {
      guard let blurEffectStyle = UIBlurEffect.Style(rawValue: w3wVisualEffect.blurEffectStyle) else {
        return
      }
      addVisualEffect(blurEffectStyle: blurEffectStyle,
                      inset: w3wVisualEffect.padding.insets,
                      cornerRadius: w3wVisualEffect.cornerRadius.value)
    }
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
