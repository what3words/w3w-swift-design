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
  
  /// the basic colours to use, actually stored in protocol data, so we wrap the value here
  public var colors: W3WBaseColors {
    get {
      return w3wView?.design?.colors ?? .basic
    }
    set {
      w3wView?.design?.colors = newValue
    }
  }
  
  /// the little notch in the top shown when this is presented modally
  var handleIndicator = W3WHandleIndicator()
  
  /// an optional X button to dismiss this view
  lazy var dismissButton = W3WDismissButton(parentViewController: self, colors: W3WColorSet(foreground: W3WBaseColors.basic.foreground, background: W3WBaseColors.basic.background, tint: W3WBaseColors.basic.foreground, secondary: W3WBaseColors.basic.background))
  
  /// a list of the sub views that were added with `add(view:frame)` used for managing the view postions
  public var managedViews = [W3WViewProtocol]()

  public weak var parentView: UIView? {
    get { view }
    set { view = newValue }
  }
  
  /// shows/hides the handle
  public var showHandle: Bool {
    get { return !handleIndicator.isHidden }
    set { handleIndicator.isHidden = !newValue }
  }
  
  /// shows/hides the dismiss button
  public var showDismissButton: Bool {
    get { return !dismissButton.isHidden }
    set { dismissButton.isHidden = !newValue }
  }
  

  /// design to use for subview
  public var design: W3WDesign?

  
  // MARK: init
  
  
  public init(design: W3WDesign? = nil) {
    super.init(nibName: nil, bundle: nil)
    self.design = design
  }

  
  required public init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  
  // MARK: ViewDidLoad
  
  
  override open func loadView() {
    self.view = W3WView(design: design)
  }
  
  
  public var w3wView: W3WView? {
    return self.view as? W3WView
  }

  
  override open func viewDidLoad() {
    super.viewDidLoad()
    
    //w3wView?.design = W3WDesign(owner: view)
    
    //updateColors()

    // add the sub views
    //add(view: W3WWrappedView<UIView>(view: handleIndicator), position: handleIndicator.getFrame)
    //add(view: W3WWrappedView<W3WDismissButton>(view: dismissButton),   position: dismissButton.getFrame)

    // show the handle if view is presented modally
    showHandle = isPresentedModally() ? true : false
    
    // dismiss is always off by default
    showDismissButton = false
  }
  
  
  // MARK: Accessors
  
  
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
//  public func add(view: UIView, design: W3WDesign, position: W3WViewPosition) {
//    let managedView = W3WManagedView(view: view, design: design, position: position)
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

  
  // MARK: Colour stuff
  
  
  /// respond to dark/light mode updates
  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)
    w3wView?.updateView()
  }
  
  
  //func updateColors() {
    //w3wView?.design?.updateColors(view: view)
    //w3wView?.updateView()
    //view.backgroundColor = colors.background.current.uiColor
    //view.layer.backgroundColor = colors.background.current.cgColor
  //}

  
  // MARK: Additional VC overrides

  
  open override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    //handleIndicator.position()
    
    w3wView?.updateView()
    updateViews()
  }
  
  
  public override func viewWillDisappear(_ animated: Bool) {
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
  
  

}
