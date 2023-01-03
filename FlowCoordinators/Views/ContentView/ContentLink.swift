//
//  ContentLink.swift
//  FlowCoordinators
//
//  Created by Madalin Zaharia on 02.01.2023.
//

import Foundation

enum ContentLink: Hashable, Identifiable {
    case firstLink
    case firstLinkParametrized(text: String)
    
    case secondLink
    case secondLinkParametrized(number: Int)
    
    case thirdLink
    case sheetLink(item: String)
    
    var navigationLink: ContentLink {
        switch self {
        case .firstLinkParametrized:
            return .firstLink
            
        case .secondLinkParametrized:
            return .secondLink
            
        default:
            return self
        }
    }
    
    var sheetItem: ContentLink? {
        switch self {
        case .sheetLink:
            return self
        default:
            return nil
        }
    }
    
    var id: String {
        switch self {
        case .firstLink, .firstLinkParametrized:
            return "first"
            
        case .secondLink, .secondLinkParametrized:
            return "second"
            
        case .thirdLink:
            return "third"
            
        case let .sheetLink(item):
            return item
        }
    }
}
