//
//  FutureUIApp.swift
//  Shared
//
//  Created by Felix Akira Green on 1/24/21.
//

import SwiftUI

@main
struct FutureUIApp: App {
	@NSApplicationDelegateAdaptor(AppDelegate.self) var delegate

	var body: some Scene {
		WindowGroup {
			ContentView()
		}
		.windowStyle(HiddenTitleBarWindowStyle())
		.windowToolbarStyle(UnifiedCompactWindowToolbarStyle())
	}
}
