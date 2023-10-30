//
//  File.swift
//  
//
//  Created by Dave Duprey on 19/05/2022.
//

import Foundation
import UIKit



/// A little dash ---- at the top of a view to indicate to the user
/// that it can be pulled down to be dismissed
public class W3WHandleIndicator: W3WView {

  
  public override init(scheme: W3WScheme? = nil) {
    super.init(scheme: scheme)
    configure()
  }


  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    configure()
  }
  

  func configure() {
    layer.cornerRadius = W3WPadding.thin.value / CGFloat(2.0)
    self.frame = getFrame(parent: superview, this: self)
    set(position: getFrame)
  }

  
  public func getFrame(parent: UIView?, this: W3WViewProtocol) -> CGRect {
    let indicatorSize = CGSize(width: W3WIconSize.handleIcon.value.width, height: W3WIconSize.handleIcon.value.height)
    var indicatorX = W3WPadding.heavy.value
    backgroundColor = W3WColor.tertiaryLabel.current.uiColor
    
    if let parentView = parent {
      indicatorX = (parentView.frame.width - indicatorSize.width) / CGFloat(2)
    }
    
    return CGRect(origin: CGPoint(x: indicatorX, y: W3WPadding.light.value), size: indicatorSize)
  }
  
  
  
//  public override func layoutSubviews() {
//    position()
//  }
  
  
}
