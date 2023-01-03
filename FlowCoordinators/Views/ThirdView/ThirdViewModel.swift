//
//  ThirdViewModel.swift
//  FlowCoordinators
//
//  Created by Madalin Zaharia on 02.01.2023.
//

import Foundation

final class ThirdViewModel: ThirdViewModelProtocol, ThirdFlowStateProtocol {

    // MARK: - Flow State
    @Published var activeLink: ThirdLink?

    // MARK: - View Model
    let text = "Default Third View"

    init() { }
}
