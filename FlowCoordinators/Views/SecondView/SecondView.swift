//
//  SecondView.swift
//  FlowCoordinators
//
//  Created by Madalin Zaharia on 02.01.2023.
//

import SwiftUI

struct SecondView<VM: SecondViewModelProtocol & SecondFlowStateProtocol>: View {

    @StateObject var viewModel: VM

    var body: some View {
        SecondFlowCoordinator(state: viewModel, content: content)
    }

    @ViewBuilder
    private func content() -> some View {
        ZStack {
            Color.green.ignoresSafeArea()
            Text(viewModel.text)
        }
    }
}
