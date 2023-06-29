//
//  File.swift
//  
//
//  Created by Dave Duprey on 28/03/2023.
//



/// holds a foreground, background, highlight and secondary colour, sufficient for most interface items' colour needs
public class W3WColorCollection: W3WBaseColors {
  
  public var buttons: W3WColorSet?
  public var textFields: W3WColorSet?
  public var labels: W3WColorSet?
  
  public init(foreground: W3WColor? = nil, background: W3WColor? = nil, buttons: W3WColorSet? = nil, textFields: W3WColorSet? = nil, labels: W3WColorSet? = nil) {
    super.init(foreground: foreground, background: background)
    self.buttons    = buttons
    self.textFields = textFields
    self.labels     = labels
  }
  
  
  /// initialise with a foreground, background, highlight and secondary colour
  public init(base: W3WColorSet?, buttons: W3WColorSet? = nil, textFields: W3WColorSet? = nil, labels: W3WColorSet? = nil) {
    super.init(foreground: base?.foreground, background: base?.background)
    self.buttons    = buttons
    self.textFields = textFields
    self.labels     = labels
  }

  
  public var forTextFields: W3WColorSet {  get { return textFields ?? asColorSet() } }
  public var forButtons:    W3WColorSet {  get { return buttons ?? asColorSet()    } }
  public var forLabels:     W3WColorSet {  get { return labels ?? asColorSet()     } }
    
}
