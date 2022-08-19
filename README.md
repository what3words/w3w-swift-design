# <img valign='top' src="https://what3words.com/assets/images/w3w_square_red.png" width="64" height="64" alt="what3words">&nbsp;w3w-swift-design

Overview
--------

This is a primitive library for basic definitions of things like colour, margins, borders, fonts, and similar.  This library is in its infancy and is subject to sudden radical changes.  It mostly contains default style values for the what3words design system.

## Colors

##### W3WCoreColor

W3WCoreColor contains red, green, blue, and alpha components stored as CGFloat.  It can be instantiated from NSColor, CGColor, UIColor, and SwiftUI's Color.  It can return CGColor, Color, UIColor, and NSColor types.

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

## Geometry

##### W3WPadding

W3WPadding contains a values of type CGFloat called `value`, and has 6 preset values as static members: `none`, `thin`, `light`, `medium`, `bold`, and `heavy` which correspond to most what3words design standards.

##### W3WCornerRadius

W3WCornerRadius contains a values of type CGFloat called `value`, and has 3 preset values as static members: `none`, `medium`, `soft` which correspond to most what3words design standards.

##### W3WRowHeight

W3WRowHeight contains a values of type CGFloat called `value`, and has 6 preset values as static members: `extraSmall`, `small`, `medium`, `large`, `extraLarge`, and `extraextraLarge` which correspond to most what3words design standards.




