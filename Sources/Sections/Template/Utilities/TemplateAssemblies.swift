//  TemplateAssemblies.swift
//  Created by Václav Brož on 12/8/2021

import Swinject

struct TemplateAssembly: Assembly {
    func assemble(container: Container) {
        container.register(TemplateView.self) { resolver, router in
            TemplateView(interactor: resolver.resolve(TemplateInteractable.self, argument: router as TemplateRoutable)!,
                         state: resolver.resolve(TemplateState.self)!)
        }
        
        container.register(TemplateInteractable.self) { resolver, router in
            TemplateInteractor(router: router,
                               state: resolver.resolve(TemplateState.self)!,
                               appState: resolver.resolve(AppState.self)!)
        }
        
        container.register(TemplateState.self) { _ in
            TemplateState()
        }
    }
}

// MARK: - Preview -
struct PreviewTemplateAssembly: Assembly {
    func assemble(container: Container) {
        container.register(TemplateView.self) { resolver in
            return TemplateView(interactor: resolver.resolve(TemplateInteractable.self)!,
                                state: resolver.resolve(TemplateState.self)!)
        }

        container.register(TemplateInteractable.self) { _ in
            PreviewTemplateInteractor()
        }
        
        container.register(TemplateState.self) { _ in
            TemplateState()
        }
    }
}
