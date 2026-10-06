//
//  SafeAreaLayoutTests.swift
//  w3w-swift-design
//
//  Created by Kaley Nguyen on 01/10/2026.
//

import XCTest
@testable import W3WSwiftDesign

#if canImport(UIKit)
import UIKit

final class SafeAreaLayoutTests: XCTestCase {

  func testPinBackgroundFillsEdges() {
    let container = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 800))
    let background = UIView()
    container.addSubview(background)

    background.pinBackground(toEdgesOf: container)
    container.layoutIfNeeded()

    XCTAssertEqual(background.frame, container.bounds)
  }


  func testPinContentAppliesInsets() {
    let container = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 800))
    let content = UIView()
    container.addSubview(content)

    let constraints = content.pinContent(toSafeAreaOf: container, insets: NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 30, trailing: 40))
    container.layoutIfNeeded()

    // a view outside a window has no safe-area insets, so only `insets` apply
    XCTAssertEqual(constraints.count, 4)
    XCTAssertEqual(content.frame, CGRect(x: 20, y: 10, width: 340, height: 760))
  }


  func testPinContentUsesLeadingAndTrailing() {
    let container = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 800))
    container.semanticContentAttribute = .forceRightToLeft
    let content = UIView()
    content.semanticContentAttribute = .forceRightToLeft
    container.addSubview(content)

    content.pinContent(toSafeAreaOf: container, insets: NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 40))
    container.layoutIfNeeded()

    // in right-to-left, leading is the right-hand edge
    XCTAssertEqual(content.frame.minX, 40)
    XCTAssertEqual(content.frame.maxX, 380)
  }
}

#endif
