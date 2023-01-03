//
//  SecondViewModel.swift
//  FlowCoordinators
//
//  Created by Madalin Zaharia on 02.01.2023.
//

import Foundation

final class SecondViewModel: SecondViewModelProtocol, SecondFlowStateProtocol {

    // MARK: - Flow State
    @Published var activeLink: SecondLink?

    // MARK: - View Model
    @Published var text: String

    init(number: Int?) {
        if let number = number {
            self.text = "Second View with number: \(number)"
        } else {
            self.text = "Default Second View"
        }
    }
}
