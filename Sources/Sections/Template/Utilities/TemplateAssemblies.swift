//  TemplateAssemblies.swift
//  Created by Václav Brož on 12/8/2021

import Swinject

// MARK: - Default -
struct DefaultTemplateAssembly: Assembly {
    func assemble(container: Container) {
        container.register(TemplateView.self) { resolver, assembler in
            TemplateView(interactor: resolver.resolve(TemplateInteractable.self)!,
                         router: resolver.resolve(TemplateRoutesFactorable.self,
                                                  argument: assembler as Assembler)!,
                         state: resolver.resolve(TemplateState.self)!)
        }
        
        container.register(TemplateInteractable.self) { resolver in
            DefaultTemplateInteractor(state: resolver.resolve(TemplateState.self)!,
                                      appState: resolver.resolve(AppState.self)!,
                                      routing: resolver.resolve(Routing.self)!)
        }
        
        container.register(TemplateState.self) { _ in
            TemplateState()
        }

        container.register(TemplateRoutesFactorable.self) { _, assembler in
            DefaultTemplateRoutesFactory(assembler: assembler)
        }
    }
}

// MARK: - Preview -
struct PreviewTemplateAssembly: Assembly {
    func assemble(container: Container) {
        container.register(TemplateView.self) { resolver in
            return TemplateView(interactor: resolver.resolve(TemplateInteractable.self)!,
                                router: resolver.resolve(TemplateRoutesFactorable.self)!,
                                state: resolver.resolve(TemplateState.self)!)
        }

        container.register(TemplateInteractable.self) { _ in
            PreviewTemplateInteractor()
        }
        
        container.register(TemplateState.self) { _ in
            TemplateState()
        }

        container.register(TemplateRoutesFactorable.self) { _ in
            PreviewTemplateRoutesFactory()
        }
    }
}
