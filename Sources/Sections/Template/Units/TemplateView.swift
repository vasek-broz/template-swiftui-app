//  TemplateView.swift
//  Created by Václav Brož on 12/8/2021

import SwiftUI

// MARK: - View -
struct TemplateView: View {
    let interactor: TemplateInteractable
    @StateObject var state: TemplateState
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        EmptyView()
    }
}

// MARK: - PreviewProvider -
#if DEBUG
struct TemplateViewPreviewProvider: PreviewProvider {
    static var previews: some View {
        previewAssembler.apply(assemblies: [PreviewTemplateAssembly(), AppAssembly()])
        let templateView = previewAssembler.resolver.resolve(TemplateView.self)!
        return templateView
            .environmentObject(previewAssembler.resolver.resolve(AppState.self)!)
            .environmentObject(previewAssembler.resolver.resolve(Routing.self)!)
    }
}
#endif
