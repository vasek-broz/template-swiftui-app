//  TemplateFetchable.swift
//  Created by Václav Brož on 17/12/2021

protocol TemplateFetchable {
    func getTemplate(ignoreCache: Bool) async throws -> Template
}
