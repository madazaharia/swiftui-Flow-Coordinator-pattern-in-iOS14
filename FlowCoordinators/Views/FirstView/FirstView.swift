//
//  FirstView.swift
//  FlowCoordinators
//
//  Created by Madalin Zaharia on 02.01.2023.
//

import SwiftUI

struct FirstView<VM: FirstViewModelProtocol & FirstFlowStateProtocol>: View {

    @StateObject var viewModel: VM

    var body: some View {
        FirstFlowCoordinator(state: viewModel, content: content)
    }

    @ViewBuilder
    private func content() -> some View {
        ZStack {
            Color.red.ignoresSafeArea()
            
            Text(viewModel.text)
        }
    }
}
