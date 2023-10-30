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
  
  
  override public init(scheme: W3WScheme? = nil) {
    super.init(style: .default, reuseIdentifier: Self.cellIdentifier)
    self.scheme = scheme
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


  override public func update(scheme: W3WScheme?) {
    apply(scheme: scheme, set: .cells)
    update(with: .cells)
  }

}
