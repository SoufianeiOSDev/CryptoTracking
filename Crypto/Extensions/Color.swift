//
//  Color.swift
//  Crypto
//
//  Created by Soufiane Benkhaldoun on 13/01/2022.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
    static let launch = LaunchColorTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
}

struct LaunchColorTheme {
    let launchAccentColor = Color("LaunchAccentColor")
    let launchBackgroundColor = Color("LaunchBackgroundColor")
}
