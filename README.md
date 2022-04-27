# <img valign='top' src="https://what3words.com/assets/images/w3w_square_red.png" width="64" height="64" alt="what3words">&nbsp;w3w-swift-design

Overview
--------

This is a primitive library for basic definitions of things like colour, margins, borders, fonts, and similar.

At the moment, it only contains types for colour values.

##### W3WCoreColor

W3WCoreColor contains red, green, blue, and alpha componens stored as CGFloat.  It can be instantiated from NSColor, CGColor, UIColor, and SwiftUI's Color.  It can also give back these types from it's  cgColor, suColor, uiColor, and nsColor members.

##### W3WColor

W3WColor stores a colour for each colour mode, such as "light mode" and "dark mode".  Internally it stores it as a dictionary of [W3WColorMode: W3WCoreColor]

##### W3WColorMode

An enum to indicate things like "dark mode" and "light mode"

##### extension UIColor

UIColor is extended to allow any UIColor to return a W3WColor or W3WCoreColor easily.  eg:

```
let w3wcolor = UIColor.blue.w3wColor
let w3wcoreColor = UIColor.blue.w3wCoreColor
```

