//  TemplateAssemblies.swift
//  Created by Václav Brož on 12/8/2021

import Swinject

// MARK: - Default -
struct DefaultTemplateAssembly: Assembly {
    func assemble(container: Container) {
        container.register(TemplateView.self) { resolver in
            let templateState = resolver.resolve(TemplateState.self)!
            return TemplateView(interactor: resolver.resolve(TemplateInteractable.self,
                                                             argument: templateState)!,
                                router: resolver.resolve(TemplateRoutable.self)!,
                                state: templateState)
        }

        container.register(TemplateInteractable.self) { _, templateState in
            DefaultTemplateInteractor(state: templateState)
        }
        
        container.register(TemplateState.self) { _ in
            TemplateState()
        }

        container.register(TemplateRoutable.self) { _ in
            DefaultTemplateRouter()
        }
    }
}

// MARK: - Preview -
struct PreviewTemplateAssembly: Assembly {
    func assemble(container: Container) {
        container.register(TemplateView.self) { resolver in
            return TemplateView(interactor: resolver.resolve(TemplateInteractable.self)!,
                                router: resolver.resolve(TemplateRoutable.self)!,
                                state: resolver.resolve(TemplateState.self)!)
        }

        container.register(TemplateInteractable.self) { _ in
            PreviewTemplateInteractor()
        }
        
        container.register(TemplateState.self) { _ in
            TemplateState()
        }

        container.register(TemplateRoutable.self) { _ in
            PreviewTemplateRouter()
        }
    }
}
