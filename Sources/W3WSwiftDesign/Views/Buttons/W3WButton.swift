//
//  File.swift
//  
//
//  Created by Dave Duprey on 02/02/2023.
//

import UIKit
import W3WSwiftThemes


public class W3WButton: UIButton, W3WViewProtocol {
  
  public var onTap: () -> () = { }
  
  public var scheme: W3WScheme?
  public var position: W3WViewPosition?

  var icon: W3WIconView!
  
  public init(image: W3WImage, scheme: W3WScheme? = nil, position: W3WViewPosition? = nil, onTap: @escaping () -> () = { }) {
    super.init(frame: .w3wWhatever)
    configure(icon: W3WIconView(image: image, scheme: scheme), scheme: scheme, position: position, onTap: onTap)
  }
  

  public init(label: String, scheme: W3WScheme? = nil, position: W3WViewPosition? = nil, onTap: @escaping () -> () = { }) {
    super.init(frame: .w3wWhatever)
    configure(label: label, scheme: scheme, position: position, onTap: onTap)
  }
  
  
  public init(icon: W3WIconView, label: String? = nil, scheme: W3WScheme? = nil, position: W3WViewPosition? = nil, onTap: @escaping () -> () = { }) {
    super.init(frame: .w3wWhatever)
    configure(icon: icon, label: label, scheme: scheme, position: position, onTap: onTap)
  }
  
  
  public init(image: W3WImage, label: String, scheme: W3WScheme? = nil, position: W3WViewPosition? = nil, onTap: @escaping () -> () = { }) {
    super.init(frame: .w3wWhatever)
    configure(icon: W3WIconView(image: image, scheme: scheme), label: label, scheme: scheme, position: position, onTap: onTap)
  }

  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  
  func configure(icon: W3WIconView? = nil, label: String? = nil, scheme: W3WScheme? = nil, position: W3WViewPosition? = nil, onTap: @escaping () -> () = { }) {
    set(scheme: scheme, position: position)

    position?.position(superview, self)

    self.icon = icon
    self.icon.set(scheme: scheme)
    
    if let l = label {
      setTitle(l, for: .normal)
    }

    if let i = icon {
      setImage(i.asImage(size: CGSize(width: frame.height, height: frame.height)), for: .normal)
    }
    
    self.onTap = onTap
    self.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
    
    updateView()
  }
  
  
  @objc fileprivate func touchUpInside() {
    self.onTap()
  }
  
  
  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    updateView()
    icon?.updateView()
  }
  
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    updateView()
    icon?.updateView()
  }

  
  public func update(scheme: W3WScheme?) {
    apply(scheme: scheme)

    let fallbackColor = scheme?.colors?.foreground?.current.uiColor

    setTitleColor(scheme?.colors?.foreground?.current.uiColor ?? fallbackColor, for: .normal)
    setTitleColor(scheme?.colors?.highlight?.foreground?.current.uiColor ?? fallbackColor, for: .highlighted)
    setTitleColor(scheme?.colors?.secondary?.current.uiColor ?? fallbackColor, for: .disabled)
    setTitleColor(scheme?.colors?.foreground?.current.uiColor ?? fallbackColor, for: .focused)
    setTitleColor(scheme?.colors?.secondary?.current.uiColor ?? fallbackColor, for: .selected)
    
    imageView?.tintColor = scheme?.colors?.tint?.current.uiColor
    if let insets = scheme?.styles?.padding?.insets {
      contentEdgeInsets = insets
    }
    addVisualEffect(scheme?.styles?.visualEffect)
  }
  
}
