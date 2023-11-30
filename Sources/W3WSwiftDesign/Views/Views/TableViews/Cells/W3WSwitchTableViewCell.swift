//
//  File.swift
//  
//
//  Created by Dave Duprey on 30/11/2023.
//

import UIKit


public class W3WSwitchTableViewCell: W3WTableViewCell {
  
  lazy var theSwitch = W3WSwitch(scheme: scheme)

  public var onTap: (Bool) -> () {
    set {
      theSwitch.onTap = newValue
    }
    get {
      return theSwitch.onTap
    }
  }

  
  override func configure() {
    theSwitch.position = W3WViewPosition { [weak self] parent,this in
      return CGRect(
        x: self!.frame.width - self!.theSwitch.frame.width - W3WPadding.bold.value,
        y: (self!.frame.height - self!.theSwitch.frame.height) / 2.0,
        width: self!.theSwitch.frame.width,
        height: self!.theSwitch.frame.height)
    }
    contentView.addSubview(theSwitch)
  }

  
}
