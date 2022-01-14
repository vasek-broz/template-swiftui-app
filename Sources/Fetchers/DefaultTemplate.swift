//  DefaultTemplate.swift
//  Created by Václav Brož on 20/12/2021

import Foundation

struct DefaultTemplateFetcher {
    let provider: TargetNetworkingProvider<TemplateTarget>
    let javascriptObjectNotationDecoder = JSONDecoder()
}

extension DefaultTemplateFetcher: TemplateFetchable {
    func getTemplate(ignoreCache: Bool) async throws -> String {
        let response = try await provider.request(.template, ignoreCache: ignoreCache)
        return try javascriptObjectNotationDecoder.decode(String.self, from: response.data)
    }
}
