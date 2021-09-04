//  Routing.swift
//  Created by Václav Brož on 13/8/2021

import Combine

class Routing: ObservableObject {
    // MARK: - Properties -
    @Published var root = Root()
    
    // MARK: - Nested Types -
    struct Root {
        let section = Section.template
        
        enum Section {
            case template
        }
    }
}
