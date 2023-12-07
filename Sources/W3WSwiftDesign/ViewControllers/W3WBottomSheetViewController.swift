//
//  File.swift
//  
//
//  Created by Dave Duprey on 12/09/2023.
//

import UIKit
import W3WSwiftThemes


open class W3WBottomSheetViewController: W3WViewController, UIGestureRecognizerDelegate {
  
  var touchStartY: CGFloat?
  
  var detents = W3WDetents(detent: W3WRowHeight.extraLarge.value)
  
  open override func viewDidLoad() {
    super.viewDidLoad()
    
    let panGestureRecognizerUp = UIPanGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
    view.addGestureRecognizer(panGestureRecognizerUp)
    panGestureRecognizerUp.delegate = self
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
        w3wView?.set(position: .bottom(height: height))
      }
    }
  }
  
}


