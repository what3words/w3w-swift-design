//
//  File.swift
//  
//
//  Created by Dave Duprey on 18/08/2023.
//

import UIKit


public class W3WHeaderCell: W3WPaddedView {
  
  public var label: W3WLabel? { get { wrappedView as? W3WLabel } }
  
  public init(text: String, height: W3WRowHeight, theme: W3WTheme? = nil) {
    let wrapperTheme = W3WTheme(base:W3WScheme(), cells: W3WScheme(colors: W3WColors(background: theme?[.cells]?.colors?.header?.background)))
    
    let labelTheme = theme?.with(background: .clear, into: .labels)
    let labelText  = W3WString(text, color: theme?[.cells]?.colors?.header?.foreground)
    
    super.init(view: W3WLabel(text: labelText, fontStyle: .caption1, theme: labelTheme), theme: wrapperTheme)
    
    // set the height of the frame
    frame = CGRect(origin: frame.origin, size: CGSize(width: frame.width, height: height.value))
  }
  
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  
  
}


//  override public func update(theme: W3WTheme?) {
//    backgroundColor = theme?.colors?[.cells].header?.background?.current.uiColor //.withAlphaComponent(1.0)
//  }


  //let headerTheme = W3WTheme(colors: W3WlColors(background: theme?.colors?[.cells].header?.background), style: theme?.styles)
  //    theme?.copy(from: .cells, to: .labels)
  //      .with(background: .clear, into: .labels)
  //      .with(foreground: theme?.colors?[.cells].header?.foreground, into: .labels)
  //
  //    let wrapperTheme = theme?.copy(from: .cells, to: .labels)
  //      .with(background: theme?.colors?[.cells].header?.background)

  //  override public func update(theme: W3WTheme?) {
//    apply(theme: theme, set: .cells)
//    //apply(style: theme?.styles?[.cells])
//    //label?.update(fonts: theme?.styles?[.labels].fonts)
//
//    //why is this the wrong color? should be Septenary Fill, says it's Septenary Fill, but shows a light blue;
//    print("::", theme?.colors?[.cells].header?.background?.description)
//    //backgroundColor = theme?.colors?[.cells].header?.background?.current.uiColor
//    //backgroundColor = .orange
//
//    //label?.backgroundColor = .clear
//    //label?.textColor = theme?.colors?[.cells].header?.foreground?.current.uiColor
//    //label?.font = theme?.styles?[.cells].fonts?.caption1
//  }
  
