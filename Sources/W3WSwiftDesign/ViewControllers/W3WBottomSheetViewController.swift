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
  
  var detents = W3WDetents(detent: W3WRowHeight.extraLarge.value)
  
  open override func viewDidLoad() {
    super.viewDidLoad()
    
    let panGestureRecognizerUp = UIPanGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
    view.addGestureRecognizer(panGestureRecognizerUp)
    panGestureRecognizerUp.delegate = self
    
    w3wView?.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
  }
  
  
  // MARK: Accessors
  
  
  /// add a place (y coord) that the sheet will snap to
  public func add(detent: CGFloat) {
    detents.add(detent: detent)
  }
  
  
  /// add places (y coord) that the sheet will snap to
  public func add(detents arr: [CGFloat]) {
    detents.add(detents: arr)
  }
  
  
  /// remove a place (y coord) that the sheet will snap to, if no such place, this does nothing
  public func remove(detent: CGFloat) {
    detents.remove(detent: detent)
  }
  
  
  /// remove a place (y coord) that the sheet will snap to, if no such place, this does nothing
  public func removeDetents() {
    detents.removeDetents()
  }

  /// returns the detents in use
  public func getDetents() -> [CGFloat] {
    return detents.detents
  }
  
  // MARK: Swiping
  

  @objc private func didSwipe(_ sender: UIPanGestureRecognizer) {
    var height = 0.0

    if let sv = view.superview {
      
      // remember where we started
      if sender.state == .began {
        touchStartY = sender.location(in: view).y
      }
      
      // if this is the last point, we find the nearest detent and set that height
      if sender.state == .ended {
        let touchEndY = sv.frame.height - sender.location(in: sv).y
        touchStartY = nil
        height = detents.nearest(value: touchEndY)
        w3wView?.set(position: .bottom(height: height), animate: .defaultAnimationSpeed)

      // if this is mid gesture, we move the view accordingly
      } else if let ts = touchStartY {
        let point = sender.location(in: sv)
        height = sv.frame.height - point.y + ts
        if let max = detents.detents.max() {
          height = min(height, max)
        }
        w3wView?.set(position: .bottom(height: height))
      }
    }
  }
  
}


