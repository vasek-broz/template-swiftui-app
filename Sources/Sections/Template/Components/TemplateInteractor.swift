//  TemplateInteractor.swift
//  Created by Václav Brož on 12/8/2021

struct TemplateInteractor {
    let state: TemplateState
    let appState: AppState
    let routing: Routing
}

extension TemplateInteractor: TemplateInteractable {}
