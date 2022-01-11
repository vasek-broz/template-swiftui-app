//  TargetNetworkingProvider.swift
//  Created by Václav Brož on 20/12/2021

import Moya

struct TargetNetworkingProvider<Target: Targetable> {
    // MARK: - Properties
    private let cache: Cache<Target, Response>
    private let moyaProvider: MoyaProvider<Target>
    
    // MARK: - Initialiazer -
    init(cache: Cache<Target, Response>, mockingResponses: Bool = false, plugins: [Pluginable] = []) {
        self.cache = cache
        if mockingResponses {
            moyaProvider = .init(stubClosure: MoyaProvider.delayedStub(2), plugins: plugins)
        } else {
            moyaProvider = .init(plugins: plugins)
        }
    }
    
    // MARK: - Methods -
    func request(_ target: Target, ignoreCache: Bool = false) async throws -> Response  {
        if ignoreCache {
            return try await requestAndCacheResponse(target)
        } else {
            if let cachedResponse = cache[target] {
                return cachedResponse
            } else {
                return try await requestAndCacheResponse(target)
            }
        }
    }
    
    private func requestAndCacheResponse(_ target: Target) async throws -> Response {
        let response = try await moyaProvider.request(target)
        cache[target] = response
        return response
    }
}
