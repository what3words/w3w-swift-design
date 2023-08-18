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
open class W3WTableViewController<RowDataType, CellType>: UITableViewController {

  /// called when the user selects a suggestion
  public var onRowSelected: (RowDataType, IndexPath) -> () = { _,_ in }
  
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
  
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    registerCell()
  }

  
  func registerCell() {
    self.tableView.register(CellType.self as? AnyClass, forCellReuseIdentifier: cellIdentifier)
  }
  
  
  public func getReusableCell(indexPath: IndexPath) -> CellType {
    return tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CellType
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

    // TODO: W3WDesign this
    tableView.separatorColor = W3WColor.tertiaryLabel.current.uiColor
    //tableView.separatorColor = theme?.colors?.separator?.current.uiColor //W3WColor.tertiaryLabel.current.uiColor

    tableView.separatorInset = .zero
    
    let activity = UIActivityIndicatorView()
    activity.startAnimating()
    tableView.backgroundView = activity
  }

  
  // MARK: Accessors

  
  public func getItems() -> [RowDataType] {
    return items
  }
  
  
  public func set(items: [RowDataType]) {
    self.items = items
    updateNoResultMessage()

    DispatchQueue.main.async {
      self.tableView.reloadData()
    }

    updateFrame()
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
//    var count = CGFloat(items.count)
//
//    if let max = maxCellsShowing {
//      if max < count {
//        count = max
//      }
//    }
//
//    return rowHeight * count
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
  override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    onRowSelected(items[indexPath.row], indexPath)
  }
  
  
  /// sets the cell height
  override public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return rowHeight
  }
  
  
  // MARK: UITableViewDataDelegate
  
  
  /// delegate for the tablview
  public override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  /// delegate for the tablview
  public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  
}
