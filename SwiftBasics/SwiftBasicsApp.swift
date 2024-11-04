//
//  SwiftBasicsApp.swift
//  SwiftBasics
//
//  Created by tomo on 2024/10/31.
//

import SwiftUI

@main
struct SwiftBasicsApp: App {
    var body: some Scene {
        WindowGroup {
            TimerView(viewModel: TimerViewModel())
//            RockPaperScissorsView(viewModel: RockPaperScissorsViewModel())
        }
    }
}
