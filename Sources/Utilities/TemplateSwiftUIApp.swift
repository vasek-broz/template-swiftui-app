//  TemplateSwiftUIApp.swift
//  Created by Václav Brož on 12/8/2021

import SwiftUI
import Swinject

@main
struct TemplateSwiftUIApp: App {
    var body: some Scene {
        let assembler = Assembler()
        assembler.apply(assembly: DefaultTemplateAssembly())
        return WindowGroup {
            assembler.resolver.resolve(TemplateView.self)!
        }
    }
}
