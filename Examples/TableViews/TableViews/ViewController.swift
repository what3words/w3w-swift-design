//
//  ViewController.swift
//  TableViews
//
//  Created by Dave Duprey on 29/10/2023.
//

import UIKit
import W3WSwiftCore
import W3WSwiftDesign


class ViewController: W3WTableViewController<String, UITableViewCell> {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // the tableview is already managed as locked to the window edges, `manageFrame` defaults to false meaning the size of the tableview will be managed by a W3WViewPosition and freeform
    self.manageFrame = false
    
    // add the items to the table
    self.set(items: ["First Row", "Second Row", "Third Row", "Forth Row", "Fifth Row"])
  }


  // configure cells, this is the only function that needs overriding to set up a W3WTableViewController
  public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = getReusableCell(indexPath: indexPath)
    cell.textLabel?.text = getItem(at: indexPath)
    
    return cell
  }

}

