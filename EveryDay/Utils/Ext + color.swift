//
//  Ext + color.swift
//  EveryDay
//
//  Created by Alexander Suprun on 16.06.2024.
//

import Foundation
import SwiftUI


struct ColorSet {
    var background: LinearGradient
    var text: Color
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
           self.init(
               .sRGB,
               red: Double((hex >> 16) & 0xff) / 255,
               green: Double((hex >> 8) & 0xff) / 255,
               blue: Double(hex & 0xff) / 255,
               opacity: alpha
           )
       }
    static let backgound  = Color(hex: 0xE5E6E1)
    
    static let purpleback = Color(hex: 0xB9B2C9)
    static let purpletext = Color(hex: 0x443B5D)
    
    static let redback = Color(hex: 0xC49EA3)
    static let redtext = Color(hex: 0x522628)
    
    static let cyanback = Color(hex: 0x2BF0FF)
    static let cyantext = Color(hex: 0x265B58)

    static let greenback = Color(hex: 0xC2CBA1)
    static let greentext = Color(hex: 0x526123)
}
