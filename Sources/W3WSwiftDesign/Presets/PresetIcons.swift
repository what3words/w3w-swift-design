//
//  File.swift
//  
//
//  Created by Dave Duprey on 09/05/2023.
//


public extension W3WImage {
  
  // TODO: These won't work, they are singularities...  When put in multiple views they get all screwed up
  static let info             = W3WImage(file: "info", colors: .iconBlue)
  static let pin              = W3WImage(file: "roundedPin", colors: .iconBlue)
  static let pinFill          = W3WImage(file: "roundedPinFill", colors: .iconBlue)
  static let pinWhite         = W3WImage(file: "roundedPin", colors: .iconBlue)
  static let pinFillWhite     = W3WImage(file: "roundedPinFill", colors: .iconBlue)
  static let pins             = W3WImage(file: "roundedPins", colors: .iconBlue)
  static let scan             = W3WImage(drawing: .ocr, colors: .iconBlue)
  static let sea              = W3WImage(file: "sea", colors: .iconBlue)
  static let slashes          = W3WImage(drawing: .makeSlashes(), colors: .iconBlue)
  static let tickCircle       = W3WImage(file: "tickCircle", colors: .iconBlue)
  static let mic              = W3WImage(drawing: .micWithSlashes, colors: .iconBlue)
  static let micFilled        = W3WImage(drawing: .micFilledWithSlashes, colors: .iconBlueFill)
  static let micBlack         = W3WImage(drawing: .micWithSlashes, colors: .iconBlack)
  static let micFilledBlack   = W3WImage(drawing: .micFilledWithSlashes, colors: .iconBlackFill)
  static let micRed           = W3WImage(drawing: .micWithSlashes, colors: .iconRed)
  static let micFilledRed     = W3WImage(drawing: .micFilledWithSlashes, colors: .iconRedFill)
  static let warning          = W3WImage(systemName: "exclamationmark.triangle", colors: .iconBlack)
  static let close            = W3WImage(file: "close", colors: .iconGray)

  static let arrowLeft        = W3WImage(systemName: "arrow.left", colors: .iconGray)
  static let arrowRight       = W3WImage(systemName: "arrow.right", colors: .iconGray)
  static let checkmark        = W3WImage(systemName: "checkmark", colors: .iconGray)
  static let checkmarkCircle  = W3WImage(systemName: "checkmark.circle", colors: .iconGray)
  static let chevronBackward  = W3WImage(systemName: "chevron.backward", colors: .iconGray)
  static let chevronRight     = W3WImage(systemName: "chevron.right", colors: .iconGray)
  static let ellipsisCircle   = W3WImage(systemName: "ellipsis.circle", colors: .iconGray)
  static let gearshape        = W3WImage(systemName: "gearshape", colors: .iconGray)
  static let gearshapeFill    = W3WImage(systemName: "gearshape.fill", colors: .iconGray)
  static let infoCircle       = W3WImage(systemName: "info.circle", colors: .iconGray)
  static let keyboard         = W3WImage(systemName: "keyboard", colors: .iconGray)
  static let magnifyingglass  = W3WImage(systemName: "magnifyingglass", colors: .iconGray)
  static let micSystem        = W3WImage(systemName: "mic", colors: .iconGray)
  static let plus             = W3WImage(systemName: "plus", colors: .iconGray)
  static let rays             = W3WImage(systemName: "rays", colors: .iconGray)
  static let speakerWave2Fill = W3WImage(systemName: "speaker.wave.2.fill", colors: .iconGray)
  static let speakerWave3Fill = W3WImage(systemName: "speaker.wave.3.fill", colors: .iconGray)
  static let squareDashed     = W3WImage(systemName: "square.dashed", colors: .iconGray)
  static let squareAndPencil  = W3WImage(systemName: "square.and.pencil", colors: .iconGray)
  static let xmark            = W3WImage(systemName: "xmark", colors: .iconGray)
  static let xmarkCircle      = W3WImage(systemName: "xmark.circle", colors: .iconGray)
  static let line3HorizontalDecreaseCircle  = W3WImage(systemName: "line.3.horizontal.decrease.circle", colors: .iconGray)
  
}
