//  TemplateInteractor.swift
//  Created by Václav Brož on 12/8/2021

struct TemplateInteractor: TemplateInteractable {
    // MARK: - Properties -
    private unowned let state: TemplateState
    
    // MARK: - Initialiazer -
    init(state: TemplateState) {
        self.state = state
    }
}
