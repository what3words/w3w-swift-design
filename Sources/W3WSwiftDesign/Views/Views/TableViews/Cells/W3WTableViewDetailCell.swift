//
//  File.swift
//  
//
//  Created by Dave Duprey on 03/05/2023.
//

import UIKit


public class W3WTableViewDetailCell: W3WTableViewCell {
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    set(theme: theme, position: position)
  }

  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  
  
  public override func update(theme: W3WTheme?) {
    apply(theme: theme)
    
    textLabel?.textColor       = theme?[.cells]?.colors?.foreground?.current.uiColor
    detailTextLabel?.textColor = theme?[.cells]?.colors?.secondary?.current.uiColor
  }
  
}
