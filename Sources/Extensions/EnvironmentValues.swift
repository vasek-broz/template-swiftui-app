//  EnvironmentValues.swift
//  Created by Václav Brož on 30/11/2021

import SwiftUI
import Combine

extension EnvironmentValues {
    var deepLinkSubject: CurrentValueSubject<Deeplink?, Never> {
        get { self[DeeplinkSubjectEnvironmentKey.self] }
        set { self[DeeplinkSubjectEnvironmentKey.self] = newValue }
    }
}
