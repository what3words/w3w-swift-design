//
//  File.swift
//  
//
//  Created by Dave Duprey on 19/06/2023.
//

import UIKit


/// makes a W3WStack of views in horizontal mode
public class W3WHStack: W3WViewBuilder<W3WHorizontalStackMaker> { }


/// Because @resultBuilders operate on static functions a way to switch out the
/// function that makes the the container was needed, to prevent redundant code
public class W3WHorizontalStackMaker: W3WViewContainerTypeProtocol {
  static public func makeContainer(views: [W3WViewProtocol]) -> W3WViewProtocol {
    let stack = W3WStackView(views: views)
    stack.axis = .horizontal
    return stack
  }
}



