//  Copyright © 2024 Checkout.com. All rights reserved.

#if canImport(CheckoutComponents)
import CheckoutComponents
#elseif canImport(CheckoutComponentsSDK)
import CheckoutComponentsSDK
#endif

import SwiftUI

struct DarkTheme {

  let designToken: CheckoutComponents.DesignTokens

  init() {
    let colorTokens: CheckoutComponents.ColorTokens = .init(
      action: Color(hex: "#FFFF00"),
      background: Color(hex: "#17201E"),
      border: Color(hex: "#00CC2D"),
      disabled: Color(hex: "#BBFFB9"),
      error: Color(hex: "#FF0000"),
      formBackground: Color(hex: "#24302D"),
      formBorder: .white,
      inverse: .black,
      outline: Color(hex: "#B1B1B1"),
      primary: Color(hex: "#B1B1B1"),
      secondary: .white
    )
    
    let buttonFont: CheckoutComponents.Font = .init(
      font: .custom("HelveticaNeue-Bold", size: 20),
      lineHeight: 2,
      letterSpacing: 2
    )
    
    let subheadingFont: CheckoutComponents.Font = .init(
      font: .custom("HelveticaNeue-Light", size: 20),
      lineHeight: 2,
      letterSpacing: 2
    )
    
    let inputFont: CheckoutComponents.Font = .init(
      font: .custom("HelveticaNeue-Bold", size: 20),
      lineHeight: 2,
      letterSpacing: 2
    )
    
    let labelFont: CheckoutComponents.Font = .init(
      font: .custom("HelveticaNeue-Bold", size: 20),
      lineHeight: 2,
      letterSpacing: 2
    )
    
    self.designToken = .init(colorTokensMain: colorTokens,
                             fonts: .init(button: buttonFont,
                                          input: inputFont,
                                          label: labelFont,
                                          subheading: subheadingFont),
                             borderButtonRadius: .init(radius: 40,
                                                 corners: [.topLeft, .bottomRight]),
                             borderFormRadius: .init(radius: 20,
                                                     corners: [.topLeft, .topRight]))
  }
}
