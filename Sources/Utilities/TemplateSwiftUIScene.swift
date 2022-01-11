//  TemplateSwiftUIScene.swift
//  Created by Václav Brož on 24/9/2021

import SwiftUI
import Swinject

struct TemplateSwiftUIScene: Scene {
    @Environment(\.scenePhase) private var scenePhase
    let assembler: Assembler
    @StateObject var appState: AppState

    var body: some Scene {
        WindowGroup {
            TemplateRoutingView(assembler: assembler)
                .environmentObject(appState)
        }
        .onChange(of: scenePhase) { phase in
            switch phase {
            case .active:
                break
            case .inactive:
                break
            case .background:
                break
            @unknown default:
                fatalError()
            }
        }
    }
}
