//  TemplateSwiftUIApp.swift
//  Created by Václav Brož on 12/8/2021

import SwiftUI
import Swinject

@main
struct TemplateSwiftUIApp: App {
    // MARK: - Properties -
    let assembler = Assembler()
    let appState: AppState
    let routing: Routing
    
    // MARK: - Body -
    var body: some Scene {
        WindowGroup {
            getRootView()
                .environmentObject(appState)
                .environmentObject(routing)
        }
    }
    
    
    // MARK: - Initialiazer -
    init() {
        assembler.apply(assembly: AppAssembly())
        appState = assembler.resolver.resolve(AppState.self)!
        routing = assembler.resolver.resolve(Routing.self)!
    }
    
    // MARK: - Methods -
    func getRootView() -> RootView {
        assembler.apply(assembly: RootAssembly())
        return assembler.resolver.resolve(RootView.self, argument: assembler)!
    }
}
