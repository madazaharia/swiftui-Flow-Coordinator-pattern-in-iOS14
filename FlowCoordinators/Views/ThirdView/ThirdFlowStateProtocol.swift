//
//  ThirdFlowStateProtocol.swift
//  FlowCoordinators
//
//  Created by Madalin Zaharia on 02.01.2023.
//

import Foundation

protocol ThirdFlowStateProtocol: ObservableObject {
    var activeLink: ThirdLink? { get set }
}
