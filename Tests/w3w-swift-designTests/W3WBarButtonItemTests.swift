import XCTest
import W3WSwiftThemes
@testable import W3WSwiftDesign

final class W3WBarButtonItemTests: XCTestCase {

  func testCloseItemKeepsTheSystemGlassCircle() {
    let item = W3WBarButtonItem.close(theme: .what3words, accessibilityLabel: "Fermer") { }
    XCTAssertEqual(item.style, .plain, "`.done` would fill the circle with the tint")
    XCTAssertEqual(item.image?.renderingMode, .alwaysTemplate)
    XCTAssertEqual(item.accessibilityLabel, "Fermer")
    XCTAssertEqual(item.accessibilityIdentifier, "navigation_bar_close")
    XCTAssertEqual(item.tintColor, W3WTheme.what3words.labelsPrimaryBlackInverse?.uiColor)
    if #available(iOS 26.0, *) {
      XCTAssertFalse(item.hidesSharedBackground)
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

  func testGenericIconItemSharesTheLook() {
    let item = W3WBarButtonItem(image: UIImage(systemName: "pencil")!, theme: .what3words, accessibilityLabel: "Edit", accessibilityIdentifier: "edit") { }
    XCTAssertNil(item.control)
    XCTAssertEqual(item.style, .plain)
    XCTAssertEqual(item.accessibilityIdentifier, "edit")
    XCTAssertEqual(item.tintColor, W3WTheme.what3words.labelsPrimaryBlackInverse?.uiColor)
  }

  func testGlyphTintIsBlackInLightAndWhiteInDark() {
    let tint = W3WNavigationControl.glyphTint(from: .what3words)
    XCTAssertEqual(tint?[.light], W3WCoreColor.black)
    XCTAssertEqual(tint?[.dark], W3WCoreColor.white)
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

  /// Palette-configured symbols ignore `tintColor`, which left the glyph stuck in its creation-time colour.
  func testCloseGlyphTakesTheItemTint() {
    XCTAssertTrue(Self.rendersRed(W3WBarButtonItem.close(theme: .what3words) { }), "the close glyph must take the item tint")
  }

  func testBackGlyphTakesTheItemTint() {
    XCTAssertTrue(Self.rendersRed(W3WBarButtonItem.back(theme: .what3words) { }), "the back glyph must take the item tint")
  }

  /// The harness itself: a plain template symbol tints, the palette-baked `W3WImage` glyph does not.
  func testHarnessTellsTemplateFromPaletteGlyphs() {
    let template = UIImage(systemName: "xmark")!.withRenderingMode(.alwaysTemplate)
    XCTAssertTrue(Self.rendersRed(UIBarButtonItem(image: template, style: .plain, target: nil, action: nil)))
    let baked = W3WImage.xmark.get().withRenderingMode(.alwaysTemplate)
    XCTAssertFalse(Self.rendersRed(UIBarButtonItem(image: baked, style: .plain, target: nil, action: nil)))
  }

  /// Shows the item's glyph in a red-tinted image view and reports whether any opaque pixel came out red,
  /// the way a bar button applies `tintColor`: a template symbol tints, a palette-configured one keeps its baked colours.
  private static func rendersRed(_ item: UIBarButtonItem) -> Bool {
    let view = UIImageView(image: item.image)
    view.tintColor = .red
    view.contentMode = .scaleAspectFit
    view.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
    let rendered = UIGraphicsImageRenderer(bounds: view.bounds).image { view.layer.render(in: $0.cgContext) }
    guard let cg = rendered.cgImage, let data = cg.dataProvider?.data, let bytes = CFDataGetBytePtr(data) else { return false }
    let bytesPerPixel = cg.bitsPerPixel / 8
    // Channel order in memory depends on the context: the renderer gives little-endian BGRA.
    let little = cg.bitmapInfo.contains(.byteOrder32Little)
    let alphaFirst = [.premultipliedFirst, .first, .noneSkipFirst].contains(cg.alphaInfo)
    let (ri, gi, bi, ai): (Int, Int, Int, Int)
    switch (little, alphaFirst) {
    case (false, true): (ri, gi, bi, ai) = (1, 2, 3, 0)
    case (false, false): (ri, gi, bi, ai) = (0, 1, 2, 3)
    case (true, true): (ri, gi, bi, ai) = (2, 1, 0, 3)
    case (true, false): (ri, gi, bi, ai) = (3, 2, 1, 0)
    }
    for y in 0..<cg.height {
      for x in 0..<cg.width {
        let i = y * cg.bytesPerRow + x * bytesPerPixel
        let (r, g, b, a) = (Int(bytes[i + ri]), Int(bytes[i + gi]), Int(bytes[i + bi]), Int(bytes[i + ai]))
        if a > 128 && r > a / 2 && g < a / 4 && b < a / 4 { return true }
      }
    }
    return false
  }
}
