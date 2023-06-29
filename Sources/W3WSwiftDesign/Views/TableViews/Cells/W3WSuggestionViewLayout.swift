////
////  File.swift
////  
////
////  Created by Dave Duprey on 04/05/2021.
////
//#if !os(macOS) && !os(watchOS)
//
//import UIKit
//import MapKit
//import W3WSwiftCore
//
//
//enum LayoutMode {
//  case vertical
//  case horizontal
//}
//
//
//public protocol W3WSuggestionViewLayoutProtocol : UIView, W3WViewProtocol, W3WViewManagerProtocol {
//  
//  var design: W3WDesign? { get set }
//  
//  var position: W3WViewPosition? { get set }
//
//  var suggestion: W3WSuggestion? { get set }
//  
//  var highlight: Bool { get set }
//  
//  var disableDarkmode: Bool { get set }
//  
//  var wordsLabel: W3WLabel? { get set }
//  
//  var nearestPlaceLabel: W3WLabel? { get set }
//  
//  var distanceLabel: W3WLabel? { get set }
//  
//}
//
//
///// functions for W3WSuggestionViewProtocol that display a three word address, such as W3WSuggestionTableViewCell and W3WSuggestionView
//extension W3WSuggestionViewLayoutProtocol {
//  
//  /// set up the UI stuff
//  func instantiateUIElements() {
//    
//    parentView = self
//    
//    wordsLabel = W3WLabel(design: design)
//    add(view: wordsLabel!, position: .place(topOf: self))
//    
//    nearestPlaceLabel = W3WLabel(design: design)
//    add(view: nearestPlaceLabel!, position: .place(below: wordsLabel!))
//    
//    distanceLabel = W3WLabel(design: design)
//    add(view: distanceLabel!, position: .place(below: nearestPlaceLabel!))
//  }
//  
//    
//  // MARK: Accessors
//  
//  var mode: LayoutMode {
//    get {
//      return .horizontal
//    }
//  }
//  
//  
//  /// assign the three words values to the UI elecments
//  public func set(suggestion: W3WSuggestion?) {
//    self.suggestion = suggestion
//    updateLabels()
//    design?.update(view: self)
//  }
//
//  
//  /// update labels
//  func updateLabels() {
//    DispatchQueue.main.async { [unowned self] in
//      if self.wordsLabel == nil {
//        self.instantiateUIElements()
//      }
//      
//      if let suggestion = self.suggestion {
//        self.wordsLabel?.attributedText = W3WString(suggestion.words ?? "").withSlashes(color: design?.colors?.findTint() ?? .slash).asAttributedString()
//        self.nearestPlaceLabel?.text = suggestion.nearestPlace
//        self.distanceLabel?.text = suggestion.distanceToFocus?.description
//      }
//    }
//  }
//
//  
//}
//
//
//
///// layout and UI code for UIViews that display a three word address, such as W3WSuggestionTableViewCell and W3WSuggestionView
//public protocol W3WSuggestionViewLayout : UIView {
//  
//  // MARK: Vars
//  
//  /// colors
//  var colors: W3WColorScheme { get set }
//  
//  /// the three word address to display
//  var suggestion: W3WSuggestion?  { get set }
//
//  /// indicates if this one should stand out from the rest
//  var highlight: Bool { get set }
//  
//  /// indicates if we should ignore darkmode
//  var disableDarkmode: Bool { get set }
//
//  /// called when the dispaly colours should change, ei, light/dark mode
//  func updateColors()
//
//  /// the UI elements
//  var wordsLabel: UILabel? { get set }
//  var nearestPlaceLabel: UILabel? { get set }
//  var distanceLabel: UILabel? { get set }
//}
// 
//
///// functions for W3WSuggestionViewProtocol that display a three word address, such as W3WSuggestionTableViewCell and W3WSuggestionView
//extension W3WSuggestionViewLayout {
//
//  
//  // MARK: Init
//  
//  
//  /// set up the UI stuff
//  func instantiateUIElements() {
//    
//    wordsLabel = UILabel()
//    wordsLabel?.backgroundColor = .clear
//    if let l = wordsLabel {
//      addSubview(l)
//    }
//    
//    nearestPlaceLabel = UILabel()
//    if let p = nearestPlaceLabel {
//      addSubview(p)
//    }
//    
//    distanceLabel = UILabel()
//    if let d = distanceLabel {
//      addSubview(d)
//    }
//    
//    updateColors()
//    arrangeViews()
//  }
//  
//  
//  
//  public func updateColors() {
//    DispatchQueue.main.async {
//      
//      if let c = self.colors.foreground {
//        self.wordsLabel?.textColor = c.current.uiColor
//      }
//      self.wordsLabel?.attributedText = W3WString(self.suggestion?.words ?? "", color: self.colors.foreground).withSlashes().asAttributedString()
//
//      if let c = self.colors.secondary {
//        self.nearestPlaceLabel?.textColor = c.current.uiColor
//      }
//      self.nearestPlaceLabel?.backgroundColor = .clear
//      if let c = self.colors.secondary {
//        self.distanceLabel?.textColor = c.current.uiColor
//      }
//      self.distanceLabel?.backgroundColor = .clear
//      
//      if let cell = self as? UITableViewCell {
//        cell.setHighlighted(self.highlight, animated: true)
//        //cell.selectedBackgroundView?.backgroundColor = self.highlight ? self.colors.highlight.current.uiColor : self.colors.background.current.uiColor
//        
//        //let cellBackground = UIView()
//        //cellBackground.backgroundColor = self.highlight ? self.colors.highlight.current.uiColor : self.colors.background.current.uiColor
//        //cell.selectedBackgroundView = cellBackground
//        
//        if self.highlight {
//          if let c = self.colors.highlight?.background {
//            cell.selectedBackgroundView?.backgroundColor = c.current.uiColor
//          }
//        } else {
//          if let c = self.colors.background {
//            cell.selectedBackgroundView?.backgroundColor = c.current.uiColor
//          }
//        }
//
//        if let c = self.colors.border {
//          cell.selectedBackgroundView?.layer.borderColor = c.current.cgColor
//        }
//
//      // else this is not a UITableViewCell
//      } else {
//        if self.highlight {
//          if let c = self.colors.highlight?.background {
//            self.backgroundColor = c.current.uiColor
//          }
//        } else {
//          if let c = self.colors.background {
//            self.backgroundColor = c.current.uiColor
//          }
//        }
////
////        if self.highlight {
////          self.backgroundColor = self.colors.highlight.background.current.uiColor
////        } else {
////          self.backgroundColor = self.colors.background.current.uiColor
////        }
//      }
//    }
//  }
//  
//  
//
//  
//  
//  // MARK: Accessors
//
//  
//  /// assign the three words values to the UI elecments
//  public func set(suggestion: W3WSuggestion) {
//    self.suggestion = suggestion
//    updateLabels()
//  }
//  
//  
//  /// update labels
//  func updateLabels() {
//    DispatchQueue.main.async {
//      if self.wordsLabel == nil {
//        self.instantiateUIElements()
//      }
//
//      if let suggestion = self.suggestion {
//        self.wordsLabel?.attributedText = self.slashify(words: suggestion.words)
//        
//        self.nearestPlaceLabel?.text = suggestion.nearestPlace
//        
//        if let d = suggestion.distanceToFocus {
//          self.distanceLabel?.text = self.distanceAsString(meters: d.meters)
//        } else {
//          self.distanceLabel?.text = nil
//        }
//      }
//      self.updateColors()
//      self.arrangeViews()
//    }
//  }
//
//  
//  /// set if this one should stand out from the rest
//  public func set(highlight: Bool) {
//    self.highlight = highlight
//    updateColors()
//  }
//  
//  
//  /// this set whether cells are set to ignore dark mode.
//  /// this maybe shouldn't be here either, see notes in tableview section
//  public func set(darkModeSupport: Bool) {
//    disableDarkmode = !darkModeSupport
//    updateColors()
//  }
//  
//  
// 
//  
//  // MARK: Util
//  
//
//  func slashify(words: String?) -> NSAttributedString {
//    //let slashAttributes: [NSAttributedString.Key: Any] =
//    let slashColor = self.colors.tint ?? W3WColor.slash
//    let slashes = NSMutableAttributedString(string: "///", attributes: [.foregroundColor: slashColor.current.cgColor, .font: UIFont.systemFont(ofSize: wordsTextHeight())])
//    let formattedAddress = NSMutableAttributedString(string: words ?? "", attributes: [.font: UIFont.systemFont(ofSize: wordsTextHeight())])
//    slashes.append(formattedAddress)
//
//    return slashes
//  }
//  
//  
//  func distanceAsString(meters: Double) -> String {
//    var distance = ""
//    
//    let formatter = MKDistanceFormatter()
//    formatter.unitStyle = .abbreviated
//    
//    // note: W3WSettings.measurement might be .userPreference, in which case formatter.units is let to it's default
//    if #available(iOS 10.0, *) {
//      if NSLocale().usesMetricSystem == true {
//        formatter.units = .metric
//      } else {
//        formatter.units = .imperial
//      }
//    } else {
//      formatter.units = .metric
//    }
//    
//    distance = formatter.string(fromDistance: meters)
//    
//    return distance
//  }
//  
//  
//  // MARK: Geometry
//
//  
//  
//  /// lays out the UI elements, depending on how much info is present
//  func arrangeViews() {
//    DispatchQueue.main.async {
//      // if no suggestion, or no words
//      if self.suggestion == nil || (self.suggestion?.words?.isEmpty ?? false) || self.suggestion?.words == nil {
//        self.layoutEmpty()
//        
//        // if there are words
//      } else {
//        self.layoutContent()
//      }
//    }
//  }
//  
//
//  /// layout for suggestions with nothing in them.  Shows a dashed line
//  func layoutEmpty() {
//    
//    let space  = spacing()
//    let lead   = leadingSpace()
//    let height = wordsLabelHeight()
//    
//    DispatchQueue.main.async {
//      self.wordsLabel?.attributedText = NSAttributedString(string: "---.---.---")
//      self.wordsLabel?.sizeToFit()
//      
//      if W3WSettings.leftToRight {
//        self.wordsLabel?.frame = CGRect(x: lead, y: (self.frame.height - height) / 2.0, width: self.frame.size.width - space, height: height)
//      } else {
//        self.wordsLabel?.frame = CGRect(x: self.frame.size.width - lead - (self.wordsLabel?.frame.width ?? 0.0), y: (self.frame.height - height) / 2.0, width: self.frame.size.width - space, height: height)
//      }
//      
//      // hide the others
//      self.nearestPlaceLabel?.isHidden = true
//      self.distanceLabel?.isHidden = true
//    }
//  }
//  
//  
//  /// layout the elements
//  func layoutContent() {
//    if (suggestion?.nearestPlace?.count ?? 0) > 0 || suggestion?.distanceToFocus != nil || suggestion?.country?.code.uppercased() == "ZZ"  {
//      layoutForTwoLinesOfText()
//    } else {
//      layoutForOneLineOfText()
//    }
//  }
//  
//  
//  /// layout for a suggestion only showing an address
//  func layoutForOneLineOfText() {
//    //let space  = spacing()
//    let lead   = leadingSpace()
//    let height = wordsLabelHeight()
//    
//    if W3WSettings.leftToRight {
//      wordsLabel?.textAlignment = .left
//    } else {
//      wordsLabel?.textAlignment = .right
//    }
//    
//    wordsLabel?.frame = CGRect(x: lead, y: (frame.height - height) / 2.0, width: frame.size.width - lead * 2.0, height: height)
//    if let words = suggestion?.words {
//      //wordsLabel?.text = words
//      wordsLabel?.attributedText = slashify(words: words)
//    }
//  }
//  
//  
//  /// layout for a suggestion showing an address and a nearest place
//  func layoutForTwoLinesOfText() {
//    let space     = spacing()
//    let lead       = leadingSpace()
//    let inset       = lineInset()
//    let height       = wordsLabelHeight()
//    let secondHeight  = descriptionLabelHeight()
//    let internalSpace  = internalSpacing()
//    
//    if W3WSettings.leftToRight {
//      wordsLabel?.textAlignment = .left
//      nearestPlaceLabel?.textAlignment = .left
//    } else {
//      wordsLabel?.textAlignment = .right
//      nearestPlaceLabel?.textAlignment = .right
//    }
//    
//    var lineWidth = frame.size.width - lead * 2.0
//    
//    wordsLabel?.frame = CGRect(x: lead, y: space, width: lineWidth, height: height)
//    if let words = suggestion?.words {
//      wordsLabel?.attributedText = slashify(words: words)
//    }
//    
//    let y = space + height + internalSpace
//    
//    if suggestion?.distanceToFocus != nil {
//      distanceLabel?.font = wordsLabel?.font.withSize(descriptionTextHeight())
//      distanceLabel?.sizeToFit()
//      if W3WSettings.leftToRight {
//        distanceLabel?.frame = CGRect(x: frame.width - (distanceLabel?.frame.width ?? 0.0) - space, y: y, width: (distanceLabel?.frame.width ?? 0.0), height: secondHeight)
//      } else {
//        distanceLabel?.frame = CGRect(x: space, y: y, width: (distanceLabel?.frame.width ?? 0.0), height: secondHeight)
//      }
//      distanceLabel?.isHidden = false
//      lineWidth = lineWidth - (distanceLabel?.frame.width ?? 0.0)
//    }
//    
//    if suggestion?.nearestPlace != nil {
//      // get the same font as used by the address, but the regular version of it
//      if let font = wordsLabel?.font {
//        let descriptor = font.fontDescriptor.addingAttributes([.traits: [UIFontDescriptor.TraitKey.weight: UIFont.Weight.regular]])
//        nearestPlaceLabel?.font = UIFont(descriptor: descriptor, size: descriptionTextHeight())
//      }
//      nearestPlaceLabel?.sizeToFit()
//      if W3WSettings.leftToRight {
//        nearestPlaceLabel?.frame = CGRect(x: inset, y: y, width: frame.width - inset - space - internalSpace - (distanceLabel?.frame.width ?? 0.0), height: secondHeight)
//      } else {
//        nearestPlaceLabel?.frame = CGRect(x: (distanceLabel?.frame.maxX ?? space) + space, y: y, width: frame.width - inset - space * 1.75 - internalSpace - (distanceLabel?.frame.width ?? 0.0), height: secondHeight)
//      }
//      nearestPlaceLabel?.isHidden = false
//    }
//    
//  }
//  
//  // MARK: spacing calulations
//  
//  func wordsTextHeight()        -> CGFloat { return frame.size.height * (17.0 / 72.0) }
//  func descriptionTextHeight()  -> CGFloat { return frame.size.height * (13.0 / 72.0) }
//  func wordsLabelHeight()       -> CGFloat { return frame.size.height * (22.0 / 72.0) }
//  func descriptionLabelHeight() -> CGFloat { return frame.size.height * (18.0 / 72.0) }
//  func spacing()                -> CGFloat { return frame.size.height * (15.0 / 72.0) }
//  func leadingSpace()           -> CGFloat { return spacing() * 1.5 }
//  func internalSpacing()        -> CGFloat { return spacing() / 3.0 }
//  func lineInset()              -> CGFloat { return spacing() * 2.8 }
//
//}
//
//
//
//#endif
