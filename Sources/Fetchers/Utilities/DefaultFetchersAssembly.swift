//  DefaultFetchersAssembly.swift
//  Created by Václav Brož on 21/12/2021

import Swinject

struct DefaultFetchersAssembly: Assembly {
    func assemble(container: Container) {
        container.register(TemplateFetchable.self) { resolver in
            DefaultTemplateFetcher(provider: resolver.resolve(TargetNetworkingProvider<TemplateTarget>.self)!)
        }
    }
}
