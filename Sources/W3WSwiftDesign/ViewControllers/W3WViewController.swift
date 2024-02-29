//
//  File.swift
//  
//
//  Created by Dave Duprey on 19/05/2022.
//

import UIKit
import W3WSwiftThemes


/// convenience class overloading UIViewController that has some
/// utilities and manages sub views.  Subviews can be passed in with
/// a closure defining it's position
open class W3WViewController: UIViewController, W3WViewManagerProtocol {
    
  // MARK: Vars
  
  ///called when the view is about to dissappear
  public var onDismiss: () -> () = { }
  
  /// the little notch in the top shown when this is presented modally
  public var handleIndicator = W3WHandleIndicator()
  
  /// a list of the sub views that were added with `add(view:frame)` used for managing the view postions
  public var managedViews = [W3WViewProtocol]()

  public weak var parentView: UIView? {
    get { view }
    set { view = newValue }
  }
  
  /// shows/hides the handle
  public var showHandle: Bool {
    
    get {
      return (handleIndicator.superview != nil)
    }
    
    set {
      if newValue {
        add(view: handleIndicator)
      } else {
        remove(view: handleIndicator)
      }
    }
  }
  
  /// shows/hides the dismiss button
  @available(*, deprecated, message: "view no loger has dimiss button")
  public var showDismissButton: Bool { get { false } set { } }
  

  /// design to use for subview
  public var theme: W3WTheme?

  
  // MARK: init
  
  
  public init(theme: W3WTheme? = nil) {
    super.init(nibName: nil, bundle: nil)
    self.theme = theme
  }

  
  required public init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  

  // MARK: Accessors
  
  public func set(theme: W3WTheme?) {
    self.theme = theme
    w3wView?.scheme = theme?[.base]
    w3wView?.updateView()
    handleIndicator.scheme = theme?[.base]
  }

  
  // MARK: ViewDidLoad
  
  
  override open func loadView() {
    self.view = W3WView(scheme: theme?[.base])
  }
  
  
  public var w3wView: W3WView? {
    return self.view as? W3WView
  }

  
  override open func viewDidLoad() {
    super.viewDidLoad()
    
    // show the handle if view is presented modally
    showHandle = isPresentedModally() ? true : false
  }
  
  
  // MARK: Accessors
  
  
  public func add(viewController: W3WViewController, position: W3WViewPosition) {
    DispatchQueue.main.async { [weak self] in
      if let v = viewController.w3wView {
        self?.addChild(viewController)
        self?.view.addSubview(v)
        v.set(position: position)
      }
    }
  }
  
  
  public func remove(viewController: W3WViewController) {
    DispatchQueue.main.async {
      if let v = viewController.w3wView {
        v.removeFromSuperview()
        viewController.removeFromParent()
      }
    }
  }
  
  
  // MARK: Colour stuff
  
  
  /// respond to dark/light mode updates
  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)
    w3wView?.updateView()
  }
  
  
  // MARK: Additional VC overrides

  
  open override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    
    w3wView?.updateView()
    updateViews()
  }
  
  
  open override func viewWillDisappear(_ animated: Bool) {
    onDismiss()
    super.viewWillDisappear(animated)
  }

  
  // MARK: Util
  
  
  /// determines if the view was presented modally or as a regular view
  public func isPresentedModally() -> Bool {
    if self.presentingViewController != nil {
      return true
    }
    
    if self.navigationController?.presentingViewController?.presentedViewController == self.navigationController {
      return true
    }
    
    if self.tabBarController?.presentingViewController?.isKind(of: UITabBarController.self) ?? false { //  isKindOfClass:[UITabBarController class]])
      return true
    }
    
    return false
  }
  
}
