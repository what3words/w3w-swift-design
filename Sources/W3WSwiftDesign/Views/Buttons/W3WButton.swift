//
//  File.swift
//  
//
//  Created by Dave Duprey on 02/02/2023.
//

import UIKit


public class W3WButton: UIButton, W3WViewProtocol {
  
  public var onTap: () -> () = { }
  
  public var design: W3WDesign?
  public var position: W3WViewPosition?

  var icon: W3WIcon!
  
  public init(icon: W3WIcon, design: W3WDesign? = nil, position: W3WViewPosition? = nil, onTap: @escaping () -> () = { }) {
    super.init(frame: .w3wWhatever)
    configure(icon: icon, design: design, position: position, onTap: onTap)
  }
  
  
  public init(label: String, design: W3WDesign? = nil, position: W3WViewPosition? = nil, onTap: @escaping () -> () = { }) {
    super.init(frame: .w3wWhatever)
    configure(label: label, design: design, position: position, onTap: onTap)
  }
  
  
  public init(icon: W3WIcon, label: String, design: W3WDesign? = nil, position: W3WViewPosition? = nil, onTap: @escaping () -> () = { }) {
    super.init(frame: .w3wWhatever)
    configure(icon: icon, label: label, design: design, position: position, onTap: onTap)
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  
  func configure(icon: W3WIcon? = nil, label: String? = nil, design: W3WDesign? = nil, position: W3WViewPosition? = nil, onTap: @escaping () -> () = { }) {
    set(design: design, position: position)

    //frame = position?.position(superview, self) ?? CGRect(origin: .zero, size: W3WIconSize.smallIcon.value)
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
  }

}
