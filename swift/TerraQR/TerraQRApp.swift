
//
//  TerraQRApp.swift
//  TerraQR
//
//  Created by Dan Taeyoung on 3/29/23.
//

import SwiftUI

@main
struct TerraQRApp: App {
    var body: some Scene {
        MenuBarExtra("TerraQR", systemImage: "wand.and.rays") {
            DropdownView()
        }.menuBarExtraStyle(.window)
        WindowGroup {
        }
    }
}
