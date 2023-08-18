////
////  File.swift
////  
////
////  Created by Dave Duprey on 06/07/2023.
////
//
//import UIKit
//
//
//public class W3WMarginView<ViewType: UIView>: W3WWrappedView<ViewType> {
//
//  var margin = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
//  
//  public init(view: ViewType? = nil, margin: UIEdgeInsets) {
//    super.init(view: view)
//    self.margin = margin
//  }
//
//  
//  public required init?(coder: NSCoder) {
//    super.init(coder: coder)
//  }
//  
//  
//  open override func layoutSubviews() {
//    super.updateView()
//    
//    wrappedView?.frame = bounds.inset(by: margin)
//  }
//
//  
//}
