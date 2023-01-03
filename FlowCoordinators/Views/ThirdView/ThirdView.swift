//
//  ThirdView.swift
//  FlowCoordinators
//
//  Created by Madalin Zaharia on 02.01.2023.
//

import SwiftUI

struct ThirdView<VM: ThirdViewModelProtocol & ThirdFlowStateProtocol>: View {

    @StateObject var viewModel: VM

    var body: some View {
        ThirdFlowCoordinator(state: viewModel, content: content)
    }

    @ViewBuilder
    private func content() -> some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            Text(viewModel.text)
        }
    }
}
