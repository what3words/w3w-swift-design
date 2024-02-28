# <img valign='top' src="https://what3words.com/assets/images/w3w_square_red.png" width="64" height="64" alt="what3words">&nbsp;w3w-swift-design

Overview
--------

This is a primitive library for basic definitions of things like colour, margins, borders, fonts, and similar.  This library is new and any and all comments, suggestions, and input is welcome before it goes live.  It mostly contains default style values for the what3words design system.

#### Design Goals

The design goals with this library are:

* **Few if any 3rd party dependancies**: Our clients incorporate these libraries into their apps. If we make it depend on a particular 3rd party library, and our client is using a different library for the same purpose, then we are causing unnecessary bloat in our client's apps.
* **Optional use**: All the style, and layout values are optional (literally optionals), and if they are not used by our clients, there should be no effect on their code.  For example, they should be able to use our `W3WTextField` and leave out our colour, style and layout parameters and then take control of it using the regular values provided by it's underlying `UITextField`, or `UIView` class.

#### Synopsis

The most noteworthy objects here are `W3WTheme`, `W3WScheme`, and `W3WViewPosition`.

A `W3WTheme` contains style and colour information for a whole app, component, or view controller.  It is basically a collection of `W3WScheme`.

A `W3WScheme` holds style and colour information typically used for a single view by containing a `W3WStyles` and a `W3WColors` object, which contain styling and colour information respectively.

`W3WViewPosition` provides view layout information.  See below for a full description.

## Colors

The `W3WCoreColor` object contains RGBA values.  `W3WColor` contains two `W3WCoreColors`, one for light mode and one for dark mode.  `W3WColors` contains a bunch of `W3WColor` to provide the colours for a whole view.

##### W3WCoreColor

`W3WCoreColor` contains red, green, blue, and alpha components stored as CGFloat.  It can be instantiated from `NSColor`, `CGColor`, `UIColor`, and SwiftUI's `Color`.  It can return `CGColor`, `Color`, `UIColor`, and `NSColor` types.

```
let white = W3WCoreColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
let brightGreen   = W3WCoreColor(hex: 0x65D698)
let darkGreen     = W3WCoreColor(hex: 0x265239)
```

##### W3WColor

W3WColor stores a `W3WCoreColour` for each colour mode, such as "light mode" and "dark mode".  Internally it stores these as a dictionary of `[W3WColorMode: W3WCoreColor]`.  `W3WColorMode` is an enum to indicate things like "dark mode" and "light mode".

```
let green = W3WColor(light: .brightGreen, dark: .darkGreen)
let darkModeUIColor: UIColor = green[.dark].uiColor
```

`W3WColor` also has a computed value called `current` which will return the correct colour depending on if the app is in light or dark mode:

```
let correctColorForMode = W3WColor.systemBackground.current
```

##### W3WColors

W3WColors stores a set of semantic colours.  It has colours such as `background`, `foreground`, `highlight`,  `border`, etc...  Most values are W3WColor, but some are `W3WBasicColors` such as  which contain two colors (foreground and background).

```
let colors = W3WColors(foreground: .white, background: .black, tint: .red)
```

##### Conversion

UIColor is extended to allow any UIColor to return a W3WColor or W3WCoreColor easily.  eg:

```
let w3wcolor = UIColor.blue.w3wColor
let w3wcoreColor = UIColor.blue.w3wCoreColor
```

Similarly, W3WCCoreolor can return a UIColor, CGColor, Color (swiftUI), or NSColor, eg:

```
let uiColor = W3WCoreColor.red.uiColor
let cgColor = W3WCoreColor.red.cgColor
```


## Styles

The following style values are grouped by a `W3WStyles` object who's purpose is to provide all the style needed for a particular view. `W3WStyles` is described in the next section.

The types of styles are: `W3WPadding`, `W3WCornerRadius`, `W3WRowHeight`, `W3WLineThickness`, `W3WShadow`, `W3WFonts`, and `W3WLineThickness`.

##### W3WStyles

`W3WStyles` is a group of styles based on the types listed above.  It contains things like `border`, `cornerRadius`, `shadow`, `fonts`, `padding`, `separator`, `rowHeight`, `lineThickness`, and such.


## Schemes

`W3WSchemes` are generally used to describe the styling of a view.

`W3WScheme` holds a `W3WStyles` and a `W3WColors` value.  

Classes adhering to `W3WViewProtocol` such as `W3WView` generally take a `W3WScheme` as a parameter upon construction.

## Themes

`W3WThemes` are generally used to describe the styling of an entire app, a component, or a view controller.

`W3WTheme` is a collection of `W3WScheme`.  Internally, it holds a dictionary of `[W3WSetTypes : W3WScheme]`.  `W3WSetType` is an enum specifying what it's associated scheme is to be used for.  It has values such as `base`, `textFields`, `cells`, `buttons`, `labels`, `maps`, `icons`, `voice`, and `ocr`.  It also has a custom value that accepts a string (`custom(String)`) for defining application specific colour schemes.


## Layout


A class called `W3WViewPosition` provides a simple light weight view layout mechanism.  It contains a closure of the form: 

```
(UIView?, W3WViewProtocol) -> (CGRect)
```

This closure returns a CGRect for the position to place the view at.   It is passed a reference to the parent and the view itself.

This example puts a small "aqua" coloured view on a view controller at (64,128),(200,64):

```
let view = W3WView(scheme: .standard.with(background: .aqua))
add(view: view, position: { _,_ in CGRect(x: 64.0, y: 128.0, width: 200.0, height: 64.0) })
```

However, the intent is to have statically defined global position instances to simplify things.  For example, this can be written to place that view in the centre of the main view as follows:

```
let view = W3WView(scheme: .standard.with(background: .aqua))
add(view: view, position: .center(size: CGSize(width: 200.0, height: 64.0)))
```

Or at the top of the main view:

```
let view = W3WView(scheme: .standard.with(background: .aqua))
add(view: view, position: .top())
```

## View Controllers


##### W3WViewController

This is based on UIViewController and provides some lightweight functionality for styling, and subview management. Example as shown in `/Examples/ViewControllers`:

```
  override func viewDidLoad() {
    super.viewDidLoad()

    // set the background colour
    set(theme: .standard.with(background: W3WColor(light: .aqua, dark: .darkCyan)))
    
    // put a white textview at the top
    let topView = W3WTextField(scheme: .standard.with(cornerRadius: .soft))
    add(view: topView, position: .top())
        
    // put a map in the centre by wrapping a UIKit standard view in a wrapper, note that in W3WSwiftComponents there is a W3WMapView that has lots of functionality
    let map = W3WWrappedView(view: MKMapView(), scheme: .standard.with(border: .black).with(border: 2.0))
    add(view: map, position: .place(below: topView, margin: 24.0, height: 128.0))
    
    // put a text view at the bottom with a styled address
    let simple = W3WLabel(text: "Hello!", scheme: .standard.with(cornerRadius: .verySoft))
    simple.textAlignment = .center
    add(view: simple, position: .place(below: map))
  }

}
```


##### W3WTableViewController

This is based on UITableViewController and basically handles all the boilerplate UITableViewController code and only needs the `func tableView(... cellForRowAt indexPath: IndexPath)` to be overridden.  Example as shown in `/Examples/TableViews`:

```
class SimpleTableViewController: W3WTableViewController<String, UITableViewCell> {

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
```

## Views

##### W3WIcon

## Graphics

##### W3WFont

## Utils

##### W3WString

## Delete the following:

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

