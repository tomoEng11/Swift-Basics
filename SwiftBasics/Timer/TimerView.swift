//
//  TimerView.swift
//  SwiftBasics
//
//  Created by tomo on 2024/10/31.
//

import SwiftUI

struct TimerView: View {
    @StateObject var viewModel:  TimerViewModel

    var body: some View {
        VStack(spacing: 25) {

            Text("\(viewModel.count)")
                .font(.system(size: 50, weight: .bold))


            Button(action: {
                viewModel.start()
                print("スタートボタンが押されました")
            }) {
                Text("スタート")
                    .foregroundStyle(.white)
                    .font(.headline)
            }
            .padding()
            .frame(width: 250)
            .background(Color.pink, in: RoundedRectangle(cornerRadius: 10))

            Button(action: {
                viewModel.cancel()
            }) {
                Text("ストップ")
                    .foregroundStyle(.white)
                    .font(.headline)
            }
            .padding()
            .frame(width: 250)
            .background(Color.blue, in: RoundedRectangle(cornerRadius: 10))

            Button(action: {
                viewModel.reset()
            }) {
                Text("リセット")
                    .foregroundStyle(.white)
                    .font(.headline)
            }
            .padding()
            .frame(width: 250)
            .background(Color.orange, in: RoundedRectangle(cornerRadius: 10))
        }

    }
}

#Preview {
    TimerView(viewModel: TimerViewModel())
}
