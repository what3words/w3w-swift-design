//
//  File.swift
//  
//
//  Created by Dave Duprey on 19/05/2022.
//

import UIKit
import W3WSwiftCore


public class W3WSuggestionsTableViewCell: W3WTableViewCell {

  // MARK: Vars

  public var suggestion: W3WSuggestion?

  
  // MARK: Init


  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
  }
  
  
  override public init(design: W3WDesign? = nil) {
    super.init(style: .subtitle, reuseIdentifier: Self.cellIdentifier)
  }


  public required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  
  // MARK: Acccessors

  
  /// assign the three words values to the UI elecments
  public func set(suggestion: W3WSuggestion?) {
    self.suggestion = suggestion
    updateLabels()
    design?.update(view: self)
  }
  
  
  /// update labels
  func updateLabels() {
    textLabel?.attributedText = W3WString(suggestion?.words ?? "", color: design?.colors?.foreground ?? W3WColor.foreground).withSlashes(color: design?.colors?.findTint() ?? .tint).asAttributedString()

    detailTextLabel?.text = suggestion?.nearestPlace
    detailTextLabel?.textColor = design?.colors?.asColorSet().secondary?.current.uiColor ?? W3WColor.secondary.current.uiColor
  }



  /// respond to dark/light mode updates
  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)
    design?.update(view: self)
    updateLabels()
  }


  /// respond to layout changes
  public override func layoutSubviews() {
    super.layoutSubviews()
    design?.update(view: self)
    updateLabels()
  }


  
}


/// A UITableViewCell for displaying a what3words address.
/// the heavy lifting is done in W3WSuggestionViewLayout
//public class W3WSuggestionsTableViewCell: UITableViewCell, W3WSuggestionViewLayoutProtocol, W3WViewProtocol {
//
//  public var design: W3WDesign?
//  public var position: W3WViewPosition?
//
//  public var suggestion: W3WSuggestion?
//  public var highlight: Bool = false
//  public var disableDarkmode: Bool = false
//  public var wordsLabel: W3WLabel?
//  public var nearestPlaceLabel: W3WLabel?
//  public var distanceLabel: W3WLabel?
//
//  public var parentView: UIView?
//  public var managedViews = [W3WViewProtocol]()
//
//
//  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//    super.init(style: style, reuseIdentifier: reuseIdentifier)
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
//  /// respond to dark/light mode updates
//  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//    super.traitCollectionDidChange(previousTraitCollection)
//    design?.update(view: self)
//  }
//
//
//  /// respond to layout changes
//  public override func layoutSubviews() {
//    super.layoutSubviews()
//    design?.update(view: self)
//  }
//
//
//}
