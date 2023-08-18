//
//  File.swift
//  
//
//  Created by Dave Duprey on 23/03/2023.
//

import UIKit
import W3WSwiftCore


public class W3WDropdownViewsManager {
  weak var dropdownView: W3WViewProtocol?
  weak var dropdownFromView: W3WViewProtocol?
  weak var dropdownSuperView: UIView?
  weak var theme: W3WTheme?
  
  
  init(dropdownFromView: W3WViewProtocol, dropdownSuperView: UIView, theme: W3WTheme? = nil) {
    self.dropdownFromView = dropdownFromView
    self.dropdownSuperView = dropdownSuperView
    self.theme = theme
  }

  
  func isShowing() -> Bool {
    return dropdownView != nil
  }
  
  
  /// show a dropdown view
  /// - parameter dropdownView: the view to show, pass nil to remove any previous views
  func show(dropdownView: W3WViewProtocol? = nil) {
    // if there was already a view, we remove it to make way
    if let ddv = self.dropdownView {
      ddv.removeFromSuperview()
      self.dropdownView = nil
    }

    // if all three views are present, (a nil dropdownView would simply remove the previous view and no tdo this)
    if let ddv = dropdownView, let ddsv = dropdownSuperView {
      self.dropdownView = ddv
      ddv.set(position: dropdownPosition)
      ddsv.addSubview(ddv)
    }
  }
  
  
  func dropdownPosition(parent: UIView?, this: W3WViewProtocol) -> CGRect {
    return CGRect(
      x: (dropdownFromView?.frame.minX ?? 0.0),
      y: (dropdownFromView?.frame.maxY ?? 0.0) + (theme?.style?.padding?.value ?? W3WPadding.fine.value),
      width: dropdownFromView?.frame.width ?? (dropdownFromView?.frame.width ?? 0.0),
      height: this.frame.height
    )
  }
  
  
  func update() {
    dropdownView?.updateView()
  }
  
}


//public protocol W3WDropDownViewProtocol: W3WViewProtocol, W3WViewManagerProtocol {
//  var dropdownManager: W3WDropdownViewsManager { get set }
////  var dropdownView: W3WViewProtocol? { get set }
////  var dropdownFromView: W3WViewProtocol { get }
////  var dropdownSuperView: UIView { get }
//}


//public extension W3WDropDownViewProtocol {
//
//  //  func set(dropdownFromView: W3WViewProtocol) {
//  //    // remember the view and give it a position funtion
//  //    self.dropdownView       = dropdownView
//  //    self.dropdownView?.position = .place(below: dropdownFromView)
//  //  }
//
//
//  func show() {
//    DispatchQueue.main.async { [unowned self] in
//
//      self.dropdownView?.position = .place(below: dropdownFromView)
//
//      // if there was already a view, we remove it to make way
//      if let v = self.dropdownView {
//        v.removeFromSuperview()
//      }
//
//
//      // employ the position function to set it up
//      if let v = self.dropdownView {
//        v.position?.position(self, v)
//        dropdownParentView.addSubview(v)
//      }
//    }
//  }
//
//
//
//
//  // MARK: Layout
//
//
//  //  var dropdownFrame: CGRect {
//  //    get {
//  //      //return CGRect(x: 0.0, y: frame.maxY, width: theme?.style?.padding?.value ?? W3WPadding.fine.value, height: dropdownView?.frame.height ?? W3WRowHeight.medium.value)
//  //      return CGRect(
//  //        x: 0.0,
//  //        y: frame.height + (theme?.style?.padding?.value ?? W3WPadding.fine.value),
//  //        width: frame.width,
//  //        height: dropdownView?.frame.height ?? W3WRowHeight.medium.value)
//  //    }
//  //  }
//
//
//  //  func updateDropDownView() {
//  //    dropdownView?.frame = dropdownFrame //CGRect(x: frame.origin.x, y: frame.maxY, width: frame.width, height: dropdownView?.frame.height ?? W3WRowHeight.medium.value)
//  //  }
//
//
//}


