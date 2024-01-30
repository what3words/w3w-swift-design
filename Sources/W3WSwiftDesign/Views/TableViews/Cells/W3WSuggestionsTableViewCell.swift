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
  public lazy var addressLabel: W3WLabel = {
    let label = W3WLabel(fontStyle: .body)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  
  public lazy var distanceLabel: W3WLabel = {
    let label = W3WLabel(fontStyle: .caption1)
    label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  
  public lazy var placeDetailLabel: W3WLabel = {
    let label = W3WLabel(fontStyle: .footnote)
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
    updateUI()
  }
  
  
  override public init(scheme: W3WScheme? = nil) {
    super.init(style: .default, reuseIdentifier: Self.cellIdentifier)
    self.scheme = scheme
    updateUI()
  }
  
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    updateUI()
  }
  
  
  /// assign the three words values to the UI elecments
  public func set(suggestion: W3WSuggestion?) {
    self.suggestion = suggestion
    updateLabels()
  }
  
  
  private func updateLabels() {
    // if there is colour information we use marked up text for the title, and colour everything
    
    let addressText = suggestion?.words ?? ""
    let placeDetailText = suggestion?.nearestPlace ?? ""
    var distanceText = ""
    if let distance = suggestion?.distanceToFocus {
      distanceText = String(describing: distance)
    }
    
    if let colors = scheme?.colors, let fonts = scheme?.styles?.fonts {
      addressLabel.attributedText     = W3WString(addressText, color: colors.foreground, font: fonts.body).withSlashes(color: colors.brand ?? .red).asAttributedString()
      placeDetailLabel.attributedText = W3WString(placeDetailText, color: colors.secondary, font: fonts.caption1).asAttributedString()
      distanceLabel.attributedText    = W3WString(distanceText, color: colors.secondary, font: fonts.footnote).asAttributedString()
      addressLabel.backgroundColor = colors.background?.uiColor
      placeDetailLabel.backgroundColor = colors.background?.uiColor
      distanceLabel.backgroundColor = colors.background?.uiColor
    } else {
      addressLabel.attributedText     = W3WString(stringLiteral: addressText).asAttributedString()
      placeDetailLabel.attributedText = W3WString(stringLiteral: placeDetailText).asAttributedString()
      distanceLabel.attributedText    = W3WString(stringLiteral: distanceText).asAttributedString()
    }
    
    updateSemantic()
    setConstraints()
  }
  
  private func updateUI() {
    updateLabels()
    backgroundColor = scheme?.colors?.background?.current.uiColor
    contentView.backgroundColor = scheme?.colors?.background?.current.uiColor
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
    updateUI()
  }
  
  
  open override func prepareForReuse() {
    super.prepareForReuse()
    distanceLabel.attributedText = nil
    addressLabel.attributedText = nil
    placeDetailLabel.attributedText = nil
    
    distanceLabel.text = nil
    addressLabel.text = nil
    placeDetailLabel.text = nil
  }
}
