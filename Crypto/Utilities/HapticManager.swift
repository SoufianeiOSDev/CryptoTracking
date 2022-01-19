//
//  HapticManager.swift
//  Crypto
//
//  Created by Soufiane Benkhaldoun on 17/01/2022.
//

import Foundation
import SwiftUI

class HapticManager {
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
