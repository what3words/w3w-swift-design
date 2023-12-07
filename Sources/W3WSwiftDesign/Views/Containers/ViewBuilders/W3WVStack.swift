//
//  File.swift
//
//
//  Created by Dave Duprey on 19/06/2023.
//

import UIKit
import W3WSwiftThemes


/// makes a W3WStack of views in horizontal mode
public class W3WVStack: W3WViewBuilder<W3WVerticalStackMaker> { }


/// Because @resultBuilders operate on static functions a way to switch out the
/// function that makes the the container was needed, to prevent redundant code
public class W3WVerticalStackMaker: W3WViewContainerTypeProtocol {
  static public func makeContainer(views: [W3WViewProtocol]) -> W3WViewProtocol {
    let stack = W3WStackView(views: views)
    stack.axis = .vertical
    return stack
  }
}

