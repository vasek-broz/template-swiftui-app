//  DefaultTemplateRoutingView.swift
//  Created by Václav Brož on 3/10/2021

import SwiftUI
import Combine
import Swinject

struct DefaultTemplateRoutingView: RoutingView {
    @Environment(\.deepLinkSubject) var deepLinkSubject: CurrentValueSubject<Deeplink?, Never>
    let assembler: Assembler

    var body: some View {
        assembler.apply(assembly: TemplateAssembly())
        return assembler.resolver.resolve(TemplateView.self, argument: self as TemplateRoutable)!
            .observeNotification(name: .dismissTemplate) { _ in }
            .onReceive(deepLinkSubject) { optionalDeepLink in
                guard let deepLink = optionalDeepLink else { return }
                handleDeeplink(deepLink)
            }
    }

    func handleDeeplink(_ deepLink: Deeplink) {}
}

extension DefaultTemplateRoutingView: TemplateRoutable {}
