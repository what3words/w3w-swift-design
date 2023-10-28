//
//  File.swift
//  
//
//  Created by Dave Duprey on 02/02/2023.
//

import UIKit


public class W3WButton: UIButton, W3WViewProtocol {
  
  public var onTap: () -> () = { }
  
  public var theme: W3WTheme?
  public var position: W3WViewPosition?

  var icon: W3WIconView!
  
  public init(image: W3WImage, theme: W3WTheme? = nil, position: W3WViewPosition? = nil, onTap: @escaping () -> () = { }) {
    super.init(frame: .w3wWhatever)
    //configure(icon: W3WIconView(image: image, theme: theme?.with(icons: theme?[.buttons]?.colorSet)), theme: theme, position: position, onTap: onTap)
    configure(icon: W3WIconView(image: image, theme: theme?.copy(from: .buttons, to: .icons)), theme: theme, position: position, onTap: onTap)
  }
  

  public init(label: String, theme: W3WTheme? = nil, position: W3WViewPosition? = nil, onTap: @escaping () -> () = { }) {
    super.init(frame: .w3wWhatever)
    configure(label: label, theme: theme, position: position, onTap: onTap)
  }
  
  
  public init(icon: W3WIconView, label: String? = nil, theme: W3WTheme? = nil, position: W3WViewPosition? = nil, onTap: @escaping () -> () = { }) {
    super.init(frame: .w3wWhatever)
    configure(icon: icon, label: label, theme: theme, position: position, onTap: onTap)
  }
  
  
  public init(image: W3WImage, label: String, theme: W3WTheme? = nil, position: W3WViewPosition? = nil, onTap: @escaping () -> () = { }) {
    super.init(frame: .w3wWhatever)
    configure(icon: W3WIconView(image: image, theme: theme?.copy(from: .buttons, to: .icons)), label: label, theme: theme, position: position, onTap: onTap)
  }

  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  
  func configure(icon: W3WIconView? = nil, label: String? = nil, theme: W3WTheme? = nil, position: W3WViewPosition? = nil, onTap: @escaping () -> () = { }) {
    set(theme: theme, position: position)

    position?.position(superview, self)

    self.icon = icon
    
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
  
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    updateView()
    icon?.updateView()
  }

  
  public func update(theme: W3WTheme?) {
    apply(theme: theme?.copy(from: .buttons, to: .base))
  }
  
}
