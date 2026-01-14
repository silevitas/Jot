//
//  JotApp.swift
//  Jot
//
//  Updated for SwiftUI and Swift 6
//

import SwiftUI

@main
struct JotApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        // Empty scene - the app uses a menu bar popover
        Settings {
            EmptyView()
        }
    }
}
