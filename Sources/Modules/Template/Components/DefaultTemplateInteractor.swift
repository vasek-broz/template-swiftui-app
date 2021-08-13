//  DefaultTemplateInteractor.swift
//  Created by Václav Brož on 12/8/2021

struct DefaultTemplateInteractor {
    let state: TemplateState
    let appState: AppState
    let routingFlags: RoutingFlags
}

extension DefaultTemplateInteractor: TemplateInteractable {}
