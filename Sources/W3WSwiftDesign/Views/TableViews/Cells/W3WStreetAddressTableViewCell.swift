//
//  File.swift
//  
//
//  Created by Dave Duprey on 12/05/2022.
//

import Foundation
import UIKit



public class W3WStreetAddressTableViewCell: W3WTableViewDetailCell {
  
  // MARK: Vars

  /// title for the cell
  var title: String?

  /// description for the cell
  var subTitle: String?

  
  // MARK: Init
  
  
  override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
  }
  
  
  public init(design: W3WDesign) {
    super.init(style: .subtitle, reuseIdentifier: Self.cellIdentifier)
    self.design = design

    set(image: W3WIcon(drawing: .ocr))
    
  }
  
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  
  // MARK: Acccessors
  
  
  /// sets the row view to the values provided
  public func set(title: String?, subTitle: String?, disclosureIndicator: Bool = false) {
    self.title = title
    self.subTitle = subTitle

    updateUI()
  }
  
  
  /// update labels
  func updateLabels() {
    textLabel?.text = title
    detailTextLabel?.text = subTitle
  }
    
  
  func updateUI() {
    design?.update(view: self)
    updateLabels()
  }
  
  
  /// respond to dark/light mode updates
  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)
    updateUI()
  }
  
  
  /// respond to layout changes
  public override func layoutSubviews() {
    super.layoutSubviews()
    updateUI()
  }
  
  
  
}




//public class W3WStreetAddressTableViewCell: UITableViewCell {
//
//  // MARK: Vars
//
//  /// title for the cell
//  var title: String?
//
//  /// description for the cell
//  var subTitle: String?
//
//  /// number of items in the next level down
//  var subItemCount: Int?
//
//  /// whether or not to show the disclosure indicator and subItemCount
//  var disclosureIndicator = false
//
//  /// size of the icon
//  let iconSize = 24.0
//
//  /// size of the count indicator
//  let countSize = 32.0
//
//  /// count indicator label
//  var countLabel: UILabel!
//
//  /// show or don't show count in the row
//  var showCount = false
//
//  /// colors to use
//  public var colors = W3WColorSet.lightDarkMode
//
//  /// separator line, to replace the built in one, as we don't one one at the top of the view
//  let separatorLine = UIView(frame: .w3wWhatever)
//
//
//  // MARK: Init
//
//
//  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//    super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
//    instantiateUIElements()
//  }
//
//
//  public required init?(coder: NSCoder) {
//    super.init(coder: coder)
//    instantiateUIElements()
//  }
//
//
//  /// set up the UI stuff
//  func instantiateUIElements() {
//    countLabel = UILabel(frame: CGRect(origin: .zero, size: CGSize(width: countSize, height: countSize)))
//    countLabel.font = UIFont.systemFont(ofSize: 12.0)
//    countLabel.textAlignment = .center
//    countLabel.minimumScaleFactor = 0.5
//    countLabel.adjustsFontSizeToFitWidth = true
//    countLabel.layer.cornerRadius = countSize / 2.0
//    addSubview(countLabel)
//
//    separatorLine.backgroundColor = W3WColor.systemGroupedBackground.current.uiColor
//    addSubview(separatorLine)
//
//    updateColours()
//  }
//
//
//  public override func prepareForReuse() {
//    super.prepareForReuse()
//  }
//
//
//  // MARK: Accessors
//
//
//  /// sets the row view to the values provided
//  public func set(title: String?, subTitle: String?, subItemCount: Int? = nil, disclosureIndicator: Bool = false) {
//    self.title = title
//    self.subTitle = subTitle
//    self.subItemCount = subItemCount
//    self.disclosureIndicator = disclosureIndicator
//
//    self.textLabel?.text = title
//    self.detailTextLabel?.text = subTitle
//    //self.imageView?.image = disclosureIndicator ? W3WIcons.pinMulti : W3WIcons.pin
//    //UIImage(named: disclosureIndicator ? "addressValidationPinMultiBlack" : "addressValidationPinBlack")
//
//    if disclosureIndicator {
//      accessoryType = .disclosureIndicator
//    }
//
//    if showCount {
//      if let count = subItemCount {
//        if count > 0 {
//          countLabel.isHidden = false
//          countLabel.text = String(count)
//          return
//        }
//      }
//    }
//
//    countLabel.isHidden = true
//  }
//
//
//  // MARK: Color modes
//
//
//  /// handle switching from light mode to dark mode and vice versa
//  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//    updateColours()
//  }
//
//
//  /// updates the colours of all elements
//  func updateColours() {
//    self.textLabel?.textColor = colors.foreground?.current.uiColor
//    self.detailTextLabel?.textColor = colors.secondary?.current.uiColor
//    self.backgroundColor = colors.background?.current.uiColor
//    countLabel.textColor = colors.background?.current.uiColor
//    countLabel.layer.backgroundColor = colors.tint?.current.cgColor
//  }
//
//
//  // MARK: Layout
//
//
//  /// puts all sub views into the right place
//  public override func layoutSubviews() {
//    super.layoutSubviews()
//
//    updateColours()
//
//    self.imageView?.frame = CGRect(x: W3WPadding.medium.value, y: (frame.height - iconSize) / 2.0, width: iconSize, height: iconSize)
//
//    if let f = self.textLabel?.frame, let imageFrame = imageView?.frame {
//      let newX = imageFrame.origin.x + iconSize + W3WPadding.medium.value
//      //self.textLabel?.frame = CGRect(x: newX, y: f.origin.y, width: f.width, height: f.height)
//      self.textLabel?.frame = CGRect(x: newX, y: f.origin.y, width: frame.width - newX * 1.62, height: f.height)
//    }
//
//    if let f = self.detailTextLabel?.frame, let imageFrame = imageView?.frame {
//      let newX = imageFrame.origin.x + iconSize + W3WPadding.medium.value
//      //self.detailTextLabel?.frame = CGRect(x: newX, y: f.origin.y, width: f.width, height: f.height)
//      self.detailTextLabel?.frame = CGRect(x: newX, y: f.origin.y, width: frame.width - newX * 1.62, height: f.height)
//    }
//
//    separatorLine.frame = CGRect(x: W3WPadding.bold.value, y: frame.height - 1.0, width: frame.width - W3WPadding.bold.value * 2.0, height: 1.0)
//
//    countLabel.frame = CGRect(
//      x: frame.size.width - W3WPadding.medium.value - countSize - (disclosureIndicator ? countSize : 0.0),
//      y: (frame.height - countSize) / 2.0,
//      width: countSize,
//      height: countSize)
//  }
//
//
//}
