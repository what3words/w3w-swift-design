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

  public weak var parentView: UIView? { get { self } set { } }
  
  public var managedViews = [W3WViewProtocol]()

  // MARK: Views
  public lazy var addressLabel: UILabel = {
    let label = UILabel()
    label.font = scheme?.styles?.fonts?.body
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  
  public lazy var distanceLabel: UILabel = {
    let label = UILabel()
    label.font = scheme?.styles?.fonts?.footnote
    label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  
  public lazy var placeDetailLabel: UILabel = {
    let label = UILabel()
    label.font = scheme?.styles?.fonts?.footnote
    label.setContentHuggingPriority(.defaultLow, for: .horizontal)
    label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    label.lineBreakMode = .byTruncatingTail
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  
  public lazy var mainStackView: W3WStackView = {
    let stackView = W3WStackView()
    stackView.axis = .vertical
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  
  public lazy var footNoteStackView: W3WStackView = {
    let stackView = W3WStackView()
    stackView.axis = .horizontal
    if W3WSettings.leftToRight {
      stackView.alignment = .trailing
    } else {
      stackView.alignment = .leading
    }
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
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
    // if there is colour information we use marked up text for the title, and colour everything
    if let colors = scheme?.colors ?? W3WTheme.standard[.base]?.colors,
       let fonts = scheme?.styles?.fonts ?? W3WTheme.standard[.base]?.styles?.fonts {
      addressLabel.attributedText    = W3WString(suggestion?.words ?? "", color: colors.foreground, font: fonts.body)
        .withSlashes(color: colors.brand ?? .red).asAttributedString()
      placeDetailLabel.textColor     = colors.secondary?.current.uiColor
      placeDetailLabel.font          = fonts.footnote
      
      distanceLabel.textColor        = colors.secondary?.current.uiColor
      distanceLabel.font             = fonts.footnote
      
      // absent colour info, we use plain text
    } else {
      addressLabel.text = suggestion?.words ?? ""
    }
    
    placeDetailLabel.text = suggestion?.nearestPlace
    
    if let distance = suggestion?.distanceToFocus {
      distanceLabel.text = String(describing: distance)
    } else {
      distanceLabel.text = ""
    }
    
    updateSemantic()
    setConstraints()
  }
  
  private func setConstraints() {
    let padding = scheme?.styles?.padding?.value ?? 0
    
    if W3WSettings.leftToRight {
      footNoteStackView.addArrangedSubview(placeDetailLabel)
      footNoteStackView.addArrangedSubview(distanceLabel)
    } else {
      footNoteStackView.addArrangedSubview(distanceLabel)
      footNoteStackView.addArrangedSubview(placeDetailLabel)
    }
    
    mainStackView.addArrangedSubview(addressLabel)
    mainStackView.addArrangedSubview(footNoteStackView)
    contentView.addSubview(mainStackView)
    
    NSLayoutConstraint.activate([
      mainStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
    ])
    
    // Update spacing if padding = 0
    if padding > 0 {
      NSLayoutConstraint.activate([
        mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
        mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
      ])
      mainStackView.spacing = padding / 2.0
    }
  }
  
  // Update schematic for labels
  private func updateSemantic() {
    let semanticContent: UISemanticContentAttribute = W3WSettings.leftToRight ? .forceLeftToRight : .forceRightToLeft
    
    self.semanticContentAttribute = semanticContent
    addressLabel.semanticContentAttribute = semanticContent
    distanceLabel.semanticContentAttribute = semanticContent
    placeDetailLabel.semanticContentAttribute = semanticContent
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
  
  
  open override func prepareForReuse() {
    super.prepareForReuse()
    distanceLabel.text = nil
    addressLabel.text = nil
    placeDetailLabel.text = nil
  }
}
