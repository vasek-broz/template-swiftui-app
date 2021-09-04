//  RootProtocols.swift
//  Created by Václav Brož on 4/9/2021

import SwiftUI

// MARK: - ChildViewsFactorable -
protocol RootChildViewsFactorable {
    func getTemplate() -> AnyView
}
