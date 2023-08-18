//
//  File.swift
//  
//
//  Created by Dave Duprey on 19/05/2022.
//

import UIKit
import W3WSwiftCore

#if canImport(w3w)
import w3w
#endif


public class W3WSuggestionsTableViewCell: W3WTableViewCell {

  // MARK: Vars

  public var suggestion: W3WSuggestion?

  
  // MARK: Init


  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
  }
  
  
  override public init(theme: W3WTheme? = nil) {
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
    theme?.update(view: self)
  }
  
  
  /// override to allow SDK to work with this library
  #if canImport(w3w)
  func set(suggestion: W3WSdkSuggestion?) {
    let s = suggestion?.asBaseSuggestion()
    set(suggestion: s)
  }
  #endif

  
  /// update labels
  func updateLabels() {
    textLabel?.attributedText = W3WString(suggestion?.words ?? "", color: theme?.colors?.foreground ?? W3WColor.foreground).withSlashes(color: theme?.colors?.base.tint ?? .tint).asAttributedString()

    detailTextLabel?.text = suggestion?.nearestPlace
    detailTextLabel?.textColor = theme?.colors?.base.secondary?.current.uiColor ?? W3WColor.secondary.current.uiColor
  }



  /// respond to dark/light mode updates
  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)
    theme?.update(view: self)
    updateLabels()
  }


  /// respond to layout changes
  public override func layoutSubviews() {
    super.layoutSubviews()
    theme?.update(view: self)
    updateLabels()
  }


  
}


/// A UITableViewCell for displaying a what3words address.
/// the heavy lifting is done in W3WSuggestionViewLayout
//public class W3WSuggestionsTableViewCell: UITableViewCell, W3WSuggestionViewLayoutProtocol, W3WViewProtocol {
//
//  public var theme: W3WDesign?
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
//    theme?.update(view: self)
//  }
//
//
//  /// respond to layout changes
//  public override func layoutSubviews() {
//    super.layoutSubviews()
//    theme?.update(view: self)
//  }
//
//
//}
