//  DefaultTemplateInteractor.swift
//  Created by Václav Brož on 12/8/2021

struct DefaultTemplateInteractor: TemplateInteractable {
    // MARK: - Properties -
    private let state: TemplateState
    
    // MARK: - Initialiazer -
    init(state: TemplateState) {
        self.state = state
    }
}
