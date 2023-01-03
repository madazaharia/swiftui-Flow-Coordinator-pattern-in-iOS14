//
//  ContentViewModelProtocol.swift
//  FlowCoordinators
//
//  Created by Madalin Zaharia on 02.01.2023.
//

import Foundation

protocol ContentViewModelProtocol: ObservableObject {
    var text: String { get }

    func firstAction()
    func secondAction()
    func thirdAction()
    func sheetAction()
}
