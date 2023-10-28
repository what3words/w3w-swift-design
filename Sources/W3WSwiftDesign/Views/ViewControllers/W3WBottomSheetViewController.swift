//
//  File.swift
//  
//
//  Created by Dave Duprey on 12/09/2023.
//

import UIKit


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



//func parentMotion(enable: Bool) {
//  for recogniser in super.presentationController?.presentedView?.gestureRecognizers ?? [] {
//    recogniser.isEnabled = enable
//  }
//}
//

//
//    let currentHeight = w3wView?.frame.height ?? W3WRowHeight.small.value
//    let verticalDelta = sender.translation(in: view).y
//
//    w3wView?.position = .bottom(height: currentHeight - verticalDelta)
//    w3wView?.position?.position(view.superview, self.w3wView!)


//let currentHeight = w3wView?.frame.height ?? W3WRowHeight.small.value
//
//let currentY = touch.location(in: view.superview).y
//let previousY = touch.previousLocation(in: view.superview).y
//
//let deltaY = currentY - previousY
//
//print(deltaY)

//let panGestureRecognizerUp = UIPanGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
//view.addGestureRecognizer(panGestureRecognizerUp)

//let swipeGestureRecognizerDown = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
//swipeGestureRecognizerDown.direction = .down
//view.addGestureRecognizer(swipeGestureRecognizerDown)

//  override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//    parentMotion(enable: false)
//    if let touch = touches.first {
//      startY = touch.location(in: view.superview).y
//      startHeight = w3wView?.frame.height ?? W3WRowHeight.small.value
//    }
//  }
//
//
//  override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//    //super.touchesMoved(touches, with: event)
//
//    if let touch = touches.first, let s = startY, let h = startHeight {
//      update(height: h, start: s, current: touch.location(in: view.superview).y)
//    }
//  }
//
//
//  override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//    parentMotion(enable: true)
//
//    startY = nil
//    startHeight = nil
//  }
//
//
//  override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//    parentMotion(enable: true)
//
//    startY = nil
//    startHeight = nil
//  }
//
//
//  public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
//    if gestureRecognizer is UIPanGestureRecognizer {
//      return false
//    } else {
//      return false
//    }
//  }
//
//
//  func update(height: CGFloat, start: CGFloat, current: CGFloat) {
//    let newHeight = height + (start - current)
//    print(newHeight, "<-", height, start, current)
//    w3wView?.set(position: .bottom(height: newHeight))
//  }
