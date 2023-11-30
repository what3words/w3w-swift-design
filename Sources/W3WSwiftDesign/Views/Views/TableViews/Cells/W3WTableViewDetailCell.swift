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
    set(scheme: scheme, position: position)
  }

  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
  }


}
