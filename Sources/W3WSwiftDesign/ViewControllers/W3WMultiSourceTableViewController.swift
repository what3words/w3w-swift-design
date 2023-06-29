//
//  File.swift
//
//
//  Created by Dave Duprey on 22/05/2022.
//

import UIKit


/// a convenience class overriding UITableViewController taking care
/// of most of the boilerplate.  Allows UITableViewControlellers to
/// be made by pretty much only writing the cellForRowAtIndexPath, and
/// Giving it a row data type and a Cell view type
open class W3WMultiSourceTableViewController: UITableViewController {
  
  // MARK: Vars
  
  public var onNewData: () -> () = { }
  
  /// called when the user selects a suggestion
  //public var onRowSelected: (Any?, IndexPath) -> () = { _,_ in }
  
  var providers = [W3WTableCellProviderProtocol]()
  
  /// if true then this manages it's own height
  public var manageFrame = true
  
  /// the height of each row
  public var rowHeight = W3WRowHeight.large.value
  
  /// message to disply if there are no rows
  //var noResultsMessage: String?
  
  /// the label to show when there are no result sin the view
  //var noResultsLabel = UILabel()
  
  /// the time for an amnimation, in seconds
  public var animationSpeed: CGFloat? = nil
  
  /// the maximum number of cells to show in the view before scrolling happens
  public var maxCellsShowing: CGFloat? = nil
  
  
  public init() {
    super.init(style: .plain)
  }
  
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  
  override open func loadView() {
    self.view = W3WTableView()
  }
  
  
  public var w3wTableView: W3WTableView? {
    return self.view as? W3WTableView
  }

  
    
  /// sets up the UI
  override open func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    
    tableView.separatorStyle = .singleLine
    tableView.separatorColor = W3WColor.tertiaryLabel.current.uiColor
    tableView.separatorInset = .zero
  }
  
  
  // MARK: Accessors


  /// pass all the updates down the line
  public func update(text: String) {
    for provider in providers {
      provider.update(text: text)
    }
  }
  
  
  public func add(cellProvider: W3WTableCellProviderProtocol) {
    providers.append(cellProvider)
    self.tableView.register(cellProvider.getCellType(), forCellReuseIdentifier: String(describing: cellProvider.getCellType().self))
    
    for provider in providers {
      provider.onNewData(closure: { [weak self] in self?.onNewData() })
    }
  }
  
  
  
  public func updateFrame(x: CGFloat? = nil, y: CGFloat? = nil, width: CGFloat? = nil, height: CGFloat? = nil) {
    if manageFrame {
      DispatchQueue.main.async {
        if let speed = self.animationSpeed {
          UIView.animate(withDuration: speed, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.1, options: .curveEaseInOut) { () -> Void in
            self.view.frame = self.getFrame(x: x, y: y, width: width, height: height)
          }
        } else {
          self.view.frame = self.getFrame(x: x, y: y, width: width, height: height)
        }
      }
    }
  }
  
  
//  public func set(noResultsMessage: String?) {
//    self.noResultsMessage = noResultsMessage
//  }
  
  
  func getCellCount() -> Int {
    var itemCount = 0
    for cellProvider in self.providers {
      itemCount += cellProvider.getCellCount()
    }
    return itemCount
  }
  
  
//  public func updateNoResultMessage() {
//    DispatchQueue.main.async {
//      self.ensureNoResultLabel()
//
//
//      if let message = self.noResultsMessage, self.getCellCount() == 0 {
//        self.noResultsLabel.text = message
//      } else {
//        self.noResultsLabel.text = nil
//      }
//    }
//  }
  
  
  /// ensure the noResultLabel is present
  /// must be called in main thread
//  func ensureNoResultLabel() {
//    noResultsLabel.textAlignment = .center
//    noResultsLabel.textColor = W3WColor.secondaryDarkGray.current.uiColor
//    tableView.backgroundView = noResultsLabel
//  }
  
  
  public func getIdealHeight() -> CGFloat {
    var count = CGFloat(getCellCount())
    
    if let max = maxCellsShowing {
      if max < count {
        count = max
      }
    }
    
    return rowHeight * count
  }
  
  
  /// Get a frame for the view, and optinally change the origin and width.  Height is always calulated based on content
  func getFrame(x: CGFloat? = nil, y: CGFloat? = nil, width: CGFloat? = nil, height: CGFloat? = nil) -> CGRect {
    return CGRect(x: x ?? self.view.frame.origin.x, y: y ?? self.view.frame.origin.y, width: width ?? self.view.frame.size.width, height: height ?? self.getIdealHeight())
  }
  
  
  public func getItem(at: IndexPath) -> Any? {
    if at.section >= 0 && at.section < providers.count {
      return providers[at.section].getItem(row: at.row)
    } else {
      return nil
    }
  }
  

  // MARK: UITableViewDelegate
  
  
  /// called when the user selects a cell
  override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //onRowSelected(getItem(at: indexPath), indexPath)
    providers[indexPath.section].update(selected: getItem(at: indexPath))
  }
  
  
  /// sets the cell height
  override public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return rowHeight
  }
  
  
  // MARK: UITableViewDataDelegate
  
  
  /// delegate for the tablview
  public override func numberOfSections(in tableView: UITableView) -> Int {
    return providers.count
  }
  
  /// delegate for the tablview
  public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return providers[section].getCellCount()
  }
  
  
  public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellProvider = providers[indexPath.section]
    
    let cell = tableView.dequeueReusableCell(withIdentifier: cellProvider.getCellIdentifier(), for: indexPath)
    
    return cellProvider.update(cell: cell, row: indexPath.row)
  }
  
}
