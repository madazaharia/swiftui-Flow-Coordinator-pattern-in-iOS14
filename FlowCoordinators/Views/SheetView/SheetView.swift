//
//  SheetView.swift
//  FlowCoordinators
//
//  Created by Madalin Zaharia on 02.01.2023.
//

import SwiftUI

struct SheetView<VM: SheetViewModelProtocol & SheetFlowStateProtocol>: View {

    @StateObject var viewModel: VM

    var body: some View {
        SheetFlowCoordinator(state: viewModel, content: content)
    }

    @ViewBuilder
    private func content() -> some View {
        ZStack {
            Color.yellow.ignoresSafeArea()
            Text(viewModel.text)
        }
    }
}
