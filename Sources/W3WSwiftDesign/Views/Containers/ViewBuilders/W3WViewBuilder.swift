//
//  File.swift
//
//
//  Created by Dave Duprey on 19/06/2023.
//

import UIKit
import W3WSwiftThemes


public protocol W3WViewContainerTypeProtocol {
  static func makeContainer(views: [W3WViewProtocol]) -> W3WViewProtocol
}


@resultBuilder
public class W3WViewBuilder<ViewContainerType: W3WViewContainerTypeProtocol> {
  
  class public func build(@W3WViewBuilder _ content: () -> W3WViewProtocol) -> W3WViewProtocol {
    content()
  }
  
  
  class public func buildBlock() -> W3WViewProtocol {
    W3WView()
  }
  
  
  class public func buildBlock(_ views: W3WViewProtocol...) -> W3WViewProtocol {
    return Self.makeStack(views: views)
  }
  
  
  class public func buildBlock(_ views: [W3WViewProtocol]) -> W3WViewProtocol {
    return Self.makeStack(views: views)
  }
  
  
  class public func buildOptional(_ view: W3WViewProtocol?) -> W3WViewProtocol {
    if let v = view {
      return v
    } else {
      return Self.makeStack(views: [])
    }
  }
  
  
  class public func buildEither(first view: W3WViewProtocol) -> W3WViewProtocol {
    return view
  }
  
  
  class public func buildEither(second view: W3WViewProtocol) -> W3WViewProtocol {
    return view
  }
  
  
  class public func buildArray(_ views: [W3WViewProtocol]) -> W3WViewProtocol {
    return Self.makeStack(views: views)
  }
  
  
  class func makeStack(views: [W3WViewProtocol]) -> W3WViewProtocol {
    return ViewContainerType.makeContainer(views: views)
  }
  
  
}
