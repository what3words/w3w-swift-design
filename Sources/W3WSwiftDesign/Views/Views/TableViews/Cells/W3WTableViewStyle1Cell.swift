//
//  File.swift
//
//
//  Created by Dave Duprey on 10/07/2023.
//

import UIKit


public class W3WTableViewStyle1Cell: W3WTableViewCell {
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: .value1, reuseIdentifier: reuseIdentifier)
    set(scheme: scheme, position: position)
  }
  
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
}
