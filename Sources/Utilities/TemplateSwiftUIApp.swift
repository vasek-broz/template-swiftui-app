//  TemplateSwiftUIApp.swift
//  Created by Václav Brož on 12/8/2021

import SwiftUI
import Swinject

@main
struct TemplateSwiftUIApp: App {
    var body: some Scene {
        let assembler = Assembler()
        assembler.apply(assemblies: [AppAssembly(), DefaultTemplateAssembly()])
        let templateView = assembler.resolver.resolve(TemplateView.self, argument: assembler)!
        return WindowGroup {
            templateView
                .environmentObject(assembler.resolver.resolve(AppState.self)!)
                .environmentObject(assembler.resolver.resolve(Routing.self)!)
        }
    }
}
