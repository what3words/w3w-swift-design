//
//  File.swift
//  
//
//  Created by Dave Duprey on 19/05/2022.
//

import UIKit
import W3WSwiftCore
import W3WSwiftThemes

#if canImport(w3w)
import w3w
#endif


public class W3WSuggestionsTableViewCell: W3WTableViewCell, W3WViewManagerProtocol {

  // MARK: Vars
  
  public var suggestion: W3WSuggestion?
    
  public var distanceLabel: W3WLabel?

  public weak var parentView: UIView? { get { self } set { } }

  public var managedViews = [W3WViewProtocol]()


  // MARK: Init


  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    updateLabels()
  }
  
  
  override public init(scheme: W3WScheme? = nil) {
    super.init(style: .default, reuseIdentifier: Self.cellIdentifier)
    self.scheme = scheme
    updateLabels()
  }


  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    updateLabels()
  }
  
  
  /// assign the three words values to the UI elecments
  public func set(suggestion: W3WSuggestion?) {
    self.suggestion = suggestion
    updateLabels()
  }
  

  func updateLabels() {
    semanticContentAttribute = W3WSettings.leftToRight ? .forceLeftToRight : .forceRightToLeft
    
    if distanceLabel == nil {
      distanceLabel = W3WLabel()
      add(view: distanceLabel!, position: distancePosition)
    }
    
    // if there is colour information we use marked up text for the title, and colour everything
    if let colors = scheme?.colors ?? W3WTheme.standard[.base]?.colors {
      textLabel?.attributedText    = W3WString(suggestion?.words ?? "", color: colors.foreground).withSlashes(color: colors.brand ?? .red).asAttributedString()
      detailTextLabel?.textColor  = colors.secondary?.current.uiColor
      distanceLabel?.textColor      = colors.secondary?.current.uiColor

    // absent colour info, we use plain text
    } else {
      textLabel?.text = suggestion?.words ?? ""
    }

    detailTextLabel?.text = suggestion?.nearestPlace

    if let distance = suggestion?.distanceToFocus {
      distanceLabel?.text = String(describing: distance)
    } else {
      distanceLabel?.text = ""
    }
  }
  
  
  func distancePosition(parent: UIView?, this: W3WViewProtocol) -> CGRect {
    this.sizeToFit()
    let spacing = scheme?.styles?.padding?.right ?? 0
    return CGRect(
      x: W3WSettings.leftToRight ? frame.width - spacing - this.frame.width : spacing,
      y: detailTextLabel?.frame.minY ?? 0.0,
      width: this.frame.width,
      height: detailTextLabel?.frame.height ?? 0.0
    )
  }

  
  /// respond to dark/light mode updates
  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)
    updateView()
  }


  /// respond to layout changes
  public override func layoutSubviews() {
    super.layoutSubviews()
    //updateViews()
  }


  override public func update(scheme: W3WScheme?) {
    updateLabels()
  }

}
