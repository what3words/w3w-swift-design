//
//  File.swift
//  
//
//  Created by Dave Duprey on 31/08/2022.
//

import Foundation


// main colour palettes

extension W3WBaseColors {
  
  static public let standard = W3WColorCollection(
    base:       W3WColorScheme(foreground: .text, background: .background, tint: .systemGray, secondary: .tertiaryLabel, highlight: .highlight, border: .systemGray),
    buttons:    W3WColorScheme(foreground: .text, background: .background, tint: .systemGray, secondary: .tertiaryLabel, highlight: .highlight, border: .systemGray),
    textFields: W3WColorScheme(foreground: .text, background: .background, tint: .systemGray, secondary: .tertiaryLabel, highlight: .highlight, border: .systemGray),
    labels:     W3WColorScheme(foreground: .text, background: .background, tint: .systemGray, secondary: .tertiaryLabel, highlight: .highlight, border: .systemGray)
  )
  
  static public let what3words      = W3WColorScheme(foreground: .text, background: .background, tint: .red, secondary: .tertiaryLabel, border: .systemGray)
  
  static public let blackOnClear    = W3WColorScheme(foreground: .text, background: .clear, tint: .red, secondary: .tertiaryLabel)
  
  static public let debug = W3WColorCollection(
    base:       W3WColorScheme(foreground: .darkBlue, background: .systemYellow, tint: .systemPurple, secondary: .green, highlight: .good, border: .aqua),
    buttons:    W3WColorScheme(foreground: .darkBlue, background: .orange, tint: .systemPurple, secondary: .green, highlight: .good, border: .aqua),
    textFields: W3WColorScheme(foreground: .darkBlue, background: .aqua, tint: .systemPurple, secondary: .green, highlight: .good, border: .aqua),
    labels:     W3WColorScheme(foreground: .darkBlue, background: .systemPink, tint: .systemPurple, secondary: .green, highlight: .good, border: .aqua)
  )

  //W3WColorScheme(base: W3WColorSet.mapPinDefault, brand: .tovWarningBackground, highlight: .good, secondary: .secondaryGray, shadow: .systemYellow, border: .green, separator: .dullRed, placeholder: .aqua, error: .error)
  
  
}



// MARK: W3WCoreColor


extension W3WCoreColor {
    
  // black / white / transparent
  static public let black         = W3WCoreColor(hex: 0x000000)
  static public let white         = W3WCoreColor(hex: 0xffffff)
  static public let clear         = W3WCoreColor(hex: 0x000000, alpha: 0.0)
  
  // what3words brand colours
  static public let aqua          = W3WCoreColor(hex: 0x87e1d1)
  static public let blue          = W3WCoreColor(hex: 0x2e71b8)
  static public let charcoal      = W3WCoreColor(hex: 0x363636)
  static public let coral         = W3WCoreColor(hex: 0xf26c50)
  static public let darkBlue      = W3WCoreColor(hex: 0x0a3049)
  static public let green         = W3WCoreColor(hex: 0x53c18a)
  static public let lightBlue     = W3WCoreColor(hex: 0x98d5e5)
  static public let lightGrey     = W3WCoreColor(hex: 0xe0e0e0)
  static public let mediumGrey    = W3WCoreColor(hex: 0xa7a7a7)
  static public let mustard       = W3WCoreColor(hex: 0xc5b000)
  static public let orange        = W3WCoreColor(hex: 0xf4a344)
  static public let red           = W3WCoreColor(hex: 0xE11F26)
  static public let yellow        = W3WCoreColor(hex: 0xf6d31f)
  
  // extended colours
  static public let royalBlue     = W3WCoreColor(hex: 0x005379)
  static public let cranberry     = W3WCoreColor(hex: 0xcd3b72)
  static public let purple        = W3WCoreColor(hex: 0x8b4ca1)
  static public let powderBlue    = W3WCoreColor(hex: 0xdbeffa)
  static public let brightGreen   = W3WCoreColor(hex: 0x65D698)
  static public let darkGreen     = W3WCoreColor(hex: 0x265239)
  static public let darkCyan      = W3WCoreColor(hex: 0x1D4752)
  static public let darkerCyan    = W3WCoreColor(hex: 0x2B6A7A)
  static public let darkBrown     = W3WCoreColor(hex: 0x52460A)
  static public let brown         = W3WCoreColor(hex: 0x7A690F)
  static public let darkerBrown   = W3WCoreColor(hex: 0x52170B)
  static public let dullRed       = W3WCoreColor(hex: 0xB24000)
  static public let darkDarkBlue  = W3WCoreColor(hex: 0x001626)
  static public let lightCyan     = W3WCoreColor(hex: 0xC2E1EB)
  
  // design docs names (same colours as above)
  static public let w3wRed        = red
  static public let primaryBlue   = darkBlue
  static public let secondaryBlue  = royalBlue
  static public let teal            = lightCyan
  static public let informationBlue  = lightBlue
  static public let confirmationGreen = green
  static public let warningYellow     = yellow
  static public let errorRed         = coral
  static public let errorRedText    = dullRed
  static public let linkVisited    = purple
  static public let regular       = darkBlue.with(alpha: 0.6)
  static public let dark         = darkBlue.with(alpha: 0.96)
  
  // greys
  static public let grey92      = W3WCoreColor(grey: 0.92)
  static public let grey84      = W3WCoreColor(grey: 0.84)
  static public let grey77      = W3WCoreColor(grey: 0.77)
  static public let grey50       = W3WCoreColor(grey: 0.5)
  static public let grey38        = W3WCoreColor(grey: 0.38)
  static public let grey32         = W3WCoreColor(grey: 0.32)
  
  // off greys
  static public let offGrey           = W3WCoreColor(hex: 0xF2F4F5)
  static public let offLightGrey       = W3WCoreColor(hex: 0xB5B5B5)
  static public let offMidGrey          = W3WCoreColor(hex: 0x525E66)
  static public let offDarkGrey           = W3WCoreColor(hex: 0x31383D)
  
  // iOS System Colours
  static public let systemBackgroundLight       = W3WCoreColor(hex: 0xFFFFFF)
  static public let systemBackgroundDark          = W3WCoreColor(hex: 0x000000)
  static public let secondarySystemBackgroundLight  = W3WCoreColor(hex: 0xF2F2F7)
  static public let secondarySystemBackgroundDark    = W3WCoreColor(hex: 0x1C1C1E)
  static public let tertiarySystemBackgroundLight     = W3WCoreColor(hex: 0xFFFFFF)
  static public let tertiarySystemBackgroundDark       = W3WCoreColor(hex: 0x2C2C2E)
  static public let systemGroupedBackgroundLight        = W3WCoreColor(hex: 0xF2F2F7)
  static public let systemGroupedBackgroundDark          = W3WCoreColor(hex: 0x000000)
  static public let secondarySystemGroupedBackgroundLight = W3WCoreColor(hex: 0xFFFFFF)
  static public let secondarySystemGroupedBackgroundDark   = W3WCoreColor(hex: 0x1C1C1E)
  static public let tertiarySystemGroupedBackgroundLight   = W3WCoreColor(hex: 0xF2F2F7)
  static public let tertiarySystemGroupedBackgroundDark   = W3WCoreColor(hex: 0x2C2C2E)
  
  static public let labelLight                          = W3WCoreColor(hex: 0x000000)
  static public let labelDark                         = W3WCoreColor(hex: 0xFFFFFF)
  static public let secondaryLabelLight             = W3WCoreColor(hex: 0x3C3C43, alpha: 0.6)
  static public let secondaryLabelDark            = W3WCoreColor(hex: 0xEBEBF5, alpha: 0.6)
  static public let tertiaryLabelLight          = W3WCoreColor(hex: 0x3C3C43, alpha: 0.3)
  static public let tertiaryLabelDark         = W3WCoreColor(hex: 0xEBEBF5, alpha: 0.3)
  static public let quaternaryLabelLight     = W3WCoreColor(hex: 0x3C3C43, alpha: 0.2)
  static public let quaternaryLabelDark     = W3WCoreColor(hex: 0xEBEBF5, alpha: 0.2)
  
  static public let placeholderTextLight  = W3WCoreColor(hex: 0x3C3C43, alpha: 0.3)
  static public let placeholderTextDark  = W3WCoreColor(hex: 0xEBEBF5, alpha: 0.3)

  static public let primaryFillLight     = W3WCoreColor(hex:0x787880, alpha: 0.2)
  static public let secondaryFillLight   = W3WCoreColor(hex: 0x787880, alpha: 0.16)
  static public let tertiaryFillLight    = W3WCoreColor(hex: 0x767680, alpha: 0.12)
  static public let quaternaryFillLight  = W3WCoreColor(hex: 0x747480, alpha: 0.08)
  static public let quinaryFillLight     = W3WCoreColor(hex: 0xEDEDED, alpha: 0.8)
  static public let senaryFillLight      = W3WCoreColor(hex: 0xF2F2F2, alpha: 0.8)

  static public let primaryFillDark      = W3WCoreColor(hex:0x787880, alpha: 0.36)
  static public let secondaryFillDark    = W3WCoreColor(hex: 0x787880, alpha: 0.32)
  static public let tertiaryFillDark     = W3WCoreColor(hex: 0x767680, alpha: 0.24)
  static public let quaternaryFillDark   = W3WCoreColor(hex: 0x747480, alpha: 0.18)
  static public let quinaryFillDark      = W3WCoreColor(hex: 0x252525, alpha: 0.5)
  static public let senaryFillDark       = W3WCoreColor(hex: 0x1E1E1E, alpha: 0.75)

  static public let separatorLight       = W3WCoreColor(hex: 0x3C3C43, alpha: 0.3)
  static public let separatorDark        = W3WCoreColor(hex: 0x545458, alpha: 0.6)
  static public let opaqueSeparatorLight = W3WCoreColor(hex: 0xC6C6C8)
  static public let opaqueSeparatorDark  = W3WCoreColor(hex: 0x38383A)
  
  static public let systemBlueLight      = W3WCoreColor(hex: 0x007AFF)
  static public let systemBlueDark      = W3WCoreColor(hex: 0x0A84FF)
  static public let systemGreenLight   = W3WCoreColor(hex: 0x34C759)
  static public let systemGreenDark   = W3WCoreColor(hex: 0x30D158)
  static public let systemIndigoLight = W3WCoreColor(hex: 0x5856D6)
  static public let systemIndigoDark  = W3WCoreColor(hex: 0x5E5CE6)
  static public let systemOrangeLight = W3WCoreColor(hex: 0xFF9500)
  static public let systemOrangeDark  = W3WCoreColor(hex: 0xFF9F0A)
  static public let systemPinkLight   = W3WCoreColor(hex: 0xFF2D55)
  static public let systemPinkDark    = W3WCoreColor(hex: 0xFF375F)
  static public let systemPurpleLight = W3WCoreColor(hex: 0xAF52DE)
  static public let systemPurpleDark  = W3WCoreColor(hex: 0xBF5AF2)
  static public let systemRedLight    = W3WCoreColor(hex: 0xFF3B30)
  static public let systemRedDark     = W3WCoreColor(hex: 0xFF453A)
  static public let systemTealLight   = W3WCoreColor(hex: 0x5AC8FA)
  static public let systemTealDark    = W3WCoreColor(hex: 0x64D2FF)
  static public let systemYellowLight = W3WCoreColor(hex: 0xFFCC00)
  static public let systemYellowDark  = W3WCoreColor(hex: 0xFFD60A)
  
  static public let systemGrayLight   = W3WCoreColor(hex: 0x8E8E93)
  static public let systemGrayDark    = W3WCoreColor(hex: 0x8E8E93)
  static public let systemGray2Light  = W3WCoreColor(hex: 0xAEAEB2)
  static public let systemGray2Dark   = W3WCoreColor(hex: 0x636366)
  static public let systemGray3Light  = W3WCoreColor(hex: 0xC7C7CC)
  static public let systemGray3Dark   = W3WCoreColor(hex: 0x48484A)
  static public let systemGray4Light  = W3WCoreColor(hex: 0xD1D1D6)
  static public let systemGray4Dark   = W3WCoreColor(hex: 0x3A3A3C)
  static public let systemGray5Light  = W3WCoreColor(hex: 0xE5E5EA)
  static public let systemGray5Dark   = W3WCoreColor(hex: 0x2C2C2E)
  static public let systemGray6Light  = W3WCoreColor(hex: 0xF2F2F7)
  static public let systemGray6Dark   = W3WCoreColor(hex: 0x1C1C1E)
  
}


// MARK: W3WColor

extension W3WColor {
  
  // basic
  static public let clear                     = W3WColor(all: .clear)
  static public let white                     = W3WColor(all: .white)
  static public let black                     = W3WColor(all: .black)
  
  // semantic
  static public let text                      = W3WColor(light: .black, dark: .white)
  static public let foreground                = W3WColor(light: .black, dark: .white)
  static public let background                = W3WColor(light: .white, dark: .black)
  static public let secondary                 = W3WColor.ctaBackgroundSecondary
  static public let tint                      = W3WColor.red
  static public let border                    = W3WColor(light: .black, dark: .white)
  static public let slash                     = W3WColor.red
  
  // brand
  static public let red                       = W3WColor(all: .red)
  static public let blue                      = W3WColor(all: .blue)
  static public let darkBlue                  = W3WColor(all: .darkBlue)
  static public let powderBlue                = W3WColor(all: .powderBlue)
  static public let offDarkGrey               = W3WColor(all: .offDarkGrey)
  static public let lightGrey                 = W3WColor(all: .lightGrey)
  static public let mediumGrey                = W3WColor(all: .mediumGrey)
  static public let green                     = W3WColor(all: .green)
  static public let aqua                      = W3WColor(all: .aqua)
  static public let orange                    = W3WColor(all: .orange)
  
  // extended brand
  
  static public let dullRed                   = W3WColor(all: .dullRed)
  
  // custom
  
  static public let secondaryGray             = W3WColor(all: .offLightGrey)
  static public let secondaryDarkGray         = W3WColor(all: .grey32)
  
  // highlight
  
  static public let highlightBackground       = W3WColor(light: .powderBlue, dark: .systemGray4Dark) // System Colors/Dark/System Background/Elevated/Tertiary)
  
  // cta = Call To Action
  static public let ctaText                   = W3WColor(light: .white,      dark: .white)
  
  static public let ctaBackgroundPrimary      = W3WColor(light: .red,        dark: .red)
  static public let ctaBackgroundSecondary    = W3WColor(light: .darkBlue,   dark: .royalBlue)
  static public let ctaBackgroundTertiary     = W3WColor(light: .royalBlue,  dark: .darkBlue)
  
  static public let ctaBodyText1              = W3WColor(light: .darkBlue,   dark: .white)
  static public let ctaBodyText2              = W3WColor(light: .grey32,     dark: .grey92)
  static public let ctaBodyText3              = W3WColor(light: .grey38,     dark: .grey84)
  
  static public let ctaBodyBackground1        = W3WColor(light: .offGrey,    dark: .darkDarkBlue)
  static public let ctaBodyBackground2        = W3WColor(light: .white,      dark: .black)
  static public let ctaBodyBackground3        = W3WColor(light: .powderBlue, dark: .offDarkGrey)
  static public let ctaBodyBackground4        = W3WColor(light: .lightCyan,  dark: .offMidGrey)
  
  // tov = Tone of Voice
  static public let tovConfirmationText       = W3WColor(light: .green,      dark: .darkGreen)
  static public let tovInformaitonText        = W3WColor(light: .darkerCyan, dark: .darkCyan)
  static public let tovWarningText            = W3WColor(light: .brown,      dark: .darkBrown)
  static public let tovErrorText              = W3WColor(light: .dullRed,    dark: .darkerBrown)
  
  static public let tovConfirmationBackground = W3WColor(light: .white,      dark: .brightGreen)
  static public let tovInformaitonBackground  = W3WColor(light: .white,      dark: .lightBlue)
  static public let tovWarningBackground      = W3WColor(light: .white,      dark: .yellow)
  static public let tovErrorBackground        = W3WColor(light: .white,      dark: .coral)
  
  // overlays
  public static let overlaylight              = W3WColor(light: .white.with(alpha: 0.3),      dark: .white.with(alpha: 0.3))
  public static let overlayNormal             = W3WColor(light: .darkBlue.with(alpha: 0.6),   dark: .darkBlue.with(alpha: 0.6))
  public static let overlayDark               = W3WColor(light: .darkBlue.with(alpha: 0.9),   dark: .darkBlue.with(alpha: 0.9))
  
  public static let overlayLightBlur          = W3WColor(light: .white.with(alpha: 0.3),      dark: .white.with(alpha: 0.3))
  public static let overlayNormalBlur         = W3WColor(light: .grey77.with(alpha: 0.01),    dark: .grey77.with(alpha: 0.01))
  public static let overlayDarkBlur           = W3WColor(light: .darkBlue.with(alpha: 0.6),   dark: .darkBlue.with(alpha: 0.6))
  
  public static let overlayHover              = W3WColor(light: .royalBlue.with(alpha: 0.08), dark: .white.with(alpha: 0.12))
  public static let overlayPressed            = W3WColor(light: .royalBlue.with(alpha: 0.16), dark: .black.with(alpha: 0.16))
  public static let overlayDisabled           = W3WColor(light: .grey50.with(alpha: 7),       dark: .grey50.with(alpha: 0.6))
  
  // Label Colours
  public static let labelColourLight           = W3WColor(all: W3WCoreColor(hex: 0x3C3C43, alpha: 0.6))
  
  // iOS System Colours
  
  static public let systemBackground              = W3WColor(light: .systemBackgroundLight,               dark: .systemBackgroundDark)
  static public let secondarySystemBackground      = W3WColor(light: .secondarySystemBackgroundLight,      dark: .secondarySystemBackgroundDark)
  static public let tertiarySystemBackground        = W3WColor(light: .tertiarySystemBackgroundLight,       dark: .tertiarySystemBackgroundDark)
  static public let systemGroupedBackground          = W3WColor(light: .systemGroupedBackgroundLight,         dark: .systemGroupedBackgroundDark)
  static public let secondarySystemGroupedBackground = W3WColor(light: .secondarySystemGroupedBackgroundLight, dark: .secondarySystemBackgroundDark)
  static public let tertiarySystemGroupedBackground  = W3WColor(light: .tertiarySystemGroupedBackgroundLight,   dark: .tertiarySystemGroupedBackgroundDark)
  
  static public let label                            = W3WColor(light: .labelLight,           dark: .labelDark)
  static public let secondaryLabel                  = W3WColor(light: .secondaryLabelLight,  dark: .secondaryLabelDark)
  static public let tertiaryLabel                 = W3WColor(light: .tertiaryLabelLight,   dark: .tertiaryLabelDark)
  static public let quaternaryLabel             = W3WColor(light: .quaternaryLabelLight, dark: .quaternaryLabelDark)
  
  static public let placeholderText          = W3WColor(light: .placeholderTextLight, dark: .placeholderTextDark)
  
  static public let separator             = W3WColor(light: .separatorLight,       dark: .separatorDark)
  static public let opaqueSeparator     = W3WColor(light: .opaqueSeparatorLight, dark: .opaqueSeparatorDark)
  
  static public let primaryFill       = W3WColor(light: .primaryFillLight, dark: .primaryFillDark)
  static public let secondaryFill    = W3WColor(light: .secondaryFillLight, dark: .secondaryFillDark)
  static public let tertiaryFill    = W3WColor(light: .tertiaryFillLight, dark: .tertiaryFillDark)
  static public let quaternaryFill  = W3WColor(light: .quaternaryFillLight, dark: .quaternaryFillDark)
  static public let quinaryFill     = W3WColor(light: .quinaryFillLight, dark: .quinaryFillDark)
  static public let senaryFill      = W3WColor(light: .senaryFillLight, dark: .senaryFillDark)
  
  static public let systemBlue      = W3WColor(light: .systemBlueLight,     dark: .systemBlueDark)
  static public let systemGreen     = W3WColor(light: .systemGreenLight,   dark: .systemGreenDark)
  static public let systemIndigo    = W3WColor(light: .systemIndigoLight, dark: .systemIndigoDark)
  static public let systemOrange    = W3WColor(light: .systemOrangeLight, dark: .systemOrangeDark)
  static public let systemPink      = W3WColor(light: .systemPinkLight,   dark: .systemPinkDark)
  static public let systemPurple    = W3WColor(light: .systemPurpleLight, dark: .systemPurpleDark)
  static public let systemRed       = W3WColor(light: .systemRedLight,    dark: .systemRedDark)
  static public let systemTeal      = W3WColor(light: .systemTealLight,   dark: .systemTealDark)
  static public let systemYellow    = W3WColor(light: .systemYellowLight, dark: .systemYellowDark)
  static public let systemGray      = W3WColor(light: .systemGrayLight,   dark: .systemGrayDark)
  static public let systemGray2     = W3WColor(light: .systemGray2Light,  dark: .systemGray2Dark)
  static public let systemGray3     = W3WColor(light: .systemGray3Light,  dark: .systemGray3Dark)
  static public let systemGray4     = W3WColor(light: .systemGray4Light,  dark: .systemGray4Dark)
  static public let systemGray5     = W3WColor(light: .systemGray5Light,  dark: .systemGray5Dark)
  static public let systemGray6     = W3WColor(light: .systemGray6Light,  dark: .systemGray6Dark)
  
}


// MARK: W3WBaseColors


extension W3WBaseColors {
  
  static public let none  = W3WBaseColors(foreground: nil, background: nil)
  static public let basic = W3WBaseColors(foreground: .text, background: .background)
  static public let error = W3WBaseColors(foreground: .white, background: .red)
  static public let good  = W3WBaseColors(foreground: .white, background: .green)
  
  static public let demo  = W3WColorScheme(foreground: .labelColourLight, background: .darkBlue)
  
  static public let cellIconFilled = W3WBaseColors(foreground: .white, background: .systemBlue)
  
  static public let highlight = W3WBaseColors(background: .highlightBackground)
  
  // color sets
  
  static public let iconGray      = W3WColorSet(foreground: .systemGray, background: .clear, tint: .systemGray, secondary: .systemGray)
  static public let iconBlue      = W3WColorSet(foreground: W3WColor(light: .darkBlue, dark: .white), background: .clear, tint: W3WColor(light: .darkBlue, dark: .white), secondary: W3WColor(light: .darkBlue, dark: .white))
  static public let iconBlueFill  = W3WColorSet(foreground: W3WColor(light: .darkBlue, dark: .white), background: .clear, tint: W3WColor(light: .white, dark: .darkBlue), secondary: W3WColor(light: .darkBlue, dark: .white))
  static public let iconBlack     = W3WColorSet(foreground: .foreground, background: .clear, tint: .foreground, secondary: .foreground)
  static public let iconBlackFill = W3WColorSet(foreground: .foreground, background: .clear, tint: .background, secondary: .foreground)
  //static public let iconWhite     = W3WColorSet(foreground: .background, background: .clear, tint: .background, secondary: .background)
  //static public let iconWhiteFill = W3WColorSet(foreground: .background, background: .clear, tint: .foreground, secondary: .background)
  static public let iconRed       = W3WColorSet(foreground: .red, background: .clear, tint: .red, secondary: .red)
  static public let iconRedFill    = W3WColorSet(foreground: .red, background: .clear, tint: .white, secondary: .red)

  static public let emptyColorSet   = W3WColorSet(foreground: nil, background: nil, tint: nil, secondary: nil)
  
  static public let blackGrayRed     = W3WColorSet(foreground: .black,    background: .white,        tint: .red,     secondary: .secondaryDarkGray)
  static public let darkBlueGrayRed   = W3WColorSet(foreground: .darkBlue, background: .white,          tint: .red,     secondary: .secondaryDarkGray)
  static public let lightDarkMode      = W3WColorSet(foreground: .text,     background: .background,       tint: .red,     secondary: .secondaryDarkGray)
  static public let blackWhitePowder   = W3WColorSet(foreground: .black,    background: .powderBlue,         tint: .black,   secondary: .secondaryGray)
  static public let whiteGrayRed       = W3WColorSet(foreground: .white,    background: .offDarkGrey,          tint: .red,     secondary: .secondaryGray)
  static public let blackWhiteBlue    = W3WColorSet(foreground: .black,    background: .secondarySystemBackground, tint: .systemBlue, secondary: .secondaryGray)
  static public let blackWhite       = W3WColorSet(foreground: .black,    background: .white,                      tint: .black,       secondary: .black)
  static public let halo            = W3WColorSet(foreground: .red.with(alpha: 0.15), background: .red.with(alpha: 0.1), tint: .red.with(alpha: 0.3), secondary: .red.with(alpha: 0.15))
  static public let mapPinDefault   = W3WColorSet(foreground: .white, background: .blue, tint: .blue, secondary: .blue)
  
  static public let searchBox       = W3WColorSet(foreground: .black, background: W3WColor(all: W3WCoreColor(hex: 0x767680, alpha: 0.12)), tint: .labelColourLight, secondary: .labelColourLight)
  static public let searchIcon      = W3WColorSet(foreground: .secondaryLabel, background: .clear, tint: .secondaryLabel,   secondary: .secondaryLabel)
  static public let microphoneOff    = W3WColorSet(foreground: .red,   background: .clear,       tint: .white, secondary: .red)
  static public let microphoneOn      = W3WColorSet(foreground: .red,   background: .clear,       tint: .red,   secondary: .red)
  static public let microphoneGray      = W3WColorSet(foreground: .secondaryLabel, background: .clear, tint: .secondaryLabel,   secondary: .secondaryLabel)
  static public let microphoneWhiteBlack  = W3WColorSet(foreground: .white, background: .white, tint: .black,   secondary: .white)
  static public let microphoneRedWhiteLogo = W3WColorSet(foreground: .red, background: .red, tint: .white, secondary: .red)
  static public let microphoneWhiteOutline = W3WColorSet(foreground: .white, background: .red, tint: .white, secondary: .white)

  //static public let blackGrayRedScheme     = W3WColorScheme(main: .blackGrayRed, brand: .darkBlue, highlight: W3WBaseColors(foreground: .text, background: .darkBlue), border: .mediumGrey, separator: .lightGrey, shadow: .offDarkGrey, placeholder: .mediumGrey, error: .error)
  static public let blackGrayRedScheme     = W3WColorScheme(foreground: .black, background: .white, tint: .red, secondary: .secondaryDarkGray, brand: .darkBlue, highlight: W3WBaseColors(foreground: .text, background: .darkBlue), border: .mediumGrey, separator: .lightGrey, shadow: .offDarkGrey, placeholder: .mediumGrey, error: .error)
  static public let darkBlueGrayRedScheme  = W3WColorScheme(foreground: .darkBlue, background: .white, tint: .red, secondary: .secondaryDarkGray, brand: .darkBlue, highlight: W3WBaseColors(foreground: .text, background: .darkBlue), border: .mediumGrey, separator: .lightGrey, shadow: .offDarkGrey, placeholder: .mediumGrey, error: .error)

  //static public let darkBlueGrayRedScheme  = W3WColorScheme(main: .darkBlueGrayRed, brand: .darkBlue, highlight: W3WBaseColors(foreground: .text, background: .darkBlue), border: .mediumGrey, separator: .lightGrey, shadow: .offDarkGrey, placeholder: .mediumGrey, error: .error)

  //, positive: W3WBaseColors(foreground: .white, background: .green), negative: W3WBaseColors(foreground: .white, background: .red)
  //, positive: W3WBaseColors(foreground: .white, background: .green), negative: W3WBaseColors(foreground: .white, background: .red)
  
}
