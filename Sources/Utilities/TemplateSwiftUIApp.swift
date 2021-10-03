//  TemplateSwiftUIApp.swift
//  Created by Václav Brož on 12/8/2021

import SwiftUI
import Swinject

@main
struct TemplateSwiftUIApp: App {
    // MARK: - Properties -
    let assembler = Assembler()
    let appState: AppState
    
    // MARK: - Body -
    var body: some Scene {
        WindowGroup {
            TemplateRouter(assembler: assembler)
                .environmentObject(appState)
        }
    }
    
    
    // MARK: - Initialiazer -
    init() {
        assembler.apply(assembly: AppAssembly())
        appState = assembler.resolver.resolve(AppState.self)!
    }
}
