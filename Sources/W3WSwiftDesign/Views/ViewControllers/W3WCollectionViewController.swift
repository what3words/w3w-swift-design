//
//  File.swift
//  
//
//  Created by Dave Duprey on 07/07/2023.
//

import UIKit



open class W3WCollectionViewController<RowDataType, CellType: W3WCollectionViewCell>: UICollectionViewController, UICollectionViewDelegateFlowLayout {

  public var theme: W3WTheme?

  /// the store of data for each row
  var items = [RowDataType]()

  /// message to disply if there are no rows
  var noResultsMessage: String?
  
  var noResultsLabel = UILabel()

  
  /// the cellIdentifier is the name of the class
  public let cellIdentifier:String = String(describing: CellType.self)

  
  lazy var layout: UICollectionViewFlowLayout = {
    let size = theme?[.cells]?.styles?.rowHeight?.value ?? W3WRowHeight.extraLarge.value
    
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.itemSize = CGSizeMake(size, size)
    layout.sectionInset = UIEdgeInsets(top: 2.0, left: 2.0, bottom: 2.0, right: 2.0)
    layout.minimumInteritemSpacing = 2.0
    layout.minimumLineSpacing = 2.0
    return layout
  }()
  

  public init(theme: W3WTheme? = nil) {
    super.init(nibName: nil, bundle: nil)
    configure(theme: theme)
  }
  
  
  public init(collectionViewLayout: UICollectionViewLayout, theme: W3WTheme? = nil) {
    super.init(nibName: nil, bundle: nil)
    configure(theme: theme)
  }

  
  override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    configure()
  }
  
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    configure()
  }
  
  
  func configure(theme: W3WTheme? = nil) {
    self.theme = theme

    // set the flow
    //let layout = UICollectionViewFlowLayout()
    //layout.scrollDirection = .vertical
    //layout.itemSize = CGSizeMake(theme?.style?[.cells].rowHeight?.value ?? W3WRowHeight.extraLarge.value, theme?.style?[.cells].rowHeight?.value ?? W3WRowHeight.extraLarge.value)
    //layout.sectionInset = UIEdgeInsets(top: 2.0, left: 2.0, bottom: 2.0, right: 2.0)
    //layout.minimumInteritemSpacing = 2.0
    //layout.minimumLineSpacing = 2.0
    //collectionView?.setCollectionViewLayout(viewLayout, animated: false)

    // register cell type
    self.collectionView.register(CellType.self, forCellWithReuseIdentifier: cellIdentifier)
  }
    
  
  public func getReusableCell(indexPath: IndexPath) -> CellType {
    return collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CellType
  }
  
  
  override open func loadView() {
    self.collectionView = W3WCollectionView(frame: .w3wWhatever, collectionViewLayout: layout)
  }
  
  
  public var w3wCollectionView: W3WCollectionView? {
    return self.view as? W3WCollectionView
  }


  /// sets up the UI
  override open func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.delegate = self
    collectionView.dataSource = self
    
    let activity = UIActivityIndicatorView()
    activity.startAnimating()
    collectionView.backgroundView = activity
  }
  
  

  // MARK: Accessors
  
  
  public func getItems() -> [RowDataType] {
    return items
  }
  
  
  public func set(items: [RowDataType]) {
    self.items = items
    updateNoResultMessage()
    
    DispatchQueue.main.async {
      self.collectionView.reloadData()
    }
  }
  
  
  // MARK: Informaiton Messages
  
  
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
    collectionView.backgroundView = noResultsLabel
  }
  
  
  // MARK: Accessing Cells
  
  
  public func getItem(at: IndexPath) -> RowDataType? {
    if at.row >= 0 && at.row < items.count {
      return items[at.row]
    } else {
      return nil
    }
  }

  

  // MARK: UICollectionViewDelegate
  
  
  override public func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  
  override public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return items.count
  }
  
  
  override open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CellType

    cell.set(scheme: theme?[.cells])
    
    return cell
  }
  
  
}
