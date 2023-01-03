//
//  SheetViewModelProtocol.swift
//  FlowCoordinators
//
//  Created by Madalin Zaharia on 02.01.2023.
//

import Foundation

protocol SheetViewModelProtocol: ObservableObject {
    var text: String { get }
}
