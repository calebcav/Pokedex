//
//  PokeDexApp.swift
//  PokeDex
//
//  Created by Caleb Caviness on 10/13/24.
//

import SwiftUI

@main
struct PokeDexApp: App {
    
    private func loadRocketSimConnect() {
        #if DEBUG
        guard (Bundle(path: "/Applications/RocketSim.app/Contents/Frameworks/RocketSimConnectLinker.nocache.framework")?.load() == true) else {
            print("Failed to load linker framework")
            return
        }
        print("RocketSim Connect successfully linked")
        #endif
    }
    
    init () {
        loadRocketSimConnect()
    }
    var body: some Scene {
        WindowGroup {
            PokeDexTableView()
        }
    }
}
