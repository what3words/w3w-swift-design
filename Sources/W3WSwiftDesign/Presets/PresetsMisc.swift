//
//  File.swift
//  
//
//  Created by Dave Duprey on 27/07/2023.
//

import W3WSwiftCore

public extension W3WDuration {
  static let animation = W3WDuration(seconds: 0.3)
  
  static func seconds(_ seconds: Double) -> W3WDuration { return W3WDuration(seconds: seconds) }
}
