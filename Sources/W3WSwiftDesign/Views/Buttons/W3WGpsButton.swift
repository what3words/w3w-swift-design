//
//  File.swift
//  
//
//  Created by Dave Duprey on 03/01/2025.
//


import UIKit
import W3WSwiftCore


public class W3WGpsButton: W3WView {
  
  public var isEnabled: Bool = true
  
  public var onTap: () -> () = { }
  
  /// button
  var button: W3WRoundIconButton?
  
  /// little dot in top corner
  var indicator: W3WView?
  
  /// angle of the indicatoer
  var indicatorAngle: CGFloat = .pi * 3.0 / 4.0

  /// angle of the indicatoer
  var indicatorAngleGoal: CGFloat = .pi * 3.0 / 4.0

  /// message that pops out the side
  var ribbon: W3WView?
  
  /// indicates if the ribbon is showing
  public var ribbonShowing = false
  
  /// timer for animation
  var timer: Timer?
  
  
  public init(scheme: W3WScheme? = nil, position: W3WViewPosition? = nil, onTap: @escaping () -> () = { }) {
    super.init(scheme: scheme?.with(cornerRadius: .circle).with(background: .clear))
    
    self.onTap = onTap
    
    button = W3WRoundIconButton(image: .locationFill, scheme: scheme?.with(foreground: scheme?.colors?.tint), position: position, onTap: self.onTap)
    button?.set(position: .absolute(rect: bounds))
    addSubview(button!)
    button?.onTap = { [weak self] in self?.onTap() }
  }
  
  
  /// obligatory init
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  
  public func set(image: W3WImage?) {
    if let i = image {
      button?.set(image: i)
    }
  }
  
  
  public func set(scheme: W3WScheme?) {
    super.set(scheme: scheme)
    button?.set(scheme: scheme)
    ribbon?.set(scheme: scheme)
    indicator?.set(scheme: scheme)
  }

  
  public func ribbon(text: W3WString?) {
    ribbonShowing = text != nil
    
    ribbon?.set(position: .absolute(rect: CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: CGSize(width: frame.height, height: frame.height))), animate: .seconds(1.0))
    UIView.animate(withDuration: W3WDuration.defaultAnimationSpeed.seconds) { [weak self] in
      self?.ribbon?.subviews.first?.alpha = 0.0
    }

    W3WThread.runIn(duration: .seconds(0.75)) { [unowned self] in
      ribbon?.removeFromSuperview()
      ribbon = nil
      
      if let message = text {
        let label = W3WLabel(text: message)
        label.set(position: { view, this in return view?.bounds.insetBy(dx: W3WPadding.light.value, dy: W3WPadding.light.value) ?? .zero })
        label.alpha = 0.0
        label.sizeToFit()

        let length = label.frame.width + W3WPadding.light.value * 2.0 // message.asAttributedString().size().width + frame.width + W3WPadding.light.value
        
        ribbon = W3WView(scheme: scheme?.with(background: scheme?.colors?.secondaryBackground))
        ribbon?.set(position: .absolute(rect: CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: CGSize(width: frame.height, height: frame.height))))
        
        ribbon?.addSubview(label)
        
        addSubview(ribbon!)
        sendSubviewToBack(ribbon!)
        
        ribbon?.set(position: .absolute(rect: CGRect(origin: CGPoint(x: -length, y: 0.0), size: CGSize(width: length + frame.height, height: frame.height))), animate: .seconds(1.0))
        
        W3WThread.runIn(duration: .seconds(1.0)) {
          UIView.animate(withDuration: W3WDuration.defaultAnimationSpeed.seconds) {
            label.alpha = 1.0
          }
        }
      }
    }
  }
  
  
  public func setIndicatorAngleAnimated(angle: CGFloat) {
    indicatorAngleGoal = angle

    if timer == nil {
      timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] t in
        if let self = self {
          if abs(indicatorAngleGoal - indicatorAngle) < 0.1 {
            timer?.invalidate()
            timer = nil
            indicatorAngleGoal = indicatorAngle
          }
          
          indicatorAngle += min((indicatorAngleGoal - indicatorAngle) / 5.0, 0.09)
          self.setIndicatorAngle(angle: indicatorAngle)
          
        } else {
          self?.timer?.invalidate()
          self?.timer = nil
        }
      }
    }
  }

  
  public func setIndicatorAngle(angle: CGFloat, animate: W3WDuration = .seconds(0.2)) {
    let x = cos(-indicatorAngle) * frame.width * 0.5 + frame.width / 4.0 + frame.width / 12.0
    let y = sin(-indicatorAngle) * frame.width * 0.5 + frame.height / 4.0 + frame.width / 12.0
    let position = CGPoint(x: x, y: y)
    indicator?.set(position: .absolute(origin: position, size: CGSize(width: frame.width / 3.0, height: frame.width / 3.0)), animate: animate)
    indicatorAngle = angle
  }
  
  
  public func indicator(image: W3WImage? = nil, type: W3WIndicatorType) {
    indicator?.subviews.first?.removeFromSuperview()
    indicator?.removeFromSuperview()
    indicator = nil

    if type != .none {
      if let i = image {
        let scheme = scheme?
          .with(foreground: type == .warning ? scheme?.colors?.warning?.foreground : scheme?.colors?.error?.foreground)
          .with(background: type == .warning ? scheme?.colors?.warning?.background : scheme?.colors?.error?.background)
          .with(cornerRadius: .circle)
          .with(padding: .heavy)
        
        let alert = W3WIconView(image: i, scheme: scheme)
        alert.frame = CGRect(origin: CGPoint(x: frame.width / 12.0, y: frame.width / 16.0), size: CGSize(width: frame.width / 6.0, height: frame.width / 6.0))
        alert.set(position: .absolute(origin: CGPoint(x: frame.width / 12.0, y: frame.width / 16.0), size: CGSize(width: frame.width / 6.0, height: frame.width / 6.0)))
        alert.clipsToBounds = false
        
        indicator = W3WView(scheme: scheme)
        indicator?.addSubview(alert)
        addSubview(indicator!)

        setIndicatorAngle(angle: indicatorAngle, animate: .seconds(0.0))
      }
    }
  }
  
  
}
