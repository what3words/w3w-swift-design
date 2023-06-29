////
////  File.swift
////  
////
////  Created by Dave Duprey on 19/05/2022.
////
//
//import UIKit
//import W3WSwiftCore
//
//
///// A UITableViewController derived class for showing what3words addresses
//public class W3WSuggestionsTableViewController: W3WTableViewController<W3WSuggestion, W3WSuggestionsTableViewCell> {
//
//  var colors: W3WColorScheme = .blackGrayRedScheme.with(highlight: W3WBaseColors(foreground: .text, background: W3WColor(light: .powderBlue, dark: .offDarkGrey)))
//  
//  public var highlight3waMatching: String?
//  
//  /// set the colours for this view
//  public func set(colors: W3WColorScheme) {
//    self.colors = colors
//    
//    for cell in tableView.visibleCells {
//      if let suggestionCell = cell as? W3WSuggestionsTableViewCell {
//        suggestionCell.set(colors: colors)
//      }
//    }
//  }
//
//  
//  /// make a table view cell for a new row
//  public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cell = getReusableCell(indexPath: indexPath)
//    
//    if let suggestion = getItem(at: indexPath) {
//      cell.set(suggestion: suggestion)
//      cell.set(colors: colors)
//      cell.set(highlight: suggestion.words?.lowercased() == highlight3waMatching?.lowercased())
//    }
//    
//    return cell
//  }
//  
//}
