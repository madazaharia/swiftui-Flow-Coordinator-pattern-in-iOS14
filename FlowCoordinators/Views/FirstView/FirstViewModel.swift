//
//  FirstViewModel.swift
//  FlowCoordinators
//
//  Created by Madalin Zaharia on 02.01.2023.
//

import Foundation

final class FirstViewModel: FirstViewModelProtocol, FirstFlowStateProtocol {

    // MARK: - Flow State
    @Published var activeLink: FirstLink?

    // MARK: - View Model
    @Published var text: String

    init(text: String?) {
        if let text = text {
            self.text = "First View with text: \(text)"
        } else {
            self.text = "Default First View"
        }
    }
}
