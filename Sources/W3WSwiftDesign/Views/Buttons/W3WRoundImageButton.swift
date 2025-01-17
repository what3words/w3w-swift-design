//
//  File.swift
//
//
//  Created by Dave Duprey on 02/01/2025.
//

import UIKit


public class W3WRoundImageButton: W3WButton {
  
  override public init(image: W3WImage, scheme: W3WScheme? = nil, position: W3WViewPosition? = nil, onTap: @escaping () -> () = { }) {
    super.init(label: "", scheme: scheme, position: position, onTap: onTap)
    set(image: image)
  }
  
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  
  public func set(image: W3WImage) {
    setBackgroundImage(image.get(size: W3WIconSize(value: W3WIconSize.largeIcon.value)), for: .normal)
  }
  
  
}
