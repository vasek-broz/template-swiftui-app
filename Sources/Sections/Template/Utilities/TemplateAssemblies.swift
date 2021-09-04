//  TemplateAssemblies.swift
//  Created by Václav Brož on 12/8/2021

import Swinject

struct TemplateAssembly: Assembly {
    func assemble(container: Container) {
        container.register(TemplateView.self) { resolver, assembler in
            TemplateView(interactor: resolver.resolve(TemplateInteractable.self)!,
                         childViewsFactory: resolver.resolve(TemplateChildViewsFactorable.self,
                                                             argument: assembler as Assembler)!,
                         state: resolver.resolve(TemplateState.self)!)
        }
        
        container.register(TemplateInteractable.self) { resolver in
            TemplateInteractor(state: resolver.resolve(TemplateState.self)!,
                               appState: resolver.resolve(AppState.self)!,
                               routing: resolver.resolve(Routing.self)!)
        }
        
        container.register(TemplateState.self) { _ in
            TemplateState()
        }

        container.register(TemplateChildViewsFactorable.self) { _, assembler in
            TemplateChildViewsFactory(assembler: assembler)
        }
    }
}

// MARK: - Preview -
struct PreviewTemplateAssembly: Assembly {
    func assemble(container: Container) {
        container.register(TemplateView.self) { resolver in
            return TemplateView(interactor: resolver.resolve(TemplateInteractable.self)!,
                                childViewsFactory: resolver.resolve(TemplateChildViewsFactorable.self)!,
                                state: resolver.resolve(TemplateState.self)!)
        }

        container.register(TemplateInteractable.self) { _ in
            PreviewTemplateInteractor()
        }
        
        container.register(TemplateState.self) { _ in
            TemplateState()
        }

        container.register(TemplateChildViewsFactorable.self) { _ in
            PreviewTemplateChildViewsFactory()
        }
    }
}
