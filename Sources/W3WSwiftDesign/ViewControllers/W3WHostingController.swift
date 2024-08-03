//
//  File.swift
//  
//
//  Created by Dave Duprey on 03/08/2024.
//

#if canImport(SwiftUI)
import SwiftUI


/// W3WViewController to show a SwiftUI view
@available(iOS 13.0, *)
open class W3WHostingController: W3WWrapperViewController {
  
  /// holds a UIHostingViewController containing the SwiftUI view
  var hostingViewController: UIViewController

  
  /// default init with blank view
  public required init?(coder aDecoder: NSCoder) {
    hostingViewController = UIViewController()
    super.init(coder: aDecoder)
  }
  
  
  public init<T: View>(rootView: T, theme: W3WTheme? = nil) {
    hostingViewController = UIHostingController(rootView: rootView)
    super.init(rootView: hostingViewController.view, theme: theme)
  }
  
}

#endif
