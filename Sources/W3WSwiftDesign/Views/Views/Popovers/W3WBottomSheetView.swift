//
//  File.swift
//  
//
//  Created by Dave Duprey on 13/09/2023.
//

//import UIKit
//
//
//open class W3WBottomSheetView: W3WView {
//
//  override public init(theme: W3WTheme? = nil) { //, position: W3WViewPosition? = nil) {
//    super.init(theme: theme)
//    configure()
//  }
//
//
//  public required init?(coder: NSCoder) {
//    super.init(coder: coder)
//    configure()
//  }
//
//
//  func configure() {
//    let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
//    addGestureRecognizer(panGestureRecognizer)
//  }
//
//
//  @objc private func didSwipe(_ sender: UIPanGestureRecognizer) {
//    print("Gesture:", sender.translation(in: self))
//
//    let currentHeight = frame.height
//    let verticalDelta = sender.translation(in: self).y
//
//    if let sv = superview {
//      let point = sender.location(in: sv)
//      let height = sv.frame.height - point.y
//
//      set(position: .bottom(height: height))
//      //position = .bottom(height: currentHeight - verticalDelta)
//      //position?.position(superview, self)
//    }
//  }
//
//
//}
