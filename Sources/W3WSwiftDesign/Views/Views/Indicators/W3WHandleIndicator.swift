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
  
//  public override init(frame: CGRect) {
//    super.init(frame: frame)
//    position()
//  }
//
//
//  public required init?(coder: NSCoder) {
//    super.init(coder: coder)
//    position()
//  }
  
  
  public func getFrame(parent: UIView?, this: W3WViewProtocol) -> CGRect {
    let indicatorSize = CGSize(width: W3WIconSize.handleIcon.value.width, height: W3WIconSize.handleIcon.value.height)
    var indicatorX = W3WPadding.heavy.value
    backgroundColor = W3WColor.tertiaryLabel.current.uiColor
    
    if let parentView = superview {
      indicatorX = (parentView.frame.width - indicatorSize.width) / CGFloat(2)
    }
    
    return CGRect(origin: CGPoint(x: indicatorX, y: W3WPadding.bold.value), size: indicatorSize)
  }
  
  public func position() {
    self.frame = getFrame(parent: superview, this: self)
  }
  
  
  public override func layoutSubviews() {
    layer.cornerRadius = W3WPadding.thin.value / CGFloat(2.0)
    position()
  }
  
  
}
