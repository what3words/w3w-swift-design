//
//  File.swift
//  
//
//  Created by Dave Duprey on 06/09/2022.
//

import UIKit


class W3WDismissButton: W3WButton {
  
  /// need to know the parent in order to do the dismiss
  public weak var parentViewController: UIViewController?

  /// position for the dismiss button
  func getFrame(parent: UIView, this: W3WViewProtocol) -> CGRect {
    let x = (superview?.frame.width ?? 0.0) - W3WIconSize.smallIcon.value.width - W3WPadding.bold.value - (superview?.safeAreaInsets.right ?? 0.0)
    let y = W3WPadding.bold.value - (superview?.safeAreaInsets.top ?? 0.0)
    
    return CGRect(
      x: x,
      y: y,
      width: W3WIconSize.smallIcon.value.width,
      height: W3WIconSize.smallIcon.value.height
    )
  }
  
  
  /// set up the dismiss view
  /// - Parameters:
  ///   - parentViewController: - need to know the parent in order to do the dismiss
  ///   - colors: - the colours to use
  init(parentViewController: W3WViewController, colors: W3WColors = .blackGrayRed) {
    let icon = W3WIconView(drawing: .x, theme: W3WTheme(colors: colors))
    icon.position = W3WViewPosition.top()
    //icon.position = .place(topOf: parentViewController.view)
    //super.init(icon: W3WIconDrawing(drawing: .x, position: .top(of: parentViewController.view)), color: colors, frame: .w3wWhatever)
    //super.init(icon: icon, color: colors, frame: .w3wWhatever)
    super.init(image: .xmark)
    onTap = {
      parentViewController.dismiss(animated: true)
    }
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
}
