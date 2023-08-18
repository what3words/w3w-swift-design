//
//  W3WTableCellView.swift
//
//
//  Created by Dave Duprey on 14/04/2023.
//

import UIKit
import W3WSwiftCore


open class W3WCollectionViewCell: UICollectionViewCell, W3WViewProtocol { //}, W3WViewManagerProtocol {

  //public weak var parentView: UIView? { get { self } set {  } }
  //public var managedViews = [W3WViewProtocol]()

  
  // MARK: Vars
  
  public var theme: W3WTheme?
  
  public var position: W3WViewPosition?
  
  public static var cellIdentifier: String { get { return String(describing: Self.self) } }
  
  var image: W3WIconView?
  
  // MARK: Init
  
  
  override public init(frame: CGRect) {
    super.init(frame: frame)
    set(theme: theme)
  }
  
  
  public init(frame: CGRect, theme: W3WTheme? = nil) {
    super.init(frame: frame)
    set(theme: theme)
  }
  
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  
  // MARK: Accessors
  
  
  
  // MARK: Overrides
  
  
  open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    updateView()
    //updateViews()
  }
  
  
  open override func layoutSubviews() {
    updateView()
    //updateViews()
  }
  
  
}
