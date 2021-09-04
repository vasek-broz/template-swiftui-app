//  RootAssemblies.swift
//  Created by Václav Brož on 4/9/2021

import Swinject

struct RootAssembly: Assembly {
    func assemble(container: Container) {
        container.register(RootView.self) { resolver, assembler in
            RootView(childViewsFactory: resolver.resolve(RootChildViewsFactorable.self,
                                                         argument: assembler as Assembler)!)
        }

        container.register(RootChildViewsFactorable.self) { _, assembler in
            RootChildViewsFactory(assembler: assembler)
        }
    }
}
