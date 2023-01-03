//
//  ContentFlowStateProtocol.swift
//  FlowCoordinators
//
//  Created by Madalin Zaharia on 02.01.2023.
//

import Foundation

protocol ContentFlowStateProtocol: ObservableObject {
    var activeLink: ContentLink? { get set }
}
