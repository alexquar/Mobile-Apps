//
//  MenuAppApp.swift
//  MenuApp
//
//  Created by Alex on 2024-10-11.
//

import SwiftUI

@main
struct MenuApp: App {
    var order = Order()
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
