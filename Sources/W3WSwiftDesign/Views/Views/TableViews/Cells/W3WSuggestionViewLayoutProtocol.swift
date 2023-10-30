//
//  W3WSuggestionViewLayoutProtocol.swift
//
//
//  Created by Dave Duprey on 04/05/2021.
//
#if !os(macOS) && !os(watchOS)

import UIKit
import MapKit
import W3WSwiftCore

#if canImport(w3w)
import w3w
#endif


enum LayoutMode {
  case vertical
  case horizontal
}


public protocol W3WSuggestionViewLayoutProtocol : UIView, W3WViewProtocol, W3WViewManagerProtocol {

  // MARK: suggestion
  
  var suggestion: W3WSuggestion? { get set }
  
  // MARK: UI vars
  
  var scheme: W3WScheme? { get set }
  
  var position: W3WViewPosition? { get set }

  var wordsLabel: W3WLabel? { get set }

  var nearestPlaceLabel: W3WLabel? { get set }

  var distanceLabel: W3WLabel? { get set }

}
  

/// functions for W3WSuggestionViewProtocol that display a three word address, such as W3WSuggestionTableViewCell and W3WSuggestionView
extension W3WSuggestionViewLayoutProtocol {

  /// set up the UI stuff
  func instantiateUIElements() {

    parentView = self

    wordsLabel = W3WLabel(fontStyle: .body, scheme: scheme)
    add(view: wordsLabel!, position: wordsPosition)

    nearestPlaceLabel = W3WLabel(fontStyle: .caption1, scheme: scheme)
    add(view: nearestPlaceLabel!, position: .place(below: wordsLabel!, margin: spacing(), height: descriptionLabelHeight()))

    distanceLabel = W3WLabel(fontStyle: .caption1, scheme: scheme)
    //add(view: distanceLabel!, position: .place(rightOf: nearestPlaceLabel!))
  }

  
  /// assign the three words values to the UI elecments
  public func set(suggestion: W3WSuggestion?) {
    self.suggestion = suggestion
    updateView()
  }
  
  
  /// override to allow SDK to work with this library
#if canImport(w3w)
  func set(suggestion: W3WSdkSuggestion?) {
    let s = suggestion?.asBaseSuggestion()
    set(suggestion: s)
  }
#endif
  
  
  func update(with: W3WSetTypes = .cells) {
    
    // if there is colour information we use marked up text for the title, and colour everything
    if let colors = scheme?.colors ?? W3WTheme.standard[.base]?.colors {
      wordsLabel?.attributedText    = W3WString(suggestion?.words ?? "", color: colors.foreground).withSlashes(color: colors.brand ?? .red).asAttributedString()
      nearestPlaceLabel?.textColor  = colors.secondary?.current.uiColor
      distanceLabel?.textColor      = colors.secondary?.current.uiColor

    // absent colour info, we use plain text
    } else {
      wordsLabel?.text = suggestion?.words ?? ""
    }
    
    nearestPlaceLabel?.text = suggestion?.nearestPlace
    
    if let distance = suggestion?.distanceToFocus {
      distanceLabel?.text = String(describing: distance)
    } else {
      distanceLabel?.text = ""
    }
  }

  
  func wordsPosition(parent: UIView?, this: W3WViewProtocol) -> CGRect {
    let padding = scheme?.styles?.padding?.value ?? W3WPadding.medium.value
    let width = (parent?.frame.width ?? this.frame.width) - 2.0 * padding
    return CGRect(
      x: padding,
      y: padding,
      width: width,
      height: wordsTextHeight()
    )
  }
  
  
  // MARK: spacing calulations

  func wordsTextHeight()        -> CGFloat { return frame.size.height * (17.0 / 72.0) }
  func descriptionLabelHeight() -> CGFloat { return frame.size.height * (18.0 / 72.0) }
  func spacing()                -> CGFloat { return frame.size.height * (15.0 / 72.0) }
  
}

#endif
