//
//  File.swift
//  
//
//  Created by Dave Duprey on 12/09/2023.
//

import UIKit
import W3WSwiftThemes


/// Makes a bottom sheet similar to UISheetPresentationController which we can't use
/// yet due to it only being available in iOS 15.  Once that becomes our minimum we
///  will depricate this
open class W3WBottomSheetViewController: W3WViewController, UIGestureRecognizerDelegate {
  
  var touchStartY: CGFloat?
  
  public var detents: [CGFloat] = [W3WRowHeight.extraLarge.value]
  
  open override func viewDidLoad() {
    super.viewDidLoad()
    
    let panGestureRecognizerUp = UIPanGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
    view.addGestureRecognizer(panGestureRecognizerUp)
    panGestureRecognizerUp.delegate = self
    
    w3wView?.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
  }
  
  // MARK: Swiping
  
  @objc private func didSwipe(_ sender: UIPanGestureRecognizer) {
    var height: CGFloat = 0.0

    if let sv = view.superview {
      
      // remember where we started
      if sender.state == .began {
        touchStartY = sender.location(in: view).y
      }
      
      // if this is the last point, we find the nearest detent and set that height
      if sender.state == .ended {
        let touchEndY = sv.frame.height - sender.location(in: sv).y
        touchStartY = nil
        if let nearest = detents.min(by: { abs($0 - touchEndY) < abs($1 - touchEndY) }) {
          height = nearest
        }
        w3wView?.set(position: .bottom(height: height), animate: .defaultAnimationSpeed)

      // if this is mid gesture, we move the view accordingly
      } else if let ts = touchStartY {
        let point = sender.location(in: sv)
        height = sv.frame.height - point.y + ts
        if let max = detents.max() {
          height = min(height, max)
        }
        w3wView?.set(position: .bottom(height: height))
      }
    }
  }
  
}


