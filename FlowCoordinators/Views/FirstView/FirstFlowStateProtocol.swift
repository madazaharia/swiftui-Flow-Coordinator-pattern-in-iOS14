//
//  FirstFlowStateProtocol.swift
//  FlowCoordinators
//
//  Created by Madalin Zaharia on 02.01.2023.
//

import Foundation

protocol FirstFlowStateProtocol: ObservableObject {
    var activeLink: FirstLink? { get set }
}
