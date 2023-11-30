//
//  File.swift
//
//
//  Created by Dave Duprey on 23/05/2022.
//

import UIKit


/// UISearchController overwritten for what3words display needs
open class W3WSearchController: UISearchController, UISearchControllerDelegate, UISearchBarDelegate, UISearchTextFieldDelegate {

  // MARK: W3WViewProtocol
  
  public var theme: W3WTheme?
  
  // MARK: Vars
  
  public var onTextChange: (String, String) -> () = { _,_ in }
  
  public var onEditingBegan: () -> () = { }
  
  public var onEditingEnded: () -> () = { }
  
  public var onTextAppeared: () -> () = { }
  
  public var onTextDisappeared: () -> () = { }

  

  // Pass nil if you wish to display search results in the same view that you are searching. This is not supported on tvOS; please provide a results controller on tvOS.
  public init(searchResultsController: UIViewController?, theme: W3WTheme? = nil) {
    super.init(searchResultsController: searchResultsController)
    self.theme = theme
    self.searchBar.apply(scheme: theme?[.textFields])
  }
  
  
//  // Creates a search controller without a results controller
//  public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//  }
  
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  
  
  open override func viewDidLoad() {
    super.viewDidLoad()

    searchBar.keyboardType = .emailAddress
    
    delegate = self
    searchBar.delegate = self

    self.searchBar.apply(scheme: theme?[.textFields])
    //theme?.update(view: self.searchBar)
  }


  public func presentSearchController(_ searchController: UISearchController) {
    onEditingBegan()
  }


  public func willDismissSearchController(_ searchController: UISearchController) {
    onEditingEnded()
  }



  /// called when the text field contents change
  public func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    if let t = searchBar.text {
      let newText = t.replacingCharacters(in: Range(range, in: t)!, with: text)
      
      onTextChange(t, newText)
      
      if t.count == 0 && newText.count != 0 {
        onTextAppeared()
      }
      if t.count != 0 && newText.count == 0 {
        onTextDisappeared()
      }
    }

    return true

  }

  
  public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    self.searchBar.apply(scheme: theme?[.textFields])
  }
  
  
  open override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    
    self.searchBar.apply(scheme: theme?[.textFields])
  }
  
}
