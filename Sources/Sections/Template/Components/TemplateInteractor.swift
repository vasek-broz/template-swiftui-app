//  TemplateInteractor.swift
//  Created by Václav Brož on 12/8/2021

struct TemplateInteractor {
    let router: TemplateRoutable
    let state: TemplateState
    let appState: AppState
}

extension TemplateInteractor: TemplateInteractable {}
