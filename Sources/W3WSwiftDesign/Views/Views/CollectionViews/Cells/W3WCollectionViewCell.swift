//
//  W3WTableCellView.swift
//
//
//  Created by Dave Duprey on 14/04/2023.
//

import UIKit
import W3WSwiftCore


open class W3WCollectionViewCell: UICollectionViewCell, W3WViewProtocol { //}, W3WViewManagerProtocol {

  // MARK: Vars
  
  public var scheme: W3WScheme?
  
  public var position: W3WViewPosition?
  
  public static var cellIdentifier: String { get { return String(describing: Self.self) } }
  
  var image: W3WIconView?
  
  // MARK: Init
  
  
  override public init(frame: CGRect) {
    super.init(frame: frame)
    set(scheme: scheme)
  }
  
  
  public init(frame: CGRect, scheme: W3WScheme? = nil) {
    super.init(frame: frame)
    set(scheme: scheme)
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
  

  public func update(scheme: W3WScheme?) {
    apply(scheme: scheme)
  }

}
