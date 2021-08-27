//  Routing.swift
//  Created by Václav Brož on 13/8/2021

import Combine

class Routing: ObservableObject {
    // MARK: - Properties -
    @Published var initialSection: InitialSection = .template
    
    // MARK: - Nested Types -
    enum InitialSection {
        case template
    }
}
