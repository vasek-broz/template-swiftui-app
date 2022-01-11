//  DeeplinkSubject.swift
//  Created by Václav Brož on 30/11/2021

import SwiftUI
import Combine

struct DeeplinkSubjectEnvironmentKey: EnvironmentKey {
    static let defaultValue = CurrentValueSubject<Deeplink?, Never>(nil)
}
