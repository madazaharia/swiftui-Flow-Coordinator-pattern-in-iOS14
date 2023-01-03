//
//  FirstFlowCoordinator.swift
//  FlowCoordinators
//
//  Created by Madalin Zaharia on 02.01.2023.
//

import SwiftUI

struct FirstFlowCoordinator<State: FirstFlowStateProtocol, Content: View>: View {

    @ObservedObject var state: State
    let content: () -> Content

    var body: some View {
        content()
    }
}
