//
//  W3WDetents.swift
//  
//
//  Created by Dave Duprey on 13/09/2023.
//

import Foundation


class W3WDetents {
  
  var detents = [CGFloat]()

  
  init(detent: CGFloat) {
    add(detent: detent)
  }


  func add(detent: CGFloat) {
    detents.append(detent)
  }
  
  
  func add(detents arr: [CGFloat]) {
    detents.append(contentsOf: arr)
  }
  
  
  func remove(detent: CGFloat) {
    detents.removeAll(where: { d in d == detent })
  }
  
  
  func nearest(value: CGFloat) -> CGFloat {
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
