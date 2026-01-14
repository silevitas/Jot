//
//  AppDelegate.swift
//  Jot
//
//  Updated for SwiftUI and Swift 6
//

import SwiftUI

@MainActor
final class AppDelegate: NSObject, NSApplicationDelegate {
    
    private var statusItem: NSStatusItem?
    private var popover: NSPopover?
    
    nonisolated func applicationDidFinishLaunching(_ aNotification: Notification) {
        Task { @MainActor in
            setupMenuBar()
        }
    }
    
    private func setupMenuBar() {
        // Create status item
        let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        self.statusItem = statusItem
        
        if let button = statusItem.button {
            button.image = NSImage(named: "StatusBarButtonImage")
            button.action = #selector(togglePopover(_:))
            button.target = self
        }
        
        // Create popover with SwiftUI view
        let popover = NSPopover()
        popover.contentSize = NSSize(width: 300, height: 400)
        popover.behavior = .transient
        popover.contentViewController = NSHostingController(rootView: JotView())
        self.popover = popover
    }
    
    @objc private func togglePopover(_ sender: Any?) {
        guard let popover = popover else { return }
        
        if popover.isShown {
            closePopover(sender: sender)
        } else {
            showPopover(sender: sender)
        }
    }
    
    private func showPopover(sender: Any?) {
        guard let popover = popover,
              let button = statusItem?.button else { return }
        
        popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
    }
    
    private func closePopover(sender: Any?) {
        popover?.performClose(sender)
    }
}

extension AppDelegate: Sendable {}

