//
//  ViewController.swift
//  ViewControllers
//
//  Created by Dave Duprey on 29/10/2023.
//

import UIKit
import MapKit
import W3WSwiftCore
import W3WSwiftDesign


class ViewController: W3WViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    // set the background colour
    set(theme: .standard.with(background: W3WColor(light: .aqua, dark: .darkCyan)))
    
    // put a white textview at the top
    let topView = W3WTextField(scheme: .standard.with(cornerRadius: .soft))
    add(view: topView, position: .top())
        
    // put a map in the centre by wrapping a UIKit standard view in a wrapper
    // note that in W3WSwiftComponents has a W3WMapView that has lots of functionality
    let map = W3WWrappedView(view: MKMapView(), scheme: .standard.with(border: .black).with(border: 2.0))
    add(view: map, position: .place(below: topView, margin: 24.0, height: 128.0))
    
    // put a text view at the bottom with a styled address
    let simple = W3WLabel(text: "Hello!", scheme: .standard.with(cornerRadius: .verySoft))
    simple.textAlignment = .center
    add(view: simple, position: .place(below: map))
  }

}

