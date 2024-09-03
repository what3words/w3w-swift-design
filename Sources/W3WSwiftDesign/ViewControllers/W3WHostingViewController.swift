//
//  File.swift
//  
//
//  Created by Dave Duprey on 22/07/2024.
//

import SwiftUI
import W3WSwiftCore


/// W3WViewController to show a SwiftUI view
@available(iOS 13.0, *)
open class W3WHostingViewController<T: View>: UIHostingController<T> {

  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  public override init?(coder aDecoder: NSCoder, rootView: T) {
    super.init(coder: aDecoder, rootView: rootView)
  }

  public override init(rootView: T) {
    super.init(rootView: rootView)
  }

// CANT use `subscribe(to: scheme)` without importing W3WSwiftEventSubscriber, which is a dependancy better to avoid at this level
//  public init(rootView: T, scheme: W3WLive<W3WScheme?>?) {
//    super.init(rootView: rootView)
//
//    // set cheme update it every time it changes
//    apply(scheme: scheme?.value)
//    subscribe(to: scheme) { [weak self] scheme in
//      self?.apply(scheme: scheme)
//    }
//  }
//
//  public init(rootView: T, theme: W3WLive<W3WTheme?>? = nil) {
//    super.init(rootView: rootView)
//
//    // set cheme update it every time it changes
//    apply(theme: theme?.value)
//    subscribe(to: theme) { [weak self] theme in
//      self?.apply(theme: theme)
//    }
//  }

  
  public func apply(scheme: W3WScheme?) {
    view.layer.cornerRadius = scheme?.styles?.cornerRadius?.value ?? 0.0
    view.layer.shadowColor = scheme?.colors?.shadow?.cgColor
    view.layer.shadowOffset = CGSize(width: scheme?.styles?.shadow?.offset ?? 0.0, height: scheme?.styles?.shadow?.offset ?? 0.0)
    view.layer.shadowRadius = scheme?.styles?.shadow?.radius ?? 0.0
    view.layer.shadowOpacity = Float(scheme?.styles?.shadow?.opacity ?? 0.0)
  }

  
  func apply(theme: W3WTheme?) {
    apply(scheme: theme?[.base])
    //view.layer.cornerRadius = W3WCornerRadius.large.value
    //view.layer.shadowColor = theme?.fillsQuinary?.current.cgColor //scheme?.colors?.shadow?.cgColor
    //view.layer.shadowOffset = CGSize(width: W3WShadow.low.offset, height: W3WShadow.low.offset)
    //view.layer.shadowRadius = W3WShadow.low.radius
    //view.layer.shadowOpacity = Float(W3WShadow.low.opacity)
  }

  
////  override public func viewDidLayoutSubviews() {
////      super.viewDidLayoutSubviews()
////      self.view.invalidateIntrinsicContentSize()
////  }
//  
////  public var scheme: W3WScheme?
////  
////  public var position: W3WViewPosition?
////
////  
////  override public func viewWillLayoutSubviews() {
////    super.viewWillLayoutSubviews()
////    view.apply(scheme: scheme)
////  }
////  
////  
////  func set(position: W3WViewPosition?, animate: W3WDuration) {
////    UIView.animate(withDuration: animate.seconds) { [weak self] in
////      self?.set(position: position)
////    }
////  }
////  
////  
////  func set(position: W3WViewPosition?) {
////    if let p = position {
////      self.position = p
////    }
////    
////    updateView()
////  }
////  
////  
////  func set(position: @escaping W3WPositionClosure) {
////    self.position = W3WViewPosition(position: position)
////  }
////
////
////  func updateView() {
////    W3WThread.runOnMain { [weak self] in
////      if let this = self {
////        self?.position(view.superview, view)
////      }
////    }
////    W3WThread.queueOnMain { [weak self] in
////      self?.update(scheme: self?.scheme)
////    }
////  }
////
////  /// this will position the view to where it needs to be via `frame` or using constraints as requested
////  public func position(_ parent: UIView?, _ this: UIView) {
////    if let duration = animate {
////      UIView.animate(withDuration: duration) { [weak self] in
////        self?.applyPosition(parent, this)
////      }
////    } else {
////      applyPosition(parent, this)
////    }
////  }
////  
////  
////  func applyPosition(_ parent: UIView?, _ this: W3WViewProtocol) {
////    if let p = closure {
////      this.frame = p(parent, this)
////    }
////  }

  
  
}

