//  TemplateTarget.swift
//  Created by Václav Brož on 17/12/2021

import Foundation
import Moya

enum TemplateTarget {
    case template
}

extension TemplateTarget: Targetable {
    var baseURL: URL {
        URL(string: "https://api.template.com")!
    }
    
    var path: String {
        switch self {
        case .template:
            return "/template"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .template:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .template:
            return "{\"template\": \"template\"}".data(using: .utf8)!
        }
    }
    
    var task: Task {
        switch self {
        case .template:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .template:
            return nil
        }
    }
}
