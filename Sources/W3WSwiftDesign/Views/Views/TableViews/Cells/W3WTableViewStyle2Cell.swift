//
//  File.swift
//  
//
//  Created by Dave Duprey on 10/07/2023.
//

import UIKit


public class W3WTableViewStyle2Cell: W3WTableViewCell {
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: .value2, reuseIdentifier: reuseIdentifier)
    set(theme: theme, position: position)
  }
  
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  
}
