//
//  File.swift
//  
//
//  Created by Dave Duprey on 02/01/2025.
//

import UIKit


public class W3WRoundIconButton: W3WButton {
  
  
  override public init(image: W3WImage, scheme: W3WScheme? = nil, position: W3WViewPosition? = nil, onTap: @escaping () -> () = { }) {
    super.init(image: image, scheme: scheme?.with(cornerRadius: .circle), position: position, onTap: onTap)
    set(image: image)
  }
  

  /// obligatory init
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  
  public func set(image: W3WImage) {
    DispatchQueue.main.async { [unowned self] in
      var icon: UIImage
      
      if #available(iOS 15.0, *) {
        let configuration = UIImage.SymbolConfiguration(pointSize: frame.height * 0.5, weight: .light, scale: .small)
        icon = image.get().withConfiguration(configuration)
      } else {
        icon = image.get(size: W3WIconSize(value: CGSize(width: frame.height, height: frame.height * 0.5)))
      }
      
      setImage(icon, for: .normal)
    }
  }
  
  
}
