//  AppAssembly.swift
//  Created by Václav Brož on 13/8/2021

import Swinject

struct AppAssembly: Assembly {
    func assemble(container: Container) {
        container.register(AppState.self) { _ in
            AppState()
        }.inObjectScope(.container)
        
        container.register(Routing.self) { _ in
            Routing()
        }.inObjectScope(.container)
    }
}
