//
//  File.swift
//  
//
//  Created by Dave Duprey on 22/05/2022.
//

import UIKit
import W3WSwiftThemes


/// a convenience class overriding UITableViewController taking care
/// of most of the boilerplate.  Allows UITableViewControlellers to
/// be made by pretty much only writing the cellForRowAtIndexPath, and
/// Giving it a row data type and a Cell view type
open class W3WTableViewController<RowDataType, CellType>: UITableViewController {

  /// called when the user selects a suggestion
  public var onRowSelected: (RowDataType, IndexPath) -> () = { _,_ in }

  /// design to use for subview
  public var theme: W3WTheme?

  /// indicates whether the `tableView.frame` should be managed by W3WViewPosition or if it will be handled by some other entity
  public var manageFrame = true
  
  /// the store of data for each row
  var items = [RowDataType]()

  /// the height of each row
  public var rowHeight = W3WRowHeight.large.value

  /// the cellIdentifier is the name of the class
  let cellIdentifier:String = String(describing: CellType.self)

  /// message to disply if there are no rows
  var noResultsMessage: String?
  
  var noResultsLabel = UILabel()
  
  public var animationSpeed: CGFloat? = nil
  
  public var maxCellsShowing: CGFloat? = nil
  
  
  public init() {
    super.init(style: .plain)
    registerCell()
  }
  
  
  public init(theme: W3WTheme?) {
    super.init(style: .plain)
    configure(theme: theme)
    registerCell()
  }
  
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    registerCell()
  }

  func configure(theme: W3WTheme? = nil) {
    self.theme = theme
    (view as? W3WTableView)?.set(scheme: theme?[.base])
  }
  
  func registerCell() {
    self.tableView.register(CellType.self as? AnyClass, forCellReuseIdentifier: cellIdentifier)
  }
  
  
  public func getReusableCell(indexPath: IndexPath) -> CellType {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CellType
    
    if let c = cell as? W3WViewProtocol {
      c.set(scheme: theme?[.cells])
    }
    
    return cell
  }
  
  
  override open func loadView() {
    self.view = W3WTableView()
  }
  
  
  public var w3wTableView: W3WTableView? {
    return self.view as? W3WTableView
  }
  
  public lazy var loadingIndicator: UIActivityIndicatorView = {
    let activity = UIActivityIndicatorView()
    activity.hidesWhenStopped = true
    tableView.backgroundView = activity
    return activity
  }()

  
  /// sets up the UI
  override open func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self

    tableView.separatorStyle = .singleLine

    // TODO: W3WDesign this
    tableView.separatorColor = W3WColor.tertiaryLabel.current.uiColor
    //tableView.separatorColor = theme?.colors?.separator?.current.uiColor //W3WColor.tertiaryLabel.current.uiColor

    tableView.separatorInset = .zero
  }

  
  // MARK: Accessors
  
  /// sets the theme
  /// - Parameters:
  ///   - theme: the theme to use
  open func set(theme: W3WTheme?) {
    self.theme = theme
  }
  
  public func startStopLoadingIndicator(start: Bool) {
    start ? loadingIndicator.startAnimating() : loadingIndicator.stopAnimating()
  }
  
  public func getItems() -> [RowDataType] {
    return items
  }
  
  public func set(items: [RowDataType], reload: Bool = true) {
    self.items = items
    updateNoResultMessage()
    if reload {
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
      updateFrame()
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

  
  public func set(noResultsMessage: String?) {
    self.noResultsMessage = noResultsMessage
  }

  
  public func updateNoResultMessage() {
    DispatchQueue.main.async {
      self.ensureNoResultLabel()
      
      if let message = self.noResultsMessage, self.items.count == 0 {
        self.noResultsLabel.text = message
      } else {
        self.noResultsLabel.text = nil
      }
    }
  }
  
  
  /// ensure the noResultLabel is present
  /// must be called in main thread
  func ensureNoResultLabel() {
    noResultsLabel.textAlignment = .center
    noResultsLabel.textColor = W3WColor.secondaryDarkGray.current.uiColor
    tableView.backgroundView = noResultsLabel
  }
  
  
  public func getIdealHeight() -> CGFloat {
    return self.preferredContentSize.height
//    if self.preferredContentSize.height > 0.0 {
//      return self.preferredContentSize.height
//
//    } else {
//      var count = CGFloat(items.count)
//  
//      if let max = maxCellsShowing {
//        if max < count {
//          count = max
//        }
//      }
//  
//      return rowHeight * count
//    }
  }
  
  
  /// Get a frame for the view, and optinally change the origin and width.  Height is always calulated based on content
  func getFrame(x: CGFloat? = nil, y: CGFloat? = nil, width: CGFloat? = nil, height: CGFloat? = nil) -> CGRect {
    return CGRect(x: x ?? self.view.frame.origin.x, y: y ?? self.view.frame.origin.y, width: width ?? self.view.frame.size.width, height: height ?? self.getIdealHeight())
  }

  
  public func getItem(at: IndexPath) -> RowDataType? {
    if at.row >= 0 && at.row < items.count {
      return items[at.row]
    } else {
      return nil
    }
  }
  

//  public func highlight(match: (CellType) -> Bool) {
//    for cell in tableView.visibleCells {
//      if let c = cell as? CellType {
//        if match(c) {
//          cell.isHighlighted = true
//        } else {
//          cell.isHighlighted = false
//        }
//      } else {
//        cell.isHighlighted = false
//      }
//    }
//  }
  
  
  // MARK: UITableViewDelegate
  
  
  /// called when the user selects a cell
  override open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let cell = tableView.cellForRow(at: indexPath) as? W3WTableViewCell {
      cell.updateView()
    }
    
    onRowSelected(items[indexPath.row], indexPath)
  }
  
  
  /// sets the cell height
  override open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return rowHeight
  }
  
  
  // MARK: UITableViewDataDelegate
  
  
  /// delegate for the tablview
  open override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  /// delegate for the tablview
  open override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  
}
