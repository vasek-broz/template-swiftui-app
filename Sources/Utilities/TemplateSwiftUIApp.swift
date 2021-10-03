//  TemplateSwiftUIApp.swift
//  Created by Václav Brož on 12/8/2021

import SwiftUI
import Swinject

@main
struct TemplateSwiftUIApp: App {
    // MARK: - Properties -
    @UIApplicationDelegateAdaptor(Delegate.self) var delegate
    let assembler = Assembler()
    
    // MARK: - Initialiazer -
    init() {
        assembler.apply(assembly: AppAssembly())
    }
    
    // MARK: - App Conformance -
    var body: some Scene {
        TemplateSwiftUIScene(assembler: assembler,
                             appState: assembler.resolver.resolve(AppState.self)!)
    }
    
    // MARK: - Nested Types -
    class Delegate: NSObject, UIApplicationDelegate {}
}
