//
//  File.swift
//
//
//  Created by Dave Duprey on 22/05/2022.
//

import UIKit
import W3WSwiftCore
import W3WSwiftThemes


/// a table VC that allows the adding of modular 'cell providers'
/// to allow multiple data sources.
open class W3WMultiSourceTableViewController: UITableViewController {
  
  // MARK: Vars
  
  public var onNewData: () -> () = { }
  
  // callback for errors
  public var onError: W3WErrorResponse = { _ in }
  
  var providers = [W3WTableCellProviderProtocol]()
  
  /// if true then this manages it's own height
  public var manageFrame = true
  
  /// theme to use for the table
  public var theme: W3WTheme?
  
  /// the height of each row
  public var rowHeight = W3WRowHeight.large.value
  
  /// the time for an amnimation, in seconds
  public var animationSpeed: CGFloat? = nil
  
  /// the maximum number of cells to show in the view before scrolling happens
  public var maxCellsShowing: CGFloat? = nil
  
  
  public init(theme: W3WTheme? = nil, style: UITableView.Style = .plain) {
    super.init(style: style)
    self.theme = theme
  }
  
  
  public init() {
    super.init(style: .plain)
  }
  
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  
  override open func loadView() {
    self.view = W3WTableView(scheme: theme?[.cells])
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
    
    // prevent extra space around section headers
    if #available(iOS 15.0, *) {
      tableView.sectionHeaderTopPadding = 0
    }
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

    cellProvider.onNewData() { [weak self] in
      self?.onNewData()
    }
    
    cellProvider.onError() { [weak self] error in
      self?.onError(error)
    }

  }
  
 
  public func getCellCount() -> Int {
    var itemCount = 0
    
    for cellProvider in self.providers {
      itemCount += cellProvider.getCellCount()
    }
    
    return itemCount
  }
    
  
  // MARK: Geometry
  
  
  public func getIdealHeight() -> CGFloat {
    tableView.layoutIfNeeded()
    return tableView.contentSize.height
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

  
  /// get section header title if any
  public override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    return providers[section].getSectionHeaderView()
  }
  
  
  override open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    if providers[section].getCellCount() == 0 {
      return 0.0
    } else {
      return providers[section].getSectionHeaderView()?.frame.height ?? 0.0
    }
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
