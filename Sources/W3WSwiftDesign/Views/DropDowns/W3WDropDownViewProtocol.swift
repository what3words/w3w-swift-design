//
//  File.swift
//  
//
//  Created by Dave Duprey on 23/03/2023.
//

import UIKit


public protocol W3WDropDownViewProtocol: W3WViewProtocol, W3WViewManagerProtocol {
  var dropdownView: W3WViewProtocol? { get set }
  //var design: W3WDesign? { get set }
}


public extension W3WDropDownViewProtocol {
  
  func set(dropdownView: W3WViewProtocol?) {

    DispatchQueue.main.async { [weak self] in
      // if there was already a view, we remove it to make way
      if let v = self?.dropdownView {
        v.removeFromSuperview()
      }
      
      // remember it
      self?.dropdownView = dropdownView

      if let me = self {
        me.dropdownView?.frame = me.dropdownFrame
        //me.position = W3WViewPosition.place(below: me)
      }
      
      // add it to the view
      if let v = dropdownView {
        //self?.superview?.addSubview(v)
        self?.addSubview(v)
        //self?.superview?.bringSubviewToFront(v)
      }
    }
  }
  
  
  // MARK: Layout
  
  
  var dropdownFrame: CGRect {
    get {
      //return CGRect(x: 0.0, y: frame.maxY, width: design?.style?.padding?.value ?? W3WPadding.fine.value, height: dropdownView?.frame.height ?? W3WRowHeight.medium.value)
      return CGRect(
        x: 0.0,
        y: frame.height + (design?.style?.padding?.value ?? W3WPadding.fine.value),
        width: frame.width,
        height: dropdownView?.frame.height ?? W3WRowHeight.medium.value)
    }
  }
  
  
//  func updateDropDownView() {
//    dropdownView?.frame = dropdownFrame //CGRect(x: frame.origin.x, y: frame.maxY, width: frame.width, height: dropdownView?.frame.height ?? W3WRowHeight.medium.value)
//  }
  
  
  
}

