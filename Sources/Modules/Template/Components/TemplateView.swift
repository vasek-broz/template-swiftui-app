//  TemplateView.swift
//  Created by Václav Brož on 12/8/2021

import SwiftUI

// MARK: - View -
struct TemplateView: View {
    let interactor: TemplateInteractable
    let router: TemplateRoutable
    @StateObject var state: TemplateState
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var routingFlags: RoutingFlags
    
    var body: some View {
        EmptyView()
    }
}

// MARK: - PreviewProvider -
#if DEBUG
struct TemplateViewPreviewProvider: PreviewProvider {
    static var previews: some View {
        previewAssembler.apply(assembly: PreviewTemplateAssembly())
        return previewAssembler.resolver.resolve(TemplateView.self)!
    }
}
#endif
