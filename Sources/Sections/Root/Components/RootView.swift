//  RootView.swift
//  Created by Václav Brož on 4/9/2021

import SwiftUI

struct RootView: View {
    let childViewsFactory: RootChildViewsFactorable
    @EnvironmentObject var routing: Routing
    
    var body: some View {
        switch routing.root.section {
        case .template:
            childViewsFactory.getTemplate()
        }
    }
}
