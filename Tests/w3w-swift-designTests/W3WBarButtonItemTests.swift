import XCTest
import W3WSwiftThemes
@testable import W3WSwiftDesign

final class W3WBarButtonItemTests: XCTestCase {

  func testCloseItemOptsOutOfLiquidGlass() {
    let item = W3WBarButtonItem.close(theme: .what3words, accessibilityLabel: "Fermer") { }
    XCTAssertEqual(item.style, .plain)
    XCTAssertEqual(item.image?.renderingMode, .alwaysTemplate)
    XCTAssertEqual(item.accessibilityLabel, "Fermer")
    XCTAssertEqual(item.accessibilityIdentifier, "navigation_bar_close")
    XCTAssertEqual(item.tintColor, W3WTheme.what3words.labelsTertiary?.uiColor)
    if #available(iOS 26.0, *) {
      XCTAssertTrue(item.hidesSharedBackground)
    }
  }

  func testBackItemKeepsTheExistingTestIdentifier() {
    let item = W3WBarButtonItem.back { }
    XCTAssertEqual(item.accessibilityIdentifier, "navigation_bar_back")
    XCTAssertEqual(item.accessibilityLabel, "Back")
    XCTAssertEqual(item.style, .plain)
  }

  func testExplicitTintWinsOverTheme() {
    let item = W3WBarButtonItem.close(theme: .what3words, tint: .white) { }
    XCTAssertEqual(item.tintColor, W3WColor.white.uiColor)
  }

  func testTapRunsTheAction() {
    var taps = 0
    let item = W3WBarButtonItem.close { taps += 1 }
    _ = item.target?.perform(item.action)
    XCTAssertEqual(taps, 1)
  }

  func testThemedCloseButtonUsesThemeColours() {
    let button = W3WCloseButton(theme: .what3words, accessibilityLabel: "Fermer")
    XCTAssertEqual(button.accessibilityLabel, "Fermer")
    XCTAssertEqual(button.accessibilityIdentifier, "navigation_bar_close")
    XCTAssertEqual(button.scheme?.colors?.foreground?.current, W3WTheme.what3words.labelsPrimary?.current)
  }

  func testUntouchedCloseButtonLooksAsBefore() {
    let button = W3WCloseButton()
    XCTAssertEqual(button.scheme?.colors?.foreground?.current, W3WColor.white.current)
  }

  func testGenericIconItemOptsOutToo() {
    let item = W3WBarButtonItem(image: UIImage(systemName: "pencil")!, theme: .what3words, accessibilityLabel: "Edit", accessibilityIdentifier: "edit") { }
    XCTAssertNil(item.control)
    XCTAssertEqual(item.style, .plain)
    XCTAssertEqual(item.accessibilityIdentifier, "edit")
    XCTAssertEqual(item.tintColor, W3WTheme.what3words.labelsTertiary?.uiColor)
  }

  func testSchemeTintWinsOverTheme() {
    let scheme = W3WScheme(colors: W3WColors(foreground: .white, tint: W3WColor(light: .core.red50, dark: .core.red50)))
    let item = W3WBarButtonItem.close(theme: .what3words, scheme: scheme) { }
    XCTAssertEqual(item.tintColor, W3WColor(light: .core.red50, dark: .core.red50).uiColor)
  }

  func testLegacyCloseButtonNowHasAccessibility() {
    let button = W3WCloseButton()
    XCTAssertEqual(button.accessibilityLabel, "Close")
    XCTAssertEqual(button.accessibilityIdentifier, "navigation_bar_close")
  }

  func testSchemeCloseButtonUsesSchemeColours() {
    let scheme = W3WScheme(colors: W3WColors(foreground: .white, background: W3WColor(light: .core.grey90, dark: .core.grey22)))
    let button = W3WCloseButton(scheme: scheme)
    XCTAssertEqual(button.scheme?.colors?.background?.current, W3WColor(light: .core.grey90, dark: .core.grey22).current)
  }
}
