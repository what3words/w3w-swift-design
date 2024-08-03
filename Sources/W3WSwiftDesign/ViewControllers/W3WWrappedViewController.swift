//
//  File.swift
//
//
//  Created by Dave Duprey on 03/08/2024.
//

import UIKit


/// W3WViewController that contains a W3WWrappedView
open class W3WWrapperViewController: W3WViewController {

  /// a convenience accessor to the W3WWrappedView
  var wrapperView: W3WWrappedView? { get { return view as? W3WWrappedView } }
  
  
  /// automatically make this vc's view a wrapper view
  public override func loadView() {
    view = W3WWrappedView()
  }
  
  
  /// default init with blank view
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  
  public init(rootView: UIView, theme: W3WTheme? = nil) {
    super.init(theme: theme)
    set(view: rootView)
  }
  
  
  public func set(view: UIView) {
    wrapperView?.set(view: view)
  }
  
}

