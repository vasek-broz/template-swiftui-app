//  TemplateSwiftUIApp.swift
//  Created by Václav Brož on 12/8/2021

import SwiftUI
import Swinject

@main
struct TemplateSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            getRootView()
        }
    }
    
    func getRootView() -> some View {
        let assembler = Assembler([AppAssembly(), RootAssembly()])
        let rootView = assembler.resolver.resolve(RootView.self, argument: assembler)!
        let appState = assembler.resolver.resolve(AppState.self)!
        let routing = assembler.resolver.resolve(Routing.self)!
        return rootView.environmentObject(appState).environmentObject(routing)
    }
}
