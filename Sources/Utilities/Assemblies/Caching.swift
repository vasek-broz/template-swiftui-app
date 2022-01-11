//  Caching.swift
//  Created by Václav Brož on 21/12/2021

import Swinject
import Moya

struct CachingAssembly: Assembly {
    func assemble(container: Container) {
        container.register(Cache<TemplateTarget, Response>.self) { _ in
            Cache<TemplateTarget, Response>()
        }.inObjectScope(.container)
    }
}
