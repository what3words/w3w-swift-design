//
//  W3WTableCellView.swift
//  
//
//  Created by Dave Duprey on 14/04/2023.
//

import UIKit
import W3WSwiftCore


public class W3WTableViewCell: UITableViewCell, W3WViewProtocol {

  // MARK: Vars
  
  public var theme: W3WTheme?
  
  public var position: W3WViewPosition?
  
  public static var cellIdentifier: String { get { return String(describing: Self.self) } }

  var image: W3WIconView?

  // MARK: Init

  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    set(theme: theme, position: position)
  }
  
  
  public init(cellStyle: UITableViewCell.CellStyle, theme: W3WTheme) {
    super.init(style: cellStyle, reuseIdentifier: Self.cellIdentifier)
    set(theme: theme, position: position)
  }
  
  
  public init(theme: W3WTheme?) {
    super.init(style: .default, reuseIdentifier: Self.cellIdentifier)
    set(theme: theme, position: position)
  }
  
  
  public init() {
    super.init(style: .default, reuseIdentifier: Self.cellIdentifier)
    set(theme: theme, position: position)
  }
  
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  
  // MARK: Accessors

  
  public func set(image: W3WIconView) {
    self.image = image
    updateImage()
  }
  
  
  public func set(image: W3WImage) {
    set(image: W3WIconView(image: image))
  }
  

//  public func set(accessory: UITableViewCell.AccessoryType) {
//    accessoryType = accessory
//  }
  
  
  func updateImage() {
    let length = 8.0 // frame.height * (1.0 / W3WSettings.goldenRatio)
    var frameLength = length

    if #available(iOS 13.0, *) {
      frameLength = length * (window?.windowScene?.screen.scale ?? 1.0)
    } else {
      frameLength = length * UIScreen.main.scale
    }

    self.imageView?.bounds      = CGRect(origin: .zero, size: CGSize(width: frameLength, height: frameLength))
    self.imageView?.contentMode = .scaleAspectFit
    self.imageView?.image       = image?.underlyingImage.get(size: CGSize(width: length, height: length))
    
    // design needs to be applied here because it is a view controlled by UITableViewCell and not us
//    if let i = imageView {
//      var iconDesign = W3WDesign.w3wCellIconFilled
//      iconDesign.update(view: i)
//    }
    
    updateView()
  }
  
  
//  public func set(theme: W3WDesign?) {
//    self.design = design
//  }
  
  
  // MARK: Overrides
  
  
  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    //updateImage()
    updateView()
  }
  
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    //self.imageView?.frame = CGRect(x: 8.0, y: 8.0, width: frame.height - 16.0, height: frame.height - 16.0)
    //self.imageView?.frame = CGRect(x: 8.0, y: 8.0, width: 16.0, height: 16.0)
    //updateImage()
    updateView()
  }

  
  public func update(theme: W3WTheme?) {
    updateImage()
    apply(theme: theme?.copy(from: .cells, to: .base))
  }
  
}
