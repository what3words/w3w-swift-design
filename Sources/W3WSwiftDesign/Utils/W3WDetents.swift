//
//  W3WDetents.swift
//  
//
//  Created by Dave Duprey on 13/09/2023.
//

import Foundation


/// a store of positions that a view may move to
public class W3WDetents {
  
  var detents = [CGFloat]()

  
  public init(detent: CGFloat) {
    add(detent: detent)
  }

  
  public init(detents: [CGFloat]) {
    add(detents: detents)
  }


  public func add(detent: CGFloat) {
    detents.append(detent)
  }
  
  
  public func add(detents arr: [CGFloat]) {
    detents.append(contentsOf: arr)
  }
  
  
  public func remove(detent: CGFloat) {
    detents.removeAll(where: { d in d == detent })
  }
  
  
  public func removeDetents() {
    detents.removeAll()
  }

  
  public func nearest(value: CGFloat) -> CGFloat {
    var retval = 0.0
    var distance = CGFloat.greatestFiniteMagnitude
    
    for detent in detents {
      if abs(value - detent) < distance {
        distance = abs(value - detent)
        retval = detent
      }
    }
    
    return retval
  }
  
  
}
