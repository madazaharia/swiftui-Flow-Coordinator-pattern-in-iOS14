//
//  ContentFlowCoordinator.swift
//  FlowCoordinators
//
//  Created by Madalin Zaharia on 02.01.2023.
//

import SwiftUI

struct ContentFlowCoordinator<State: ContentFlowStateProtocol, Content: View>: View {

    @ObservedObject var state: State
    let content: () -> Content

    private var activeLink: Binding<ContentLink?> {
        $state.activeLink.map(get: { $0?.navigationLink }, set: { $0 })
    }

    private var sheetItem: Binding<ContentLink?> {
        $state.activeLink.map(get: { $0?.sheetItem }, set: { $0 })
    }

    var body: some View {
        NavigationView {
            ZStack {
                content()
                    .sheet(item: sheetItem, content: sheetContent)

                navigationLinks
            }
        }
        .navigationViewStyle(.stack)
    }

    @ViewBuilder
    private var navigationLinks: some View {
        NavigationLink(tag: .firstLink, selection: activeLink, destination: firstDestination) { EmptyView() }
        NavigationLink(tag: .secondLink, selection: activeLink, destination: secondDestination) { EmptyView() }
        NavigationLink(tag: .thirdLink, selection: activeLink, destination: thirdDestination) { EmptyView() }
    }

    private func firstDestination() -> some View {
        var text: String?
        if case let .firstLinkParametrized(param) = state.activeLink {
            text = param
        }

        let viewModel = FirstViewModel(text: text)
        let view = FirstView(viewModel: viewModel)
        return view 
    }

    private func secondDestination() -> some View {
        var number: Int?
        if case let .secondLinkParametrized(param) = state.activeLink {
            number = param
        }

        let viewModel = SecondViewModel(number: number)
        let view = SecondView(viewModel: viewModel)
        return view
    }

    private func thirdDestination() -> some View {
        let viewModel = ThirdViewModel()
        let view = ThirdView(viewModel: viewModel)
        return view
    }

    @ViewBuilder
    private func sheetContent(sheetItem: ContentLink) -> some View {
        switch sheetItem {
        case let .sheetLink(item):
            SheetView(viewModel: SheetViewModel(text: item))
        default:
            EmptyView()
        }
    }
}
