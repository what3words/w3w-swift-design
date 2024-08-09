//
//  File.swift
//  
//
//  Created by Dave Duprey on 03/08/2024.
//

#if canImport(SwiftUI)
import SwiftUI
import UIKit


/// W3WViewController to show a SwiftUI view
//@available(iOS 13.0, *)
//open class W3WHostingController<T: View>: W3WWrapperViewController {
//  
//  /// holds a UIHostingViewController containing the SwiftUI view
//  public var hostingViewController: UIHostingController<T>
//  
//  //var hostingViewController: UIHostingController? { get { return viewController as? UIHostingController } }
//
//  //public var hostedView: UIView { get { return viewController.view } }
//  
//  public init(rootView: T, theme: W3WTheme? = nil) {
//    hostingViewController = UIHostingController(rootView: rootView)
//    super.init(rootView: hostingViewController.view, theme: theme)
//
//    addChild(hostingViewController)
//
//    //view.apply(scheme: theme?[.base]?.with(background: .clear))
//    hostingViewController.view.apply(scheme: theme?[.base])
//    
//    if #available(iOS 16.0, *) {
//      hostingViewController.sizingOptions = .intrinsicContentSize
//    }
//
//  }
//  
//  public required init?(coder aDecoder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//  }
//
//  
//  public func intrinsicSize() -> CGSize {
//    return hostingViewController.view.intrinsicContentSize //.intrinsicContentSize
//  }
//  
//}

#endif
