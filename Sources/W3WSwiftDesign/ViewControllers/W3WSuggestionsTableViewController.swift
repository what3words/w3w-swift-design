//
//  File.swift
//  
//
//  Created by Dave Duprey on 19/05/2022.
//

import UIKit
import W3WSwiftCore
import W3WSwiftThemes


public class W3WSuggestionsTableViewController: W3WTableViewController<W3WSuggestion, W3WSuggestionsTableViewCell> {
  
  public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = getReusableCell(indexPath: indexPath)
    cell.set(suggestion: getItem(at: indexPath))
    cell.set(scheme: theme?[.cells])
    
    return cell
  }
  
  public override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
}
