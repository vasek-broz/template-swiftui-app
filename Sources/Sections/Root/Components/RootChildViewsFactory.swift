//  RootChildViewsFactory.swift
//  Created by Václav Brož on 4/9/2021

import Swinject
import SwiftUI

struct RootChildViewsFactory {
    let assembler: Assembler
}

extension RootChildViewsFactory: RootChildViewsFactorable {
    func getTemplate() -> AnyView {
        assembler.apply(assembly: TemplateAssembly())
        let templateView = assembler.resolver.resolve(TemplateView.self, argument: assembler)!
        return AnyView(templateView)
    }
}
