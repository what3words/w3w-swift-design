import XCTest
@testable import W3WSwiftDesign

final class w3w_swift_designTests: XCTestCase {
  
  func testBase() throws {
    let theme = W3WTheme()
    XCTAssertNotNil(theme[.base])
  }
  
  
  func testCopyColor() throws {
    let theme = W3WTheme.standard
    let theme2 = theme.with(foreground: .white, into: .base)

    XCTAssert(theme[.base]?.colorSet?.foreground?.current.red == 0.0)
    XCTAssert(theme2[.base]?.colorSet?.foreground?.current.red == 1.0)
  }
 
  
  func testCopyStyle() throws {
    let theme = W3WTheme.standard
    let theme2 = theme.with(padding: .bold, into: .labels)
    
    XCTAssert(theme[.labels]?.style?.padding == .medium)
    XCTAssert(theme2[.labels]?.style?.padding == .bold)
  }
  
  
}
