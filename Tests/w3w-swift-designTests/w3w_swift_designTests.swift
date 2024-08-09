import XCTest
import W3WSwiftThemes
@testable import W3WSwiftDesign

final class w3w_swift_designTests: XCTestCase {
  
  func testBase() throws {
    let theme = W3WTheme()
    XCTAssertNotNil(theme[.base])
  }
  
  
  func testCopyColor() throws {
    let theme = W3WTheme.standard
    let theme2 = theme.with(foreground: .white, into: .base)

    XCTAssert(theme[.base]?.colors?.foreground?.current.red == 0.0)
    XCTAssert(theme2[.base]?.colors?.foreground?.current.red == 1.0)
  }
 
  
  func testStringReplace() throws {
    let word = W3WString("chuck")
    let text = W3WString("how much wood would a wood chuck chuck, if a wood chuck could chuck wood")
    let replacement = W3WString("chuck")
    
    let newText = word.replace(this: word, with: replacement)
    //print(newText)
  }
 
  
  func testCopyStyle() throws {
    let theme = W3WTheme.standard
    let theme2 = theme.with(padding: .bold, into: .labels)
    
    XCTAssert(theme[.labels]?.styles?.padding == .medium)
    XCTAssert(theme2[.labels]?.styles?.padding == .bold)
  }
  
  
}
