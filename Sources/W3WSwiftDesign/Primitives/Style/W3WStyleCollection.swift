//
//  W3WStyleCollection.swift
//  
//
//  Created by Dave Duprey on 09/05/2023.
//

import Foundation


public class W3WStyleCollection: W3WStyle {
  
  public var buttons: W3WStyle?
  public var textFields: W3WStyle?
  public var labels: W3WStyle?

  
  public var forTextFields: W3WStyle {  get { return textFields ?? self } }
  public var forButtons:    W3WStyle {  get { return buttons ?? self    } }
  public var forLabels:     W3WStyle {  get { return labels ?? self     } }

  
  init(base: W3WStyle? = nil, buttons: W3WStyle? = nil, textFields: W3WStyle? = nil, labels: W3WStyle? = nil) {
    super.init(style: base)
    self.buttons = buttons
    self.textFields = textFields
    self.labels = labels
  }
  
}
