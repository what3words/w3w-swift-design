//
//  File.swift
//  
//
//  Created by Dave Duprey on 19/05/2022.
//

import UIKit


/// convenience class overloading UIViewController that has some
/// utilities and manages sub views.  Subviews can be passed in with
/// a closure defining it's position
open class W3WViewController: UIViewController, W3WViewManagerProtocol {
    
  // MARK: Vars
  
  ///called when the view is about to dissappear
  public var onDismiss: () -> () = { }
  
  /// the little notch in the top shown when this is presented modally
  var handleIndicator = W3WHandleIndicator()
  
  /// an optional X button to dismiss this view
  lazy var dismissButton = W3WDismissButton(parentViewController: self) //, colors: W3WllColors(foreground: W3WBasicColors.basic.foreground, background: W3WBasicColors.basic.background, tint: W3WBasicColors.basic.foreground, secondary: W3WBasicColors.basic.background))
  
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
  public var showDismissButton: Bool {
    get { return !dismissButton.isHidden }
    set { dismissButton.isHidden = !newValue }
  }
  

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
  

// This?
//  /// initializer override to instantiate the W3WOcrScannerView
//  public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)   {
//    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//  }

  
  // MARK: ViewDidLoad
  
  
  override open func loadView() {
    self.view = W3WView(theme: theme)
  }
  
  
  public var w3wView: W3WView? {
    return self.view as? W3WView
  }

  
  override open func viewDidLoad() {
    super.viewDidLoad()
    
    // add the sub views
    //add(view: W3WWrappedView<UIView>(view: handleIndicator), position: handleIndicator.getFrame)
    //add(view: W3WWrappedView<W3WDismissButton>(view: dismissButton),   position: dismissButton.getFrame)

    // show the handle if view is presented modally
    showHandle = isPresentedModally() ? true : false
    
    // dismiss is always off by default
    showDismissButton = false
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
    //handleIndicator.position()
    
    w3wView?.updateView()
    updateViews()
  }
  
  
  open override func viewWillDisappear(_ animated: Bool) {
    onDismiss()
    super.viewWillDisappear(animated)
  }

  
  // MARK: Util
  
  
  /// determines if the view was presented modally or as a regular view
  func isPresentedModally() -> Bool {
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
  
  
  // MARK: Popovers
  
  
//  public func popover(vc: W3WViewController) {
//    if let v = vc.w3wView {
//      addChild(vc)
//      view.addSubview(v)
//      v.set(position: .bottom())
//    }
//
//    //vc.modalPresentationStyle = .overCurrentContext
//    //vc.preferredContentSize = .init(width: view.frame.width, height: 256.0)
//    //
//    //let smallDetentId = UISheetPresentationController.Detent.Identifier("small")
//    //let smallDetent = UISheetPresentationController.Detent.custom(identifier: smallDetentId) { context in
//    //  return 100
//    //}
//    //vc?.detents = [smallDetent, .medium(), .large()]
//    //
//    //present(vc, animated: true)
//    //if let sheet = vc.sheetPresentationController {
//    //  sheet.detents = [.medium(), .large()]
//    //  sheet.largestUndimmedDetentIdentifier = .medium
//    //  sheet.prefersScrollingExpandsWhenScrolledToEdge = false
//    //  sheet.prefersEdgeAttachedInCompactHeight = true
//    //  sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
//    //}
//    //present(vc, animated: true, completion: nil)
//  }
  

}




//  public func add(view: UIView, frame: @escaping () -> (CGRect)) {
//    add(view: view, position: W3WViewPosition(position: frame))
//  }
//
//
//  public func add(view: UIView, position: W3WViewPosition) {
//    let managedView = W3WManagedView(view: view, position: position)
//    managedViews.append(managedView)
//
//    self.view.addSubview(view)
//  }
//
//
//  public func add(view: UIView, theme: W3WDesign, position: W3WViewPosition) {
//    let managedView = W3WManagedView(view: view, theme: theme, position: position)
//    managedViews.append(managedView)
//
//    self.view.addSubview(view)
//  }
//
//
//  public func add(view: W3WViewProtocol, position: W3WViewPosition? = nil) {
//    let managedView = W3WManagedView(view: view, position: position)
//    managedViews.append(managedView)
//
//    self.view.addSubview(view)
//  }
