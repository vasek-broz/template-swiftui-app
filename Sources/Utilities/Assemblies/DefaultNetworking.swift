//  DefaultNetworking.swift
//  Created by Václav Brož on 20/12/2021

import Swinject
import Moya

struct DefaultNetworkingAssembly: Assembly {
    func assemble(container: Container) {
        container.register(TargetNetworkingProvider<TemplateTarget>.self) { resolver in
            TargetNetworkingProvider<TemplateTarget>(cache: resolver.resolve(Cache<TemplateTarget, Response>.self)!)
        }
    }
}
