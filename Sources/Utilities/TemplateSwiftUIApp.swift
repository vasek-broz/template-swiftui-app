//  TemplateSwiftUIApp.swift
//  Created by Václav Brož on 12/8/2021

import SwiftUI
import Swinject

@main
struct TemplateSwiftUIApp: App {
    // MARK: - Properties -
    let assembler = Assembler()
    @ObservedObject var appState: AppState
    @ObservedObject var routing: Routing
    
    // MARK: - Body -
    var body: some Scene {
        return WindowGroup {
            switch routing.initialSection {
            case .template:
                getTemplateView()
                    .environmentObject(appState)
                    .environmentObject(routing)
            }
        }
    }
    
    // MARK: - Initialiazer -
    init() {
        assembler.apply(assembly: AppAssembly())
        appState = assembler.resolver.resolve(AppState.self)!
        routing = assembler.resolver.resolve(Routing.self)!
    }
    
    // MARK: - Methods -
    func getTemplateView() -> TemplateView {
        assembler.apply(assembly: TemplateAssembly())
        return assembler.resolver.resolve(TemplateView.self, argument: assembler)!
    }
}
