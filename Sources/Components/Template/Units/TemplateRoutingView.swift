//  TemplateRoutingView.swift
//  Created by Václav Brož on 3/10/2021

import SwiftUI
import Swinject

struct TemplateRoutingView: RoutingView {
    let assembler: Assembler
    
    var body: some View {
        assembler.apply(assembly: TemplateAssembly())
        return assembler.resolver.resolve(TemplateView.self, argument: self as TemplateRoutable)!
            .observeNotification(name: .dismissTemplate) { _ in }
    }
}

extension TemplateRoutingView: TemplateRoutable {}
