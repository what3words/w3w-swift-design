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


public class W3WSuggestionsTableViewCell: W3WTableViewCell, W3WSuggestionViewLayoutProtocol {

  // MARK: Vars
  
  public var suggestion: W3WSuggestion?
    
  public var wordsLabel: W3WLabel?
  
  public var nearestPlaceLabel: W3WLabel?
  
  public var distanceLabel: W3WLabel?
  
  public weak var parentView: UIView? { get { self } set {  } }

  public var managedViews = [W3WViewProtocol]()
  

  // MARK: Init


  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: .default, reuseIdentifier: reuseIdentifier)
    instantiateUIElements()
  }
  
  
  override public init(theme: W3WTheme? = nil) {
    super.init(style: .default, reuseIdentifier: Self.cellIdentifier)
    self.theme = theme
    instantiateUIElements()
  }


  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    instantiateUIElements()
  }
  
  
  // MARK: Acccessors

  
  /// respond to dark/light mode updates
  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)
    updateView()
  }


  /// respond to layout changes
  public override func layoutSubviews() {
    super.layoutSubviews()
    updateView()
  }


  override public func update(theme: W3WTheme?) {
    apply(theme: theme, set: .cells)
    update(with: .cells)
  }

  
}



//apply(theme: theme)
//
//if let colorSet = theme?.colors?[.cells] {
//  textLabel?.attributedText = W3WString(suggestion?.words ?? "", color: colorSet.foreground).withSlashes(color: colorSet.brand ?? .red).asAttributedString()
//
//  detailTextLabel?.text = suggestion?.nearestPlace
//  detailTextLabel?.textColor = colorSet.secondary?.current.uiColor
//}


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
