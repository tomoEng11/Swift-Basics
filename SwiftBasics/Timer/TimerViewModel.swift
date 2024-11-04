//
//  TimerViewModel.swift
//  SwiftBasics
//
//  Created by tomo on 2024/10/31.
//

import Foundation
import Combine

final class TimerViewModel: ObservableObject {
    @Published var count = 0
    @Published var count2 = 0
    private var timer: Timer?
    private var timer2: Timer?

    // Case1
    func start() {
        // 1秒ごとに1を送るコールバック
        oneSecondTimer { value in
            Task { @MainActor in
                self.count += value
                print("count: \(self.count)")
            }
        }

        // 10秒ごとに10を送るコールバック
        tenSecondsTimer { value in
            Task { @MainActor in
                self.count2 += value
                print("count2: \(self.count2)")
            }
        }
    }

    // 1秒ごとにIntの1を呼び出し元に投げる
    private func oneSecondTimer(callback: @escaping (Int) -> Void) {
        timer = Timer.scheduledTimer(withTimeInterval: 20, repeats: true) { _ in
            callback(1)
            print("1を出力")
        }
    }

    // 10秒ごとにIntの10を呼び出し元に投げる
    private func tenSecondsTimer(callback: @escaping (Int) -> Void) {
        timer2 = Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { _ in
            callback(10)
            print("10を出力")
        }
    }

    func cancel() {
        timer?.invalidate() // タイマーの実行をキャンセル
        timer = nil // タイマーインスタンスをnil
        timer2?.invalidate()
        timer2 = nil
    }

    func reset() {
        cancel()
        count = 0
        count2 = 0
    }

// Case2
//    func start() {
//        // 1秒ごとに1を送るコールバック
//        oneSecondTimer { value in
//            Task { @MainActor in
//                await self.pauseFiveSeconds()
//                self.count += value
//                print("count: \(self.count)")
//            }
//        }
//
//        tenSecondsTimer { value in
//            Task { @MainActor in
//                self.count2 += value
//                print("count2: \(self.count2)")
//            }
//        }
//    }
//
//    // 1秒ごとにIntの1を呼び出し元に投げる
//    private func oneSecondTimer(callback: @escaping (Int) -> Void) {
//        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
//            callback(1)
//            print("1を出力")
//        }
//    }
//
//    // 10秒ごとにIntの10を呼び出し元に投げる
//    private func tenSecondsTimer(callback: @escaping (Int) -> Void) {
//        timer2 = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { _ in
//            callback(10)
//            print("10を出力")
//        }
//    }
//
//    func cancel() {
//        timer?.invalidate() // タイマーの実行をキャンセル
//        timer = nil // タイマーインスタンスをnil
//        timer2?.invalidate()
//        timer2 = nil
//
//    }
//
//    // 5秒待機する関数
//    private func pauseFiveSeconds() async {
//        do {
//            try await Task.sleep(nanoseconds: 5 * 1_000_000_000)
//        } catch {
//            print("タイマーエラー")
//        }
//    }
//
//    func reset() {
//        cancel()
//        count = 0
//        count2 =0
//    }


}
