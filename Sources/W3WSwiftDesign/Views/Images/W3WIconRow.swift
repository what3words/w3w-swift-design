//
//  File.swift
//  
//
//  Created by Dave Duprey on 16/05/2022.
//

import UIKit


/// A collection of icons for use on the side of in a TextField or other
//public class W3WIconRow: W3WManagerView {
//  
//  var stack = W3WStackView()
//  
//  /// the array of icons in the view
//  //public var icons = [UIView]()
//  
//  /// size of the icons
//  //var iconSize: CGFloat { get { return self.frame.height - padding.value * 2.0 } }
//  
//  /// spacing
//  //var spacing: W3WPadding { get { return design?.style?.padding ?? 0.0 } }
//
//  /// padding
//  //var padding: W3WPadding { get { return design?.style?.padding ?? 0.0 } }
//  
//  
//  public override init(design: W3WDesign? = nil) {
//    super.init(design: design)
//    
//    add(view: stack, position: .inset(by: 2.0))
//  }
//  
//  
//  public required init?(coder: NSCoder) {
//    super.init(coder: coder)
//  }
//  
//
//  // MARK: Accessors
//  
//  public func contains(icon: UIView) -> Bool {
//    return stack.arrangedSubviews.contains(icon)
//  }
//  
//  
//  /// add a view to the row
//  public func add(icon: W3WViewProtocol) {
//    icon.set(width: 24.0, height: 24.0)
//    stack.add(view: icon, animated: true)
//    //icon.frame = CGRect(origin: CGPoint(x: frame.maxX, y: padding.value), size: CGSize(width: iconSize, height: iconSize))
//    //icons.append(icon)
//    //insert(view: icon)
//  }
//  
//  
//  /// add a view to the left of the row
//  public func add(left: W3WViewProtocol) {
//    left.set(width: 24.0, height: 24.0)
//    stack.add(view: left, animated: true)
//    //left.frame = CGRect(origin: CGPoint(x: -iconSize, y: padding.value), size: CGSize(width: iconSize, height: iconSize))
//    //icons.append(left)
//    //insert(view: left)
//  }
//  
//  
//  /// add a view to the right of the row
//  public func add(right: W3WViewProtocol) {
//    right.set(width: 24.0, height: 24.0)
//    stack.add(view: right, animated: true)
////    right.frame = CGRect(origin: CGPoint(x: frame.maxX, y: padding.value), size: CGSize(width: iconSize, height: iconSize))
////    icons.insert(right, at: 0)
////    insert(view: right)
//  }
//  
//  
////  func insert(view: UIView) {
////    addSubview(view)
////    resize()
////  }
//  
//  
//  public func hide(view: UIView, completion: @escaping () -> () = { }) {
//    UIView.animate(withDuration: 0.2) {
//      view.isHidden = true
//    }
////    view.alpha = 0.0
////    view.isHidden = true
////    positionIcons()
////    completion()
//  }
//  
//  
//  public func hideAll(except: UIView? = nil) {
//    for icon in stack.arrangedSubviews {
//      UIView.animate(withDuration: 0.2) {
//        icon.isHidden = true
//      }
//    }
////    for icon in icons {
////      if icon != except {
////        hide(view: icon)
////      } else {
////        show(view: icon)
////      }
////    }
//  }
//  
//  
//  public func show(view: UIView, completion: @escaping () -> () = { }) {
//    
////      view.alpha = 1.0
////      view.isHidden = false
////      positionIcons()
////      completion()
//  }
//  
//  
//  public func showAll(except: UIView? = nil) {
//    UIView.animate(withDuration: 0.2) { [unowned self] in
//      for icon in stack.arrangedSubviews {
//        if icon != except {
//          show(view: icon)
//        } else {
//          hide(view: icon)
//        }
//      }
//    }
//  }
//
//  
//
//  // MARK: Layout
//  
//  
////  func resize() {
////    self.positionIcons()
////  }
//  
//  
//  public func getWidth() -> CGFloat {
//    return frame.width
////    var x = spacing.value * 3.0
////
////    for icon in icons {
////      if !icon.isHidden {
////        x += iconSize + spacing.value
////      }
////    }
////
////    return x
//  }
//  
//  
////  public override func layoutSubviews() {
////    super.layoutSubviews()
////    self.positionIcons()
////  }
//  
//  
////  func positionIcons() {
////    clipsToBounds = true
////
////    var x = 0.0
////    for icon in self.icons {
////      if !icon.isHidden {
////        icon.frame = CGRect(x: x + self.padding.value, y: self.padding.value, width: self.iconSize, height: self.iconSize)
////        x += self.iconSize + self.spacing.value
////      }
////    }
////  }
//  
//}
