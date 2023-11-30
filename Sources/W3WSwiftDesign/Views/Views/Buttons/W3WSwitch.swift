//
//  File.swift
//  
//
//  Created by Dave Duprey on 30/11/2023.
//

import UIKit


public class W3WSwitch: UISwitch, W3WViewProtocol {
  
  public var onTap: (Bool) -> () = { _ in }
  
  public var scheme: W3WScheme?
  public var position: W3WViewPosition?

  
  public init(scheme: W3WScheme? = nil, position: W3WViewPosition? = nil, onTap: @escaping (Bool) -> () = { _ in }) {
    super.init(frame: .w3wWhatever)
    set(scheme: scheme)
    addTarget(self, action: #selector(onSwitchValueChanged(_:)), for: .valueChanged)
  }

  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  

   @objc private func onSwitchValueChanged(_ theSwitch: UISwitch) {
     onTap(theSwitch.isOn)
  }
  
  
  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    updateView()
  }
  
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    updateView()
  }

  
  public func update(scheme: W3WScheme?) {
    apply(scheme: scheme)
  }

  
}
