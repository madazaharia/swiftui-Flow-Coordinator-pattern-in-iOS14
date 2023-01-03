//
//  SheetViewModel.swift
//  FlowCoordinators
//
//  Created by Madalin Zaharia on 02.01.2023.
//

import Foundation

final class SheetViewModel: SheetViewModelProtocol, SheetFlowStateProtocol {

    // MARK: - Flow State
    @Published var activeLink: ThirdLink?

    // MARK: - View Model
    @Published var text: String

    init(text: String) {
        self.text = "Sheet view with \(text)"
    }
}
