//
//  File.swift
//
//
//  Created by Dave Duprey on 29/09/2022.
//

import UIKit


open class W3WTextFieldDropdown: W3WTextField {
  //public weak var parentView: UIView? { get { self } set { } }
  
  var dropdownManager: W3WDropdownViewsManager?

//  public var dropdownView: W3WViewProtocol?

  public var managedViews = [W3WViewProtocol]()

  public init(theme: W3WTheme? = nil, dropdownView: W3WViewProtocol, dropdownSuperView: UIView) {
    super.init(theme: theme)
    configure()
    
    dropdownManager = W3WDropdownViewsManager(dropdownFromView: self, dropdownSuperView: dropdownSuperView)
  }


  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    configure()
  }

  
  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    updateView()
  }

  
  public override func layoutSubviews() {
    super.layoutSubviews()
    dropdownManager?.update()
//    if let dv = dropdownView {
//      dv.position?.position(self, dv)
//    }
  }

  
}



//open class W3WTextFieldDropdown: W3WTextField {
//
//  weak var dropdownView: UIView?
//
//
//  public init(theme: W3WDesign? = nil, position: W3WViewPosition? = nil, dropdownView: UIView) {
//    super.init(theme: theme, position: position)
//    set(dropdownView: dropdownView)
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
//  public func set(dropdownView: UIView?) {
//    DispatchQueue.main.async {
//      // if there was already a view, we remove it to make way
//      if let v = self.dropdownView {
//        v.removeFromSuperview()
//      }
//
//      // remember it
//      self.dropdownView = dropdownView
//      self.dropdownView?.frame = self.dropdownFrame
//
//      // add it to the view
//      if let v = dropdownView {
//        self.superview?.addSubview(v)
//      }
//    }
//  }
//
//
//  // MARK: Layout
//
//
//  var dropdownFrame: CGRect {
//    get {
//      return CGRect(x: frame.origin.x, y: frame.maxY, width: frame.width, height: dropdownView?.frame.height ?? W3WRowHeight.medium.value)
//    }
//  }
//
//
//  public override func layoutSubviews() {
//    super.layoutSubviews()
//    dropdownView?.frame = dropdownFrame //CGRect(x: frame.origin.x, y: frame.maxY, width: frame.width, height: dropdownView?.frame.height ?? W3WRowHeight.medium.value)
//  }
//
//
//
//}
