//
//  ContentView.swift
//  FlowCoordinators
//
//  Created by Madalin Zaharia on 02.01.2023.
//

import SwiftUI

struct ContentView<VM: ContentViewModelProtocol & ContentFlowStateProtocol>: View {

    @StateObject var viewModel: VM

    // MARK: - Drawing
    var body: some View {
        ContentFlowCoordinator(state: viewModel, content: content)
    }

    @ViewBuilder
    private func content() -> some View {
        ZStack {
            Color.white.ignoresSafeArea()

            VStack(spacing: 16) {
                Text(viewModel.text)
                
                Button(action: viewModel.firstAction) {
                    Text("First view ->")
                }
                
                Button(action: viewModel.secondAction) {
                    Text("Second view ->")
                }
                
                Button(action: viewModel.thirdAction) {
                    Text("Third view ->")
                }
                
                Button(action: viewModel.sheetAction) {
                    Text("Sheet view")
                }
            }
        }
        .navigationBarTitle("Title", displayMode: .inline)
    }
}
