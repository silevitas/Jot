//
//  JotViewModel.swift
//  Jot
//
//  Created for SwiftUI and Swift 6
//

import Foundation
import Observation

@Observable
@MainActor
final class JotViewModel: Sendable {
    var textContent: String {
        didSet {
            saveText()
        }
    }
    
    private let defaults = UserDefaults.standard
    private let textContentKey = "textContent"
    
    init() {
        self.textContent = defaults.string(forKey: textContentKey) ?? ""
    }
    
    private func saveText() {
        defaults.set(textContent, forKey: textContentKey)
    }
}
