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
  
  
  public init(scheme: W3WScheme) {
    super.init(style: .subtitle, reuseIdentifier: Self.cellIdentifier)
    self.scheme = scheme

    set(image: W3WIconView(drawing: .ocr))
    
  }
  
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  
  // MARK: Acccessors
  
  
  /// sets the row view to the values provided
  public func set(title: String?, subTitle: String?, disclosureIndicator: Bool = false) {
    self.title = title
    self.subTitle = subTitle

    updateLabels()
    updateView()
  }
  
  
  /// update labels
  func updateLabels() {
    textLabel?.text = title
    detailTextLabel?.text = subTitle
  }
    
  
  /// respond to dark/light mode updates
  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)
    updateView()
  }
  
  
  /// respond to layout changes
  public override func layoutSubviews() {
    super.layoutSubviews()
    updateLabels()
    updateView()
  }

}
