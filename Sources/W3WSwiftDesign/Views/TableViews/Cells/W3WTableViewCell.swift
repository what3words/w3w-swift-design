//
//  W3WTableCellView.swift
//  
//
//  Created by Dave Duprey on 14/04/2023.
//

import UIKit
import W3WSwiftCore
import W3WSwiftThemes


open class W3WTableViewCell: UITableViewCell, W3WViewProtocol {

  // MARK: Vars
  
  public var scheme: W3WScheme?
  
  public var position: W3WViewPosition?
  
  public static var cellIdentifier: String { get { return String(describing: Self.self) } }

  var image: W3WIconView?

  // MARK: Init

  
  public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    set(scheme: scheme, position: position)
    configure()
  }
  
  
  public init(cellStyle: UITableViewCell.CellStyle, scheme: W3WScheme) {
    super.init(style: cellStyle, reuseIdentifier: Self.cellIdentifier)
    set(scheme: scheme, position: position)
    configure()
  }
  
  
  public init(scheme: W3WScheme?) {
    super.init(style: .default, reuseIdentifier: Self.cellIdentifier)
    set(scheme: scheme, position: position)
    configure()
  }
  
  
  public init() {
    super.init(style: .default, reuseIdentifier: Self.cellIdentifier)
    set(scheme: scheme, position: position)
    configure()
  }
  
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    configure()
  }
  
  
  func configure() {
  }

  
  // MARK: Accessors

  
  public func set(image: W3WIconView) {
    self.image = image
    updateImage()
  }
  
  
  public func set(image: W3WImage) {
    set(image: W3WIconView(image: image))
  }
  

  func updateImage() {
    let length = 8.0
    var frameLength = length

    if #available(iOS 13.0, *) {
      frameLength = length * (window?.windowScene?.screen.scale ?? 1.0)
    } else {
      frameLength = length * UIScreen.main.scale
    }

    self.imageView?.bounds      = CGRect(origin: .zero, size: CGSize(width: frameLength, height: frameLength))
    self.imageView?.contentMode = .scaleAspectFit
    self.imageView?.image       = image?.underlyingImage.get(size: CGSize(width: length, height: length))
    
    //updateView()
    position?.position(superview, self)
  }
  
  
  // MARK: Overrides
  
  
  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    //updateImage()
    updateView()
  }
  
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    updateView()
  }

  open func set(scheme: W3WScheme?) {
    self.scheme = scheme
    updateView()
  }
  
  open func update(scheme: W3WScheme?) {
    updateImage()
  }
}
